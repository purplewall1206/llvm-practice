all: instKern  statistic


instKern:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./instkern.cpp -o LLVMInstKern.so `llvm-config --ldflags`


statistic:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./statistic.cpp -o LLVMstatistic.so `llvm-config --ldflags`

opt-s:  statistic
	opt -load ./LLVMstatistic.so -inst -analyze acl.ll

 