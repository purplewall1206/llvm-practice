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
        Value* inst_cal_tag(Value* vaddr, IRBuilder<> &builder, Module &M);
        Value* inst_get_rbp(IRBuilder<> &builder, Module &M);
        void inst_check_tag(Value* vaddr, IRBuilder<> &builder, Module &M);
    };

    bool Inst2ModulePass::isException(StringRef name) {
        if (std::find(exceptVec.begin(), exceptVec.end(), name) != exceptVec.end()) {
            // errs() << "is exception " << name << "\n";
            return true;
        }
        // errs() << "not exception " << name << "\n";
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
    Value* Inst2ModulePass::inst_cal_tag(Value *vaddr, IRBuilder<> &builder, Module &M) {
// define dso_local i64 @cal_tag(i64 %0) #0 {
//   %2 = alloca i64, align 8
//   store i64 %0, i64* %2, align 8
//   %3 = load i64, i64* %2, align 8
//   %4 = lshr i64 %3, 3
//   %5 = add i64 %4, -2305904032109035520
//   ret i64 %5
// }
        auto &CTX = M.getContext();
        Type *intTy64 = Type::getInt64Ty(CTX);
        // outs() << "intty64\n";
        AllocaInst *AI = builder.CreateAlloca(intTy64, nullptr, "cal_tag_alloca2");
        Value *ST = builder.CreateStore(vaddr, AI, false);
        // errs() << "after store\n";
        LoadInst *LT = builder.CreateLoad(AI, "cal_tag_load3");
        // errs() << "after load\n";
        Value *LSHR = builder.CreateLShr(LT, 3, "cal_tag_lshr4", false);
        // errs() << "after lshr\n";
        Value *ADD = builder.CreateAdd(LSHR, ConstantInt::get(intTy64, 0xdfffc88000000000), "cal_tag_add5");
        // errs() << "after add\n";
        return ADD;
    }

    bool Inst2ModulePass::runOnModule(Module &M)  {
        auto& CTX = M.getContext();
        outs() << "instructions : " << M.getInstructionCount() << "\n";
        outs() << "store instructions: " << storeVec.size() << "\n";

        generateStoreVec(M);
        Instruction* Ins = storeVec[0];
        std::vector<Value*> param;
        for (Use &U : Ins->operands()) {
            param.push_back(U.get());
        }
        IRBuilder<> builder(Ins);
        inst_cal_tag(param[0], builder, M);
        return true;
    }

    


    char Inst2ModulePass::ID = 0;
    RegisterPass<Inst2ModulePass> 
        X (/*PassArg=*/"inst",
        /*Name=*/"Inst2ModulePass",
        /*CFGOnly=*/true,
        /*is_analysis=*/true);
}