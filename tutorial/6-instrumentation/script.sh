clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared Hello.cpp -o LLVMHello.so `llvm-config --ldflags`


/usr/bin/c++ -DSkeletonPass_EXPORTS -I/home/wangzc/Documents/llvm-project-master/install/include -fPIC   -D_GNU_SOURCE -D_DEBUG -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -fno-rtti -std=gnu++14 -o CMakeFiles/SkeletonPass.dir/Skeleton.cpp.o -c /home/wangzc/Documents/llvm-pass-tutorial/skeleton/Skeleton.cpp
[100%] Linking CXX shared module libSkeletonPass.so
cd /home/wangzc/Documents/llvm-pass-tutorial/build/skeleton && /usr/bin/cmake -E cmake_link_script CMakeFiles/SkeletonPass.dir/link.txt --verbose=1
/usr/bin/c++ -fPIC -shared  -o libSkeletonPass.so CMakeFiles/SkeletonPass.dir/Skeleton.cpp.o   -L/home/wangzc/Documents/llvm-project-master/install/lib 
make[2]: 离开目录“/home/wangzc/Documents/llvm-pass-tutorial/build”
[100%] Built target SkeletonPass
make[1]: 离开目录“/home/wangzc/Documents/llvm-pass-tutorial/build”
/usr/bin/cmake -E cmake_progress_start /home/wangzc/Documents/llvm-pass-tutorial/buil


clang  -I/home/wangzc/Documents/llvm-project-master/install/include -fPIC   -D_GNU_SOURCE -D_DEBUG -D__STDC_CONSTANT_MACROS \
-D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -fno-rtti -std=gnu++14 -o LLVMHelloWorld.cpp.o -c HelloWorld.cpp

clang -fPIC -shared -o LLVMHelloWorld.so  LLVMHelloWorld.cpp.o -L/home/wangzc/Documents/llvm-project-master/install/lib