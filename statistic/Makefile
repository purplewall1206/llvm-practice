stat:
	clang-11 `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./statistic.cpp -o LLVMstatistic.so `llvm-config --ldflags` -l sqlite3

irstat:
	clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ./storestat.cpp -o LLVMirstatistic.so `llvm-config --ldflags`

opt:
	opt -load ./LLVMstatistic.so -inst ~/Documents/linux-5.10.25/fs/ext4/dir.ll -disable-output

b:
	clang-12 -Xclang -load -Xclang ./LLVMstatistic.so -Wp,-MMD,fs/ext4/.balloc.o.d -nostdinc -isystem /usr/lib/clang/11.1.0/include -I./arch/x86/include -I./arch/x86/include/generated -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -fmacro-prefix-map=./= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 -no-integrated-as -Werror=unknown-warning-option -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=none -m64 -mno-80387 -mstack-alignment=8 -mtune=generic -mno-red-zone -mcmodel=kernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mretpoline-external-thunk -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packed-member -O2 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-format-invalid-specifier -Wno-gnu -mno-global-merge -Wno-unused-const-variable -pg -mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=date-time -Werror=incompatible-pointer-types -Wno-initializer-overrides -Wno-format -Wno-sign-compare -Wno-format-zero-length -Wno-pointer-to-enum-cast -Wno-tautological-constant-out-of-range-compare  -DCONFIG_X86_X32_ABI   -fno-omit-frame-pointer -fno-optimize-sibling-calls   '-DKBUILD_MODFILE="fs/ext4/ext4"' '-DKBUILD_BASENAME="balloc"' '-DKBUILD_MODNAME="ext4"' -emit-llvm -S -c -o balloc.ll ~/Documents/linux-5.10.25/fs/ext4/balloc.c  

xclang:
	clang-12 -Xclang -load -Xclang ./LLVMstatistic.so -emit-llvm -S test.c -o test.ll 