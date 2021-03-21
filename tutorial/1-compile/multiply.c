
int mult() {
    int a = 5;
    int b = 3;
    int c = a * b;
    return c;
}

// clang -emit-llvm -S multiply.c -o multiply.ll
// clang -cc1 -emit-llvm multiply.c -o multiply1.ll