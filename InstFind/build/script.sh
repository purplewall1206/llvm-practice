# cmake ..
# make

# opt -load instFind/libinstFind.so -instfind -disable-output test.bc 
# opt -load instFind/libinstFind.so -instfind -analyse test.bc 
# opt -load instFind/libinstFind.so -instfind  test.bc -o test-transform.bc
# opt -load instFind/libinstFind.so -instfind  simple.bc -o simple-t.bc



# # test.bc
# clang -emit-llvm -c ../instFind/header.h ../instFind/test.c

# # a.out
# clang  ../instFind/header.h ../instFind/test.c

# # test.ll
# llvm-dis test.bc

# # test.s
# llc test.bc

# # test.o
# llc -filetype=obj test.bc 

# # a.out
# gcc test.o

clang -emit-llvm -c ../instFind/header.h ../instFind/test.c
opt -load instFind/libinstFind.so -instfind  test.bc -o test-transform.bc
llvm-dis test-transform.bc