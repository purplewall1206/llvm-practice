#include "llvm/ADT/MapVector.h"
#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"

using namespace llvm;

namespace {
    struct InstKernModulePass : public llvm::ModulePass {
        static char ID;
        InstKernModulePass() : llvm::ModulePass(ID) {}
        bool runOnModule(llvm::Module &M) override;
    };

    bool InstKernModulePass::runOnModule(llvm::Module &M) {
        auto& CTX = M.getContext();
        Instruction* last;
        for (auto &F : M) {
            outs() << "searching in " << F.getName() << "\n";
            for (auto &BB : F) {
                for (auto &Ins : BB) {
                    if (Ins.getOpcode() == Instruction::Store) {
                        last = &Ins;
                        outs() << "    " << Ins << "\n";
                    }
                }
            }
            outs() << "\n";
        }
        IRBuilder<> Builder(last);

        PointerType *PrintfArgTy = PointerType::getUnqual(Type::getInt8Ty(CTX));

        // STEP1: inject declaration of printf
        FunctionType *PrintfTy = FunctionType::get(
            IntegerType::getInt32Ty(CTX),
            PrintfArgTy,
            true
        );

        FunctionCallee Printf = M.getOrInsertFunction("printf", PrintfTy);
        // Set attributes as per inferLibFuncAttributes in BuildLibCalls.cpp
        // Function *PrintfF = dyn_cast<Function>(Printf.getCallee());
        // PrintfF->setDoesNotThrow();
        // PrintfF->addParamAttr(0, Attribute::NoCapture);
        // PrintfF->addParamAttr(0, Attribute::ReadOnly);

        // STEP 2: Inject a global variable that will hold the printf format string
        llvm::Constant *PrintfFormatStr = llvm::ConstantDataArray::getString(
            CTX, 
            "(llvm-tutor) Hello from: %s\n"
        );

        Constant *PrintfFormatStrVar = M.getOrInsertGlobal(
            "PrintfFormatStr",
            PrintfFormatStr->getType()    
        );

        dyn_cast<GlobalVariable>(PrintfFormatStrVar)->setInitializer(PrintfFormatStr);
        llvm::Value *FormatStrPtr =
            Builder.CreatePointerCast(PrintfFormatStrVar, PrintfArgTy, "formatStr");

        Builder.CreateCall(
            Printf, 
            {FormatStrPtr, Builder.CreateGlobalStringPtr(last->getFunction()->getName()) }
        );
        return false;
    }


    char InstKernModulePass::ID = 0;

    // #1 REGISTRATION FOR "opt -analyze -legacy-static-cc"
    RegisterPass<InstKernModulePass>
        X(/*PassArg=*/"instkern",
        /*Name=*/"InstKernModulePass",
        /*CFGOnly=*/true,
        /*is_analysis=*/false);

}