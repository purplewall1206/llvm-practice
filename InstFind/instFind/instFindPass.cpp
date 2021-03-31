#include "llvm/ADT/MapVector.h"
#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include <vector>

using namespace llvm;

// using ResultStaticCC = llvm::MapVector<const llvm::Function *, unsigned>;

// struct StaticCallCounter : public llvm::AnalysisInfoMixin<StaticCallCounter> {
// //   using Result = ResultStaticCC;
// //   Result run(llvm::Module &M, llvm::ModuleAnalysisManager &);
// //   Result runOnModule(llvm::Module &M);
//   bool run(llvm::Module &M, llvm::ModuleAnalysisManager &);
//   bool runOnModule(llvm::Module &M);

// private:
//   // A special type used by analysis passes to provide an address that
//   // identifies that particular analysis pass type.
//   static llvm::AnalysisKey Key;
//   friend struct llvm::AnalysisInfoMixin<StaticCallCounter>;
// };

struct InstFindModulePass : public llvm::ModulePass {
    static char ID;
    InstFindModulePass() : llvm::ModulePass(ID) {}
    bool runOnModule(llvm::Module &M) override;
    // The print method must be implemented by Legacy analysis passes in order to
    // print a human readable version of the analysis results:
    //    http://llvm.org/docs/WritingAnLLVMPass.html#the-print-method
    void print(llvm::raw_ostream &OutS, llvm::Module const *M) const override;

    // ResultStaticCC DirectCalls;
    // StaticCallCounter Impl;
};

// bool StaticCallCounter::runOnModule(Module &M) {
bool InstFindModulePass::runOnModule(Module &M) {
    llvm::MapVector<const llvm::Function *, unsigned> Res;

    std::vector<Instruction*> storeVec;
    std::vector<Instruction*> incallVec; 

    for (auto &Func : M) {
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
            }
        }
    }
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

    // return Res;
    return false;
}

// bool InstFindModulePass::runOnModule(llvm::Module &M) {
//     // DirectCalls = Impl.runOnModule(M);
//     Impl.runOnModule(M);
//     return false;
// }

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
    X(/*PassArg=*/"legacy-static-cc",
      /*Name=*/"InstFindModulePass",
      /*CFGOnly=*/true,
      /*is_analysis=*/true);
