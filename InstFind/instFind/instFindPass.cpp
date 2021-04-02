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

#include <iostream>

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
    void insertHead(Module &M);
    void insertTail(Module &M);
    void insertStore(Module &M);
    void printStoreParam(Module &M);
    void printinCallParam(Module &M);
};




bool InstFindModulePass::runOnModule(Module &M) {

    findInstructions(M);
    // printInstructions();

    insertHead(M);
    insertTail(M);
    // insertStore(M);
    printStoreParam(M);
    printinCallParam(M);

    
    return false;
}

void InstFindModulePass::printinCallParam(Module &M) {
    auto &CTX = M.getContext();
    for (auto& Ins : incallVec) {
        errs() << *Ins << "\n";
        std::vector<Value*> vec;
        for (Use &U : Ins->operands()) {
            Value* v = U.get();
            vec.push_back(v);
            errs() << "   operands: " <<  *v << "  : " << v->getName() << " \n";
        }
        IRBuilder<> Builder(Ins);
        Function* print_lx64 = Ins->getFunction()->getParent()->getFunction("print_lx64");
        Builder.CreateCall(print_lx64, {Builder.CreateGlobalStringPtr((vec.back())->getName()), Builder.CreatePtrToInt(vec.back(), Type::getInt64Ty(CTX), "")});
    }
}

void InstFindModulePass::printStoreParam(Module &M) {
    Instruction* Ins = storeVec[0];
    errs() << *Ins << "\n";

    std::vector<Value*> v;
    IRBuilder<> Builder(Ins);
    Function* print_lx64 = Ins->getFunction()->getParent()->getFunction("print_lx64");
    for (Use &U : Ins->operands()) {
        v.push_back(U.get());
    }

    auto &CTX = M.getContext();
    Builder.CreateCall(print_lx64, {Builder.CreateGlobalStringPtr((v[0])->getName()), Builder.CreateZExt(v[0], Type::getInt64Ty(CTX), "")});
    Builder.CreateCall(print_lx64, {Builder.CreateGlobalStringPtr((v[1])->getName()), Builder.CreatePtrToInt(v[1], Type::getInt64Ty(CTX), "")});

// 0    store i32 %c, i32* %c.addr, align 4
// 1    store i32 1, i32* %retval, align 4
// 2    store i32 2, i32* %retval, align 4
// 3    store i32 0, i32* %retval, align 4
// 4    store i32 %call, i32* %res, align 4
// 5    store i32 %call2, i32* %res, align 4
// 6    store i32 (i32)* @x, i32 (i32)** %a, align 8
// 7    store i32 %call4, i32* %res, align 4
// 8    store i64 0, i64* %rbp, align 8
// 9    store i64 %4, i64* %rbp, align 8
// 10    store i64 %6, i64* %tmp, align 8
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
        if (StringRef("printtail").equals(Func.getName())  || StringRef("print_lx64").equals(Func.getName()))
            continue;
            
            
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

void InstFindModulePass::insertHead(Module &M) {
    auto &CTX = M.getContext();
    PointerType *PrintfArgTy = PointerType::getUnqual(Type::getInt8Ty(CTX));

    llvm::Constant *PrintfFormatStr = llvm::ConstantDataArray::getString(
        CTX, "(llvm-tutor) Hello from: %s   (llvm-tutor)   number of arguments: %d\n");

    Constant *PrintfFormatStrVar =
        M.getOrInsertGlobal("PrintfFormatStr", PrintfFormatStr->getType());
    dyn_cast<GlobalVariable>(PrintfFormatStrVar)->setInitializer(PrintfFormatStr);

    for (auto &F : M) {
        if (F.isDeclaration())
        continue;
        if (StringRef("printtail").equals(F.getName()) || StringRef("print_lx64").equals(F.getName()))
            continue;

        IRBuilder<> Builder(&*F.getEntryBlock().getFirstInsertionPt());
        errs() << "output  " <<  *F.getEntryBlock().getFirstInsertionPt() << "\n";

        auto FuncName = Builder.CreateGlobalStringPtr(F.getName());
        
        llvm::Value *FormatStrPtr =
            Builder.CreatePointerCast(PrintfFormatStrVar, PrintfArgTy, "formatStr");

        Function *func_printf = F.getParent()->getFunction("printf");
        Builder.CreateCall(func_printf, {FormatStrPtr, FuncName, Builder.getInt32(F.arg_size())});
    }
}


void InstFindModulePass::insertTail(Module &M) {
    for (auto &Ins : retVec) {
        IRBuilder<> Builder(Ins);
        errs() << *Ins << "\n";

        Value* name = Builder.CreateGlobalStringPtr(Ins->getFunction()->getName());
        Function *func_tail = Ins->getFunction()->getParent()->getFunction("printtail");
        Builder.CreateCall(func_tail, {name });
    }

}

void InstFindModulePass::insertStore(Module &M) {
    auto &CTX = M.getContext();
    IRBuilder<> Builder(storeVec[0]);
    Function* print_lx64 = storeVec[0]->getFunction()->getParent()->getFunction("print_lx64");

    FunctionType *Fty = FunctionType::get(IntegerType::getInt64Ty(CTX), false);

    InlineAsm* IA = InlineAsm::get(Fty, "movq %rbp, $0", "=r", false, false, InlineAsm::AD_ATT);
    Value *rbp = Builder.CreateCall(IA, {});
    rbp->setName(storeVec[0]->getFunction()->getName());
    
    Builder.CreateCall(print_lx64, {Builder.CreateGlobalStringPtr(rbp->getName()), rbp});
}

char InstFindModulePass::ID = 0;

// #1 REGISTRATION FOR "opt -analyze -legacy-static-cc"
RegisterPass<InstFindModulePass>
    X(/*PassArg=*/"instfind",
      /*Name=*/"InstFindModulePass",
      /*CFGOnly=*/true,
      /*is_analysis=*/true);
