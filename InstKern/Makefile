all: instKern  statistic


instKern:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./instkern.cpp -o LLVMInstKern.so `llvm-config --ldflags`


statistic:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./statistic.cpp -o LLVMstatistic.so `llvm-config --ldflags`

inst0:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./inst0.cpp -o LLVMinstkern.so `llvm-config --ldflags`

opt-inst0:
	opt -load ./LLVMinstkern.so -inst acl.ll -o acl-inst.bc
	llvm-dis acl-inst.bc
	llc -code-model=kernel --filetype=obj acl-inst.bc -o acl.o


opt-s:  statistic
	opt -load ./LLVMstatistic.so -inst -analyze acl.ll

cp:
	cp LLVMstatistic.so ~/Documents/linux-5.10.25/LLVMinstkern.so

 