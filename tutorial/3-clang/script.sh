clang test.c

clang test.c -E

clang -cc1 test.c -ast-dump

# -S参数和-emit-llvm参数保证为test.c代码生成LLVM汇编码
clang test.c -S -emit-llvm -o -

clang -S test.c -o -

clang -O3 -emit-llvm test.c -c -o test.bc

lli test.bc