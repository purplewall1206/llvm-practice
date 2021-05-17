#include "llvm/ADT/MapVector.h"
#include "llvm/IR/AbstractCallSite.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

#include "llvm/Transforms/IPO/PassManagerBuilder.h"

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include <sqlite3.h>
#include <vector>
#include <string>
#include <unistd.h>

using namespace llvm;

namespace {
    struct StatisticModulePass : public ModulePass {
        static char ID;
        unsigned int instructionsCount = 0;
        StatisticModulePass() : ModulePass(ID) {}
        bool runOnModule(Module &M) override;
        void print(raw_ostream &OutS, const Module *M) const override ;
        std::vector<Instruction*> storeVec;
        std::vector<Instruction*> icallVec;
        std::vector<Instruction*> callVec;
        std::vector<Instruction*> retVec;
        std::vector<Instruction*> loadVec;
        int storeWithoutDbgInfo = 0;
        // database
        sqlite3 *db;
        bool openDB();

    };

    bool StatisticModulePass::runOnModule(Module &M)  {
        auto& CTX = M.getContext();
        errs() << M.getName() << "\n";
        errs() << "          instructions : " << M.getInstructionCount() << "\n";
        instructionsCount = M.getInstructionCount();
        if (instructionsCount == 0) return true;
        for (auto& F : M) {
            if (F.isDeclaration()) continue;
            for (auto& BB : F) {
                for (auto& Ins : BB) {
                    if (Ins.getOpcode() == Instruction::Store) {
                        storeVec.push_back(&Ins);
                        // if (!Ins.hasMetadata()) ++storeWithoutDbgInfo;
                    }
                    if (Ins.getOpcode() == Instruction::Call) {
                        callVec.push_back(&Ins);
                        auto *CB = dyn_cast<CallBase>(&Ins);
                        if (CB->isIndirectCall()) {
                            icallVec.push_back(&Ins);
                        }
                    }
                    if (Ins.getOpcode() == Instruction::Ret) {
                        retVec.push_back(&Ins);
                    }

                    if (Ins.getOpcode() == Instruction::Load) {
                        loadVec.push_back(&Ins);
                    }

                }
            }
        }
        // if (icallVec.size() == 0) return false;
        outs() << "    store instructions: " << storeVec.size() << "\n";
        outs() << "    icall instructions: " << icallVec.size() << "\n";
        outs() << "    ret   instructions: " << retVec.size() << "\n"; 
        outs() << "    load  instructions: " << loadVec.size() << "\n";
        outs() << "    call  instructions: " << callVec.size() << "\n";



        int rc = sqlite3_open("ir-statistic.db", &db);
        if (rc) {
            errs() << "cannot open database " << sqlite3_errmsg(db) << "\n";
            return false;
        }
        llvm::Twine sql = "INSERT INTO INSTRUCTIONS (FILENAME, STORE, ICALL, RET, TOTAL, CALL, LOAD) VALUES "\
                            "(\"" + M.getName() + "\", " + std::to_string(storeVec.size()) + ", "\
                            + std::to_string(icallVec.size()) + ", " + std::to_string(retVec.size()) + ", "\
                            + std::to_string(instructionsCount) + ", " \
                            + std::to_string(callVec.size()) + ", " + std::to_string(loadVec.size()) + ")";
            
        outs() << sql << "\n";
        char *errmsg;
        std::string sql_cstr = (sql.str());
        rc = sqlite3_exec(db, sql_cstr.c_str(), NULL, NULL, &errmsg);

        if (rc != SQLITE_OK) {
            errs() << "database insert failed  "  << errmsg << "\n";
            sqlite3_free(errmsg);
        } 
        sqlite3_close(db);
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

    
}

char StatisticModulePass::ID = 0;
    RegisterPass<StatisticModulePass> 
        X (/*PassArg=*/"inst",
        /*Name=*/"StatisticModulePass",
        /*CFGOnly=*/true,
        /*is_analysis=*/true);

// static RegisterStandardPasses Y(
// PassManagerBuilder::EP_FullLinkTimeOptimizationEarly,
// [](const PassManagerBuilder &Builder,
//     legacy::PassManagerBase &PM) { PM.add(new StatisticModulePass()); });

static void loadPass(const PassManagerBuilder &Builder, llvm::legacy::PassManagerBase &PM) {
    PM.add(new StatisticModulePass());
}

// 这里设置clang -Xclang -load -Xclang ./mypass.so .... 执行pass的位置
static RegisterStandardPasses Y1(PassManagerBuilder::EP_OptimizerLast, loadPass);
// static RegisterStandardPasses Y2(PassManagerBuilder::EP_EnabledOnOptLevel0, loadPass);
// static RegisterStandardPasses Y3(PassManagerBuilder::EP_EarlyAsPossible , loadPass);
// static RegisterStandardPasses Y4(PassManagerBuilder::EP_ModuleOptimizerEarly, loadPass);
// static RegisterStandardPasses Y5(PassManagerBuilder::EP_LoopOptimizerEnd, loadPass);
// static RegisterStandardPasses Y6(PassManagerBuilder::EP_ScalarOptimizerLate, loadPass);
// static RegisterStandardPasses Y7(PassManagerBuilder::EP_VectorizerStart, loadPass);
// static RegisterStandardPasses Y8(PassManagerBuilder::EP_LateLoopOptimizations, loadPass);