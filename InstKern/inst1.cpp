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

#include "llvm/Transforms/Utils/Cloning.h"

#include <vector>

using namespace llvm;

namespace {
    struct Inst0ModulePass : public ModulePass {
        static char ID;
        int instructionsCount = 0;
        Inst0ModulePass() : ModulePass(ID) {}
        bool runOnModule(Module &M) override;
        std::vector<Instruction*> storeVec;
        std::vector<Instruction*> entryVec;

    };

    bool Inst0ModulePass::runOnModule(Module &M)  {
        auto& CTX = M.getContext();
        outs() << "instructions : " << M.getInstructionCount() << "\n";
        instructionsCount = M.getInstructionCount();
        for (auto& F : M) {
            // 需要排除掉需要插装的函数
            if (F.getName() == "storeaddr" || F.getName() == "c_print") {
                outs() << F.getName() << "========\n";
                continue;
            }
            // 排除掉函数的声明
            if (!F.isDeclaration()) {
                // outs() << "   not -declaration " << F.getName() << "\n";
                Instruction *firstInst = &*F.getEntryBlock().getFirstInsertionPt();
                entryVec.push_back(firstInst);
                // outs() << "   " << *firstInst << "\n";
            }
            
            for (auto& BB : F) {
                for (auto& Ins : BB) {
                    // 如果编译的时候带着debug info，那么没有metadata/debuginfo 的函数不能插装
                    // inlinable function call in a function with debug info must have a !dbg location
                    // if (!Ins.hasMetadata()) {
                    //     continue;
                    // }
                    if (Ins.getOpcode() == Instruction::Store) {
                        storeVec.push_back(&Ins);
                    }
                }
            }
        }
        outs() << "entry instructions: " << entryVec.size() << "\n";
        outs() << "store instructions: " << storeVec.size() << "\n";

        // declare + insert
        // define dso_local i64 @getaddr1(i64 %0) #0 {
            
        // Type* intTy1 = Type::getInt1Ty(CTX);
        Type* intTy64 = Type::getInt64Ty(CTX);
        bool isVarArg = false;

        std::vector<Type*> funcParam;
        funcParam.push_back(intTy64);
        FunctionType *functionCallType = FunctionType::get(
            intTy64, funcParam, isVarArg 
        );

        M.getOrInsertFunction("getaddr", functionCallType);

        Function* getaddrFunc = M.getFunction("getaddr");

        outs() << "get function0: getaddr at " << getaddrFunc << "\n";

        // CallBase *CB = dyn_cast<CallBase>(getaddrFunc);
        // outs() << "get function1: getaddr at " << getaddrFunc << "\n";
        // outs() << CB->hasMetadata()  << "\n";

        // InlineFunctionInfo IFI(nullptr, nullptr, nullptr, nullptr, nullptr);
        // outs() << "get function2: getaddr at " << getaddrFunc << "\n";

        // InlineResult res = InlineFunction(*CB, IFI, nullptr, true, nullptr);
        // outs() << "get function3: getaddr at " << getaddrFunc << "\n";

        // outs() << res.isSuccess() << "\n";

        for (auto& Ins : storeVec) {
            std::vector<Value*> param;
            for (Use &U : Ins->operands()) {
                param.push_back(U.get());
            }
        //     outs() << Ins->getFunction()->getName() << ": " <<  *Ins  << ":" << Ins->hasMetadata() << "\n";
            IRBuilder<> builder(Ins);

            Function* storeaddrFunc = M.getFunction("getaddr");
            builder.CreateCall(storeaddrFunc, {builder.CreatePtrToInt(param[1], Type::getInt64Ty(CTX)) });
            builder.CreateCall(storeaddrFunc, {builder.CreatePtrToInt(param[1], Type::getInt64Ty(CTX)) });
            

        }
        
        return true;
    }

    


    char Inst0ModulePass::ID = 0;
    RegisterPass<Inst0ModulePass> 
        X (/*PassArg=*/"inst",
        /*Name=*/"Inst0ModulePass",
        /*CFGOnly=*/true,
        /*is_analysis=*/true);
}