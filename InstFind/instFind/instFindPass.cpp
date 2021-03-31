#include "llvm/ADT/MapVector.h"
#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/IRBuilder.h"

#include <vector>

using namespace llvm;


struct InstFindModulePass : public llvm::ModulePass {
    static char ID;
    InstFindModulePass() : llvm::ModulePass(ID) {}
    bool runOnModule(llvm::Module &M) override;
    void print(llvm::raw_ostream &OutS, llvm::Module const *M) const override;

    // self-define
    std::vector<Instruction*> storeVec;
    std::vector<Instruction*> incallVec; 
    std::vector<Instruction*> retVec;
    // get
    void findInstructions(Module &M);
    void printInstructions();
};


void InstFindModulePass::printInstructions() {
    errs() << "STORE : \n";
    for (auto Ins : storeVec) {
        errs() << *Ins << "\n";
        int count = 0;
        for (Use &U : Ins->operands()) {
            Value *v = U.get();
            errs()<<"   operands" << count++ << " : " <<*v<<"\n";
        }
        errs() << "\n";
    }

    errs() << "INDIRECT CALL : \n";
    for (auto Ins : incallVec) {
        errs() << *Ins << "\n";
        // auto *CB = dyn_cast<CallBase>(Ins);
        // for (int i = 0;i < CB->get)
        // for (User *U : Ins->users()) {
        //     if (Instruction *Inst = dyn_cast<Instruction>(U)) {
        //         errs()<<"result of add used in : "<<*Inst <<"\n";
        //     }
        // }
        int count = 0;
        for (Use &U : Ins->operands()) {
            Value *v = U.get();
            errs()<<"   operands" << count++ << " : " <<*v <<"\n";
        }
        errs() << "\n";
    }
}


void InstFindModulePass::findInstructions(Module &M) {
    for (auto &Func : M) {
        errs() << "Searching in " << Func.getName() << "\n";
        for (auto &BB : Func) {
            for (auto &Ins : BB) {
                if (Ins.getOpcode() == Instruction::Store) {
                    // errs() << Ins << "\n";
                    storeVec.push_back(&Ins);
                }
                if (Ins.getOpcode() == Instruction::Call) {
                    auto *CB = dyn_cast<CallBase>(&Ins);
                    if (CB->isIndirectCall()) {
                        // errs() << Ins << "\n";
                        incallVec.push_back(&Ins);
                    }
                }
                if (Ins.getOpcode() == Instruction::Ret) {
                    retVec.push_back(&Ins);
                }
            }
        }
    }
    
}

bool InstFindModulePass::runOnModule(Module &M) {

    findInstructions(M);
    // printInstructions();

    auto &CTX = M.getContext();
    PointerType *PrintfArgTy = PointerType::getUnqual(Type::getInt8Ty(CTX));

    // STEP 1: Inject the declaration of printf
    // ----------------------------------------
    // Create (or _get_ in cases where it's already available) the following
    // declaration in the IR module:
    //    declare i32 @printf(i8*, ...)
    // It corresponds to the following C declaration:
    //    int printf(char *, ...)
    FunctionType *PrintfTy = FunctionType::get(
        IntegerType::getInt32Ty(CTX),
        PrintfArgTy,
        /*IsVarArgs=*/true);

    FunctionCallee Printf = M.getOrInsertFunction("printf", PrintfTy);

    // Set attributes as per inferLibFuncAttributes in BuildLibCalls.cpp
    Function *PrintfF = dyn_cast<Function>(Printf.getCallee());
    PrintfF->setDoesNotThrow();
    PrintfF->addParamAttr(0, Attribute::NoCapture);
    PrintfF->addParamAttr(0, Attribute::ReadOnly);


    // STEP 2: Inject a global variable that will hold the printf format string
    // ------------------------------------------------------------------------
    llvm::Constant *PrintfFormatStr = llvm::ConstantDataArray::getString(
        CTX, "(llvm-tutor) Hello from: %s\n(llvm-tutor)   number of arguments: %d\n");

    Constant *PrintfFormatStrVar =
        M.getOrInsertGlobal("PrintfFormatStr", PrintfFormatStr->getType());
    dyn_cast<GlobalVariable>(PrintfFormatStrVar)->setInitializer(PrintfFormatStr);

    for (auto &F : M) {
        if (F.isDeclaration())
        continue;

        // Get an IR builder. Sets the insertion point to the top of the function
        IRBuilder<> Builder(&*F.getEntryBlock().getFirstInsertionPt());
        errs() << "output  " <<  *F.getEntryBlock().getFirstInsertionPt() << "\n";

        // IRBuilder<> Builder2(&*F.back().getFirstInsertionPt());

        // Inject a global variable that contains the function name
        auto FuncName = Builder.CreateGlobalStringPtr(F.getName());

        // Printf requires i8*, but PrintfFormatStrVar is an array: [n x i8]. Add
        // a cast: [n x i8] -> i8*
        llvm::Value *FormatStrPtr =
            Builder.CreatePointerCast(PrintfFormatStrVar, PrintfArgTy, "formatStr");


        // Finally, inject a call to printf
        Builder.CreateCall(
            Printf, {FormatStrPtr, FuncName, Builder.getInt32(F.arg_size())});

        // Builder2.CreateCall(
        //     Printf, {FormatStrPtr, FuncName, Builder.getInt32(F.arg_size())}
        // );        
    }

    for (auto &Ins : retVec) {
        IRBuilder<> Builder(Ins);
        errs() << "output  " <<  *Ins << "\n";
        auto FuncName = Builder.CreateGlobalStringPtr(Ins->getFunction()->getName());

        llvm::Value *FormatStrPtr =
            Builder.CreatePointerCast(PrintfFormatStrVar, PrintfArgTy, "formatStr");

        Builder.CreateCall(
            Printf, {FormatStrPtr, FuncName, Builder.getInt32(Ins->getFunction()->arg_size())});

    }
    return false;
}


void InstFindModulePass::print(raw_ostream &OutS, Module const *) const {
    OutS << "================================================="
        << "\n";
    OutS << "LLVM-TUTOR: static analysis results\n";
    OutS << "=================================================\n";
    const char *str1 = "NAME";
    const char *str2 = "#N DIRECT CALLS";
    OutS << format("%-20s %-10s\n", str1, str2);
    OutS << "-------------------------------------------------"
        << "\n";

    // for (auto &CallCount : DirectCalls) {
    //     OutS << format("%-20s %-10lu\n", CallCount.first->getName().str().c_str(),
    //                 CallCount.second);
    // }

    OutS << "-------------------------------------------------"
        << "\n\n";
}

char InstFindModulePass::ID = 0;

// #1 REGISTRATION FOR "opt -analyze -legacy-static-cc"
RegisterPass<InstFindModulePass>
    X(/*PassArg=*/"instfind",
      /*Name=*/"InstFindModulePass",
      /*CFGOnly=*/true,
      /*is_analysis=*/true);
