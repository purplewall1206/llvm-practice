clang -emit-llvm -S test1.c -o test1.ll
clang -emit-llvm -S test2.c -o test2.ll

llvm-as test1.ll -o test1.bc
llvm-as test2.ll -o test2.bc

llvm-link test1.bc test2.bc -o output.bc

# 执行
lli output.bc 