cmake ..
make

opt -load instFind/libinstFind.so -legacy-static-cc -disable-output test.bc 
opt -load instFind/libinstFind.so -legacy-static-cc -disable-output -analyse test.bc 

# test.bc
clang -emit-llvm -c ../instFind/header.h ../instFind/test.c

# a.out
clang  ../instFind/header.h ../instFind/test.c

# test.ll
llvm-dis test.bc

# test.s
llc test.bc

# test.o
llc -filetype=obj test.bc 

# a.out
gcc test.o