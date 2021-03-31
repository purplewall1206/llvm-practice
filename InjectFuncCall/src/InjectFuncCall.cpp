#include "InjectFuncCall.h"

#include "llvm/IR/IRBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

#define DEBUG_TYPE "inject-func-call"

bool InjectFuncCall::runOnModule(Module &M) {
    bool InsertAtLeastOnePrintf = false;

    auto &CTX = M.getContext();
    PointerType *PrintfArgTy = PointerType::getUnqual(Type::getInt8Ty(CTX));

    // STEP1: inject declaration of printf
    FunctionType *PrintfTy = FunctionType::get(
        IntegerType::getInt32Ty(CTX),
        PrintfArgTy,
        true
    );

    FunctionCallee Printf = M.getOrInsertFunction("printf", PrintfTy);
    // Set attributes as per inferLibFuncAttributes in BuildLibCalls.cpp
    Function *PrintfF = dyn_cast<Function>(Printf.getCallee());
    PrintfF->setDoesNotThrow();
    PrintfF->addParamAttr(0, Attribute::NoCapture);
    PrintfF->addParamAttr(0, Attribute::ReadOnly);

    // STEP 2: Inject a global variable that will hold the printf format string
    llvm::Constant *PrintfFormatStr = llvm::ConstantDataArray::getString(
        CTX, 
        "(llvm-tutor) Hello from: %s\n(llvm-tutor)   number of arguments: %d\n"
    );

    Constant *PrintfFormatStrVar = M.getOrInsertGlobal(
        "PrintfFormatStr",
        PrintfFormatStr->getType()    
    );

    dyn_cast<GlobalVariable>(PrintfFormatStrVar)->setInitializer(PrintfFormatStr);


    // STEP 3: For each function in the module, inject a call to printf
    for (auto &F : M) {
        if (F.isDeclaration())
            continue;

        // Get an IR builder. Sets the insertion point to the top of the function
        IRBuilder<> Builder(&*F.getEntryBlock().getFirstInsertionPt());

        // Inject a global variable that contains the function name
        auto FuncName = Builder.CreateGlobalStringPtr(F.getName());

        // Printf requires i8*, but PrintfFormatStrVar is an array: [n x i8]. Add
        // a cast: [n x i8] -> i8*
        llvm::Value *FormatStrPtr =
            Builder.CreatePointerCast(PrintfFormatStrVar, PrintfArgTy, "formatStr");

        // The following is visible only if you pass -debug on the command line
        // *and* you have an assert build.
        LLVM_DEBUG(dbgs() << " Injecting call to printf inside " << F.getName()
                        << "\n");
        
        // Finally, inject a call to printf
        Builder.CreateCall(
            Printf, 
            {FormatStrPtr, FuncName, Builder.getInt32(F.arg_size())}
        );

        InsertAtLeastOnePrintf = true;
    }

    return InsertAtLeastOnePrintf;
}


PreservedAnalyses InjectFuncCall::run(llvm::Module &M,
                                       llvm::ModuleAnalysisManager &) {
    bool Changed =  runOnModule(M);

    return (Changed ? llvm::PreservedAnalyses::none()
                    : llvm::PreservedAnalyses::all());
};

bool LegacyInjectFuncCall::runOnModule(llvm::Module &M) {
    bool Changed = Impl.runOnModule(M);
    return Changed;
}

//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
llvm::PassPluginLibraryInfo getInjectFuncCallPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "inject-func-call", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, ModulePassManager &MPM,
                    ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "inject-func-call") {
                        MPM.addPass(InjectFuncCall());
                        return true;
                    }
                    return false;
                    });
            }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
    return getInjectFuncCallPluginInfo();
}

//-----------------------------------------------------------------------------
// Legacy PM Registration
//-----------------------------------------------------------------------------
char LegacyInjectFuncCall::ID = 0;

// Register the pass - required for (among others) opt
static RegisterPass<LegacyInjectFuncCall>
    X(/*PassArg=*/"legacy-inject-func-call", /*Name=*/"LegacyInjectFuncCall",
      /*CFGOnly=*/false, /*is_analysis=*/false);