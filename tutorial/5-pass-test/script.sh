opt --disable-output -load ~/Documents/llvm-project-master/llvm-build/lib/LLVMHello.so -hello base.bc 
opt --disable-output -load ~/Documents/llvm-project-master/llvm-build/lib/LLVMHello.so -hello -time-passes base.bc 

opt -load ~/Documents/llvm-project-master/llvm-build/lib/LLVMHello.so -gvn -licm --disable-output --debug-pass=Structure base.bc 

opt -load ~/Documents/llvm-project-master/llvm-build/lib/LLVMHello.so -gvn -hello -licm --disable-output --debug-pass=Structure base.bc 

gdb opt
    break llvm::PassManager::run
    run base.bc -load ~/Documents/llvm-project-master/llvm-build/lib/LLVMHello.so -hello


clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared Hello.cpp -o LLVMHello.so `llvm-config --ldflags`