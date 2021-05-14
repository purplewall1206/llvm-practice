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
        Value *AI = builder.CreateAlloca(intTy64, nullptr, "alloca2");
        // errs() << "after alloca\n";
        StoreInst *ST = builder.CreateStore(builder.CreatePtrToInt(vaddr, intTy64, "vaddrtoi64"), AI, false);
        // errs() << "after store\n";
        LoadInst *LT = builder.CreateLoad(AI, "load3");
        // errs() << "after load\n";
        Value *LSHR = builder.CreateLShr(LT, 3, "lshr4", false);
        // errs() << "after lshr\n";
        Value *ADD = builder.CreateAdd(LSHR, ConstantInt::get(intTy64, 0xdfffc88000000000), "add5");
        // errs() << "after add\n";
        return ADD;
    }

    
    Value* Inst2ModulePass::inst_get_rbp(IRBuilder<> &builder, Module &M) {
        auto &CTX = M.getContext();
        FunctionType *Fty = FunctionType::get(IntegerType::getInt64Ty(CTX), false);
        InlineAsm* IA = InlineAsm::get(Fty, "movq %rbp, $0", "=r", false, false, InlineAsm::AD_ATT);
        Value *rbp = builder.CreateCall(IA, {});
        return rbp;
    }
    
    // vaddr = inst_cal_tag()!!!
    void Inst2ModulePass::inst_set_tag(Value* vaddr, IRBuilder<> &builder, Module &M){
        // define dso_local void @set_tag(i64 %vaddr, i8 signext %1) #0 {
        //   %3 = alloca i64, align 8
        //   %4 = alloca i8, align 1
        //   %5 = alloca i8*, align 8
        //   store1 i64 %vaddr, i64* %3, align 8
        //   store2 i8 %1, i8* %4, align 1
        //   %6 = load i64, i64* %3, align 8
        //   %7 = inttoptr i64 %6 to i8*
        //   store3 i8* %7, i8** %5, align 8
        //   %8 = load i8, i8* %4, align 1
        //   %9 = load i8*, i8** %5, align 8
        //   store4 i8 %8, i8* %9, align 1
        //   ret void
        // }
        auto &CTX = M.getContext();
        Type *intTy1 = Type::getInt1Ty(CTX);
        Type *intTy8 = Type::getInt8Ty(CTX);
        Type *intTy64 = Type::getInt64Ty(CTX);
        Type *i8ptr = Type::getInt8PtrTy(CTX);
        Value *alloca3 = builder.CreateAlloca(intTy64, nullptr, "alloca3");
        Value *alloca4 = builder.CreateAlloca(intTy8, nullptr, "alloca4");
        Value *alloca5 = builder.CreateAlloca(i8ptr, nullptr, "alloca5");

        // errs() << "alloca\n";

        Value *store1 = builder.CreateStore(vaddr, alloca3, false);
        // errs() << "store\n";
        Value *eid = ConstantInt::get(intTy8, (0b10));
        Value *store2 = builder.CreateStore(eid, alloca4, false);
        // errs() << "store\n";

        Value *load6 = builder.CreateLoad(alloca3, "load6");
        Value *inttoptr7 = builder.CreateIntToPtr(load6, i8ptr, "inttoptr7");

        Value *store3 = builder.CreateStore(inttoptr7, alloca5, false);

        Value *load8 = builder.CreateLoad(alloca4, "load8");
        Value *load9 = builder.CreateLoad(alloca5, "load9");

        Value *store4 = builder.CreateStore(load8, load9, false);
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
            // Function* printFunc = M.getFunction("ketag_print_func");
            // builder0.CreateCall(printFunc, {builder0.CreateGlobalStringPtr(F.getName())} );
            Value *RBP = inst_get_rbp(builder0, M);
            // Value *TAG = inst_cal_tag(RBP, builder0, M);
            // inst_set_tag(TAG, builder0, M);
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
                        // inst_set_tag(TAG, builder1, M);
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
            // errs() << checkFunc->getName() <<  " " << checkFunc->getNumOperands() << "\n";
            // errs() << c++ << " " << *Ins << " " << Ins->getFunction() << " " << *param[1] << "\n";
            // if (c == 2) break;
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
            // outs() << "xxxxxxxx : " << *CB->getCalledOperand() << "\n";
        }
        // Instruction *Ins = storeVec[0];
        // Function *F = Ins->getFunction();
        // Instruction *firstIns = &*F->getEntryBlock().getFirstInsertionPt();
        // IRBuilder<> builder0(firstIns);
        // Value *RBP = inst_get_rbp(builder0, M);
        // Value *TAG = inst_cal_tag(RBP, builder0, M);
        // inst_set_tag(TAG, builder0, M);

        // for (auto& BB : *F) {
        //     for (auto& Ins : BB) {
        //         if (Ins.getOpcode() == Instruction::Ret) {
        //             IRBuilder<> builder1(&Ins);
        //             inst_set_tag(TAG, builder1, M);
        //             break;
        //         }
        //     }
        // }

        return true;
    }

    


    char Inst2ModulePass::ID = 0;
    RegisterPass<Inst2ModulePass> 
        X (/*PassArg=*/"inst",
        /*Name=*/"Inst2ModulePass",
        /*CFGOnly=*/true,
        /*is_analysis=*/true);
}