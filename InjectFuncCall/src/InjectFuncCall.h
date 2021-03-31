#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"

struct InjectFuncCall : public llvm::PassInfoMixin<InjectFuncCall> {
    llvm::PreservedAnalyses run(llvm::Module &M,
                                llvm::ModuleAnalysisManager &);
    bool runOnModule(llvm::Module &M);
};


struct LegacyInjectFuncCall : public llvm::ModulePass {
    static char ID;
    LegacyInjectFuncCall() : ModulePass(ID) {}
    bool runOnModule(llvm::Module &M) override;

    InjectFuncCall Impl;
};