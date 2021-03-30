#include "header.h"

namespace
{
    struct OpcodeCounter : public FunctionPass
    {
        static char ID;
        OpcodeCounter() : FunctionPass(ID) {}

        bool runOnFunction(Function &F) override
        {
            std::map<std::string,int> opcode_map;//一个类似python中dict的类型，不了解python就理解成结构体

			errs() << "Function name: ";
			errs().write_escaped(F.getName()) << '\n';//显示遍历的函数名字
            for (Function::iterator bb = F.begin(), e = F.end(); bb != e;bb++) {
                errs() << "BasicBlock name: " << bb->getName() << "\n";
                errs() << "BasicBlock size: " << bb->size() << "\n";
                for (BasicBlock::iterator i = bb->begin(), i2 = bb->end(); i != i2;i++) {
                    errs() << "      " << *i << "\n";

                    if (opcode_map.find(i->getOpcodeName()) == opcode_map.end()) {
                        opcode_map[i->getOpcodeName()] = 1;
                    } else {
                        opcode_map[i->getOpcodeName()] ++;
                    }


                    Instruction *inst = dyn_cast<Instruction>(i);
                    if (inst->getOpcode() == Instruction::Add) {
                        errs() << "      ------Instruction::Add-------" << "\n";
                        for (User *U : inst->users()) {
                            if (Instruction *Inst = dyn_cast<Instruction>(U)) {
                                errs()<<"result of add used in : "<<*Inst <<"\n";
                            }
                        }
                        for (Use &U : inst->operands()) {
                            Value *v = U.get();
                            errs()<<"input of add originate from : " <<*v<<"\n";
                        }
                    }
                }
            }
            errs()<<"------------------------------\nsummary:\n";//这里把前面数出来的各个运算符的个数显示出来
            auto i = opcode_map.begin();
            auto e = opcode_map.end();
            while (i != e) {
                errs() << "number of " << i->first << ":" << i->second << "\n";
                i++;
            }
            errs() << "\n";
            opcode_map.clear();
            return false;
        }
    };
}

char OpcodeCounter::ID = 0;
static RegisterPass<OpcodeCounter> X("opcode-test", "opcodeCounter pass test", 
                                    false, false);

static RegisterStandardPasses Y(
    PassManagerBuilder::EP_EarlyAsPossible,
    [](const PassManagerBuilder &builder, legacy::PassManagerBase &PM) {
        PM.add(new OpcodeCounter());
    }
);