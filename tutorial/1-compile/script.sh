clang -emit-llvm -S multiply.c -o multiply.ll

clang -cc1 -emit-llvm multiply.c -o multiply1.ll

llvm-as multiply.ll -o multiply.bc
hexdump -C multiply.bc 
llc multiply.bc -o multiply.s
clang -S multiply.bc  -o mul.s -fomit-frame-pointer

llvm-dis multiply.bc -o re-multiply.ll

# 优化内存访问，将局部变量从内存提升到寄存器
opt -mem2reg -S multiply.ll -o multiply-reg.ll