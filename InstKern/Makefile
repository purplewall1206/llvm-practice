all: instKern  statistic


instKern:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./instkern.cpp -o LLVMInstKern.so `llvm-config --ldflags`


statistic:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./statistic.cpp -o LLVMstatistic.so `llvm-config --ldflags`

inst0:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./inst0.cpp -o LLVMinstkern.so `llvm-config --ldflags`

inst1:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./inst1.cpp -o llvminst1.so `llvm-config --ldflags`

inst2:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./inst2.cpp -o llvminst2.so `llvm-config --ldflags`

opt-inst0:
	opt -load ./LLVMinstkern.so -inst acl.ll -o acl-inst.bc
	llvm-dis acl-inst.bc
	llc -code-model=kernel --filetype=obj acl-inst.bc -o acl.o
	gcc test/test.o test/impl.o
	./a.out

opt-inst1:
	opt -load ./llvminst1.so -inst test/test.ll -o test/test.bc
	llc --filetype=obj test/test.bc -o test/test.o
	
opt-inst2:
	opt -load ./llvminst2.so -S -inst test/test.ll -o test-inst.ll

opt-s:  statistic
	opt -load ./LLVMstatistic.so -inst -analyze acl.ll

cp:
	cp LLVMstatistic.so ~/Documents/linux-5.10.25/LLVMinstkern.so

 