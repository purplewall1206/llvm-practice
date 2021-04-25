#include "llvm/ADT/MapVector.h"
#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Type.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"

#include "llvm/Pass.h"
#include "llvm/IR/Constants.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"


#include <vector>
#include <algorithm>

using namespace llvm;

namespace {
    struct Inst2ModulePass : public ModulePass {
        static char ID;
        int extensionID = 1;
        int instructionsCount = 0;
        Inst2ModulePass() : ModulePass(ID) {}
        bool runOnModule(Module &M) override;
        std::vector<Instruction*> storeVec;
        std::vector<StringRef> exceptVec = {};
        // std::vector<Instruction*> entryVec;

        void generateStoreVec(Module &M);
        // bool declareFunction(Module &M, StringRef name);
        bool isException(StringRef name);
        Value* inst_cal_tag(Value* vaddr, IRBuilder<> &builder);
        Value* inst_get_rbp(IRBuilder<> &builder);
        void inst_check_tag(Value* vaddr, IRBuilder<> &builder);
    };

    bool Inst2ModulePass::isException(StringRef name) {
        if (std::find(exceptVec.begin(), exceptVec.end(), name) == exceptVec.end()) {
            return true;
        }
        return false;
    }

    void Inst2ModulePass::generateStoreVec(Module &M) {
        for (auto& F : M) {
            if (isException(F.getName())) {
                continue;
            }
            if (F.isDeclaration()) {
                continue;
            }
            for (auto& BB : F) {
                for (auto & Ins : BB) {
                    if (Ins.getOpcode() == Instruction::Store) {
                        storeVec.push_back(&Ins);
                    }
                }
            }
        }
    }

    // bool Inst2ModulePass::declareFunction(Module &M, StringRef name) {

    // }
    Value* Inst2ModulePass::inst_cal_tag(Value *v, IRBuilder<> &builder) {
        
    }

    bool Inst2ModulePass::runOnModule(Module &M)  {
        auto& CTX = M.getContext();
        outs() << "instructions : " << M.getInstructionCount() << "\n";
        outs() << "store instructions: " << storeVec.size() << "\n";

        
        return true;
    }

    


    char Inst2ModulePass::ID = 0;
    RegisterPass<Inst2ModulePass> 
        X (/*PassArg=*/"inst",
        /*Name=*/"Inst2ModulePass",
        /*CFGOnly=*/true,
        /*is_analysis=*/true);
}