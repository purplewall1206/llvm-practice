# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build

# Include any dependencies generated for this target.
include helloworld/CMakeFiles/HelloWorldPass.dir/depend.make

# Include the progress variables for this target.
include helloworld/CMakeFiles/HelloWorldPass.dir/progress.make

# Include the compile flags for this target's objects.
include helloworld/CMakeFiles/HelloWorldPass.dir/flags.make

helloworld/CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.o: helloworld/CMakeFiles/HelloWorldPass.dir/flags.make
helloworld/CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.o: ../helloworld/HelloWorld.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object helloworld/CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.o"
	cd /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/helloworld && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.o -c /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/helloworld/HelloWorld.cpp

helloworld/CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.i"
	cd /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/helloworld && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/helloworld/HelloWorld.cpp > CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.i

helloworld/CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.s"
	cd /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/helloworld && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/helloworld/HelloWorld.cpp -o CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.s

# Object files for target HelloWorldPass
HelloWorldPass_OBJECTS = \
"CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.o"

# External object files for target HelloWorldPass
HelloWorldPass_EXTERNAL_OBJECTS =

helloworld/libHelloWorldPass.so: helloworld/CMakeFiles/HelloWorldPass.dir/HelloWorld.cpp.o
helloworld/libHelloWorldPass.so: helloworld/CMakeFiles/HelloWorldPass.dir/build.make
helloworld/libHelloWorldPass.so: helloworld/CMakeFiles/HelloWorldPass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module libHelloWorldPass.so"
	cd /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/helloworld && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HelloWorldPass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
helloworld/CMakeFiles/HelloWorldPass.dir/build: helloworld/libHelloWorldPass.so

.PHONY : helloworld/CMakeFiles/HelloWorldPass.dir/build

helloworld/CMakeFiles/HelloWorldPass.dir/clean:
	cd /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/helloworld && $(CMAKE_COMMAND) -P CMakeFiles/HelloWorldPass.dir/cmake_clean.cmake
.PHONY : helloworld/CMakeFiles/HelloWorldPass.dir/clean

helloworld/CMakeFiles/HelloWorldPass.dir/depend:
	cd /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/helloworld /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/helloworld /home/wangzc/Documents/llvm-practice/tutorial/6-instrumentation/build/helloworld/CMakeFiles/HelloWorldPass.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : helloworld/CMakeFiles/HelloWorldPass.dir/depend

