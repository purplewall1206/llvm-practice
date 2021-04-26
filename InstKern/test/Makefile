test.ll:
	clang -I./ -emit-llvm -S -c -o test.ll test.c

ketag.ll:
	clang -emit-llvm -S -c -o ketag.ll ketag.c


impl.ll:
	clang -I./ -emit-llvm -S -c impl.c
impl.o:
	clang -I./ -c impl.c

# test.o:
# 	llc --filetype=obj test.ll

