gcc -finstrument-functions entry-exit.c -o ee-gcc

clang -finstrument-functions  -o ee-llvm entry-exit.c 

./ee-gcc
./ee-llvm


gcc -finstrument-functions entry-exit.c header.h a.c -o ee-gcc
clang -finstrument-functions entry-exit.c header.h a.c 
# clang -finstrument-functions entry-exit.c header.h a.c -o ee-llvm
# clang-12: error: cannot specify -o when generating multiple output files