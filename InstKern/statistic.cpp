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

#include <vector>

using namespace llvm;

namespace {
    struct StatisticModulePass : public ModulePass {
        static char ID;
        int instructionsCount = 0;
        StatisticModulePass() : ModulePass(ID) {}
        bool runOnModule(Module &M) override;
        void print(raw_ostream &OutS, const Module *M) const override ;
        std::vector<Instruction*> storeVec;
        std::vector<Instruction*> icallVec;
        std::vector<Instruction*> retVec;
        int storeWithoutDbgInfo = 0;
    };

    bool StatisticModulePass::runOnModule(Module &M)  {
        auto& CTX = M.getContext();
        outs() << "instructions : " << M.getInstructionCount() << "\n";
        instructionsCount = M.getInstructionCount();
        for (auto& F : M) {
            for (auto& BB : F) {
                for (auto& Ins : BB) {
                    if (Ins.getOpcode() == Instruction::Store) {
                        storeVec.push_back(&Ins);
                        if (!Ins.hasMetadata()) ++storeWithoutDbgInfo;
                    }
                    if (Ins.getOpcode() == Instruction::Call) {
                        auto *CB = dyn_cast<CallBase>(&Ins);
                        if (CB->isIndirectCall()) {
                            icallVec.push_back(&Ins);
                        }
                    }
                    if (Ins.getOpcode() == Instruction::Ret) {
                        retVec.push_back(&Ins);
                    }

                }
            }
        }

        outs() << "store instructions: " << storeVec.size() << "\n";
        outs() << "store without dbg info" << storeWithoutDbgInfo << "\n";
        outs() << "icall instructions: " << icallVec.size() << "\n";
        outs() << "ret   instructions: " << retVec.size() << "\n"; 
        return true;
    }

    void StatisticModulePass::print(raw_ostream &O, const Module *M) const {
        O << "========statistic output========\n";
        // 如果有-o那么这个函数则不会输出
        O << "instructions : " << instructionsCount << "\n";
        O << "store instructions: " << storeVec.size() << "\n";
        // for (auto& Ins : storeVec) {
        //     O << "    " << Ins->getFunction()->getName() << ":" << *Ins << "\n";
        // }
        O << "icall instructions: " << icallVec.size() << "\n";
        O << "ret   instructions: " << retVec.size() << "\n"; 
    }

    char StatisticModulePass::ID = 0;
    RegisterPass<StatisticModulePass> 
        X (/*PassArg=*/"inst",
        /*Name=*/"StatisticModulePass",
        /*CFGOnly=*/true,
        /*is_analysis=*/true);
}