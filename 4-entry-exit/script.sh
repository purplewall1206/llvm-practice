gcc -finstrument-functions entry-exit.c -o ee-gcc

clang -finstrument-functions  -o ee-llvm entry-exit.c 

./ee-gcc
./ee-llvm