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

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"


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
        std::vector<Instruction*> icallVec;
        std::vector<StringRef> exceptVec = {"printx"};
        // std::vector<Instruction*> entryVec;

        void generateVec(Module &M);
        // bool declareFunction(Module &M, StringRef name);
        bool isException(StringRef name);
        Value* inst_cal_tag(Value* vaddr, IRBuilder<> &builder, Module &M);
        Value* inst_get_rbp(IRBuilder<> &builder, Module &M);
        void inst_check_tag(Value* vaddr, IRBuilder<> &builder, Module &M);
        void inst_set_tag(Value* vaddr, IRBuilder<> &builder, Module &M);

        void declareCheck(Module& M);
    };

    void Inst2ModulePass::declareCheck(Module& M) {
        auto &CTX = M.getContext();
        // void ketag_check(unsigned long addr, char extID) 
        // define dso_local void @ketag_check(i64 %0, i8 signext %1) #0 {
        Type *voidTy = Type::getVoidTy(CTX);
        Type *int64Ty = Type::getInt64Ty(CTX);
        Type *int8Ty = Type::getInt8Ty(CTX);
        bool isVarArg = false;
        std::vector<Type*> funcParam;
        funcParam.push_back(int64Ty);
        funcParam.push_back(int8Ty);
        FunctionType *funcCallType = FunctionType::get(
            voidTy, funcParam, isVarArg
        );
        M.getOrInsertFunction("ketag_check", funcCallType);

        M.getOrInsertFunction("ketag_set_tag", funcCallType);

        Type *int8PtrTy = Type::getInt8PtrTy(CTX);
        std::vector<Type*> funcParam1 = {int8PtrTy};
        FunctionType *funcCallType1 = FunctionType::get(
            voidTy, funcParam1, isVarArg
        );
        M.getOrInsertFunction("ketag_print_func", funcCallType1);
    }

    bool Inst2ModulePass::isException(StringRef name) {
        if (std::find(exceptVec.begin(), exceptVec.end(), name) != exceptVec.end()) {
            // errs() << "is exception " << name << "\n";
            return true;
        }
        // errs() << "not exception " << name << "\n";
        return false;
    }

    void Inst2ModulePass::generateVec(Module &M) {
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
                    if (Ins.getOpcode() == Instruction::Call) {
                        auto *CB = dyn_cast<CallBase>(&Ins);
                        if (CB->isIndirectCall()) {
                            icallVec.push_back(&Ins);
                        }
                    }
                }
            }
        }
    }

    

    
    Value* Inst2ModulePass::inst_get_rbp(IRBuilder<> &builder, Module &M) {
        auto &CTX = M.getContext();
        FunctionType *Fty = FunctionType::get(IntegerType::getInt64Ty(CTX), false);
        InlineAsm* IA = InlineAsm::get(Fty, "movq %rbp, $0", "=r", false, false, InlineAsm::AD_ATT);
        Value *rbp = builder.CreateCall(IA, {});
        return rbp;
    }
    

    
    
    bool Inst2ModulePass::runOnModule(Module &M)  {
        auto& CTX = M.getContext();
        generateVec(M);
        declareCheck(M);
        outs() << "instructions : " << M.getInstructionCount() << "\n";
        outs() << "store instructions: " << storeVec.size() << "\n";
        outs() << "icall instructions: " << icallVec.size() << "\n";
        
        for (auto &F : M) {
            if (F.isDeclaration()) {
                continue;
            }
            Instruction *firstIns = &*F.getEntryBlock().getFirstInsertionPt();
            IRBuilder<> builder0(firstIns);

            Value *RBP = inst_get_rbp(builder0, M);

            Function *setFunc = M.getFunction("ketag_set_tag");
            builder0.CreateCall(setFunc, 
                { 
                    RBP, 
                    ConstantInt::get(Type::getInt8Ty(CTX), (char)(1 << extensionID))
                }
            );
            for (auto &BB : F) {
                 for (auto& Ins : BB) {
                    if (Ins.getOpcode() == Instruction::Ret) {
                        IRBuilder<> builder1(&Ins);
                        builder1.CreateCall(setFunc, 
                            { 
                                RBP,
                                ConstantInt::get(Type::getInt8Ty(CTX), 0b00000000)
                            }
                        );
                        break;
                    }
                }
            }
        }
        int c = 0;

        for (auto Ins : storeVec)
        {
            std::vector<Value*> param;
            for (Use &U : Ins->operands()) {
                param.push_back(U.get());
            }
            IRBuilder<> builder(Ins);
            Function *checkFunc = M.getFunction("ketag_check");
            builder.CreateCall(checkFunc, 
                { 
                    builder.CreatePtrToInt(param[1], Type::getInt64Ty(CTX)), 
                    ConstantInt::get(Type::getInt8Ty(CTX), (1 << extensionID))
                }
            );
        }

        for (auto Ins : icallVec) {
            auto *CB = dyn_cast<CallBase>(Ins);
            IRBuilder<> builder(Ins);
            Function *checkFunc = M.getFunction("ketag_check");
            builder.CreateCall(checkFunc, 
                { 
                    builder.CreatePtrToInt(CB->getCalledOperand(), Type::getInt64Ty(CTX)), 
                    ConstantInt::get(Type::getInt8Ty(CTX), (1 << extensionID))
                }
            );

        }

        return true;
    }

    


    
}

char Inst2ModulePass::ID = 0;
    RegisterPass<Inst2ModulePass> 
        X (/*PassArg=*/"inst",
        /*Name=*/"Inst2ModulePass",
        /*CFGOnly=*/true,
        /*is_analysis=*/true);

static void loadPass(const PassManagerBuilder &Builder, llvm::legacy::PassManagerBase &PM) {
    PM.add(new Inst2ModulePass());
}

// 这里设置clang -Xclang -load -Xclang ./mypass.so .... 执行pass的位置
static RegisterStandardPasses Y1(PassManagerBuilder::EP_OptimizerLast, loadPass);