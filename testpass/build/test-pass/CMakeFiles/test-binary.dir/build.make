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
CMAKE_SOURCE_DIR = /home/wangzc/Documents/llvm-practice/testpass

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wangzc/Documents/llvm-practice/testpass/build

# Include any dependencies generated for this target.
include test-pass/CMakeFiles/test-binary.dir/depend.make

# Include the progress variables for this target.
include test-pass/CMakeFiles/test-binary.dir/progress.make

# Include the compile flags for this target's objects.
include test-pass/CMakeFiles/test-binary.dir/flags.make

test-pass/CMakeFiles/test-binary.dir/test.cpp.o: test-pass/CMakeFiles/test-binary.dir/flags.make
test-pass/CMakeFiles/test-binary.dir/test.cpp.o: ../test-pass/test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wangzc/Documents/llvm-practice/testpass/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test-pass/CMakeFiles/test-binary.dir/test.cpp.o"
	cd /home/wangzc/Documents/llvm-practice/testpass/build/test-pass && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-binary.dir/test.cpp.o -c /home/wangzc/Documents/llvm-practice/testpass/test-pass/test.cpp

test-pass/CMakeFiles/test-binary.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-binary.dir/test.cpp.i"
	cd /home/wangzc/Documents/llvm-practice/testpass/build/test-pass && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangzc/Documents/llvm-practice/testpass/test-pass/test.cpp > CMakeFiles/test-binary.dir/test.cpp.i

test-pass/CMakeFiles/test-binary.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-binary.dir/test.cpp.s"
	cd /home/wangzc/Documents/llvm-practice/testpass/build/test-pass && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangzc/Documents/llvm-practice/testpass/test-pass/test.cpp -o CMakeFiles/test-binary.dir/test.cpp.s

# Object files for target test-binary
test__binary_OBJECTS = \
"CMakeFiles/test-binary.dir/test.cpp.o"

# External object files for target test-binary
test__binary_EXTERNAL_OBJECTS =

test-pass/test-binary: test-pass/CMakeFiles/test-binary.dir/test.cpp.o
test-pass/test-binary: test-pass/CMakeFiles/test-binary.dir/build.make
test-pass/test-binary: test-pass/CMakeFiles/test-binary.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wangzc/Documents/llvm-practice/testpass/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test-binary"
	cd /home/wangzc/Documents/llvm-practice/testpass/build/test-pass && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-binary.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test-pass/CMakeFiles/test-binary.dir/build: test-pass/test-binary

.PHONY : test-pass/CMakeFiles/test-binary.dir/build

test-pass/CMakeFiles/test-binary.dir/clean:
	cd /home/wangzc/Documents/llvm-practice/testpass/build/test-pass && $(CMAKE_COMMAND) -P CMakeFiles/test-binary.dir/cmake_clean.cmake
.PHONY : test-pass/CMakeFiles/test-binary.dir/clean

test-pass/CMakeFiles/test-binary.dir/depend:
	cd /home/wangzc/Documents/llvm-practice/testpass/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangzc/Documents/llvm-practice/testpass /home/wangzc/Documents/llvm-practice/testpass/test-pass /home/wangzc/Documents/llvm-practice/testpass/build /home/wangzc/Documents/llvm-practice/testpass/build/test-pass /home/wangzc/Documents/llvm-practice/testpass/build/test-pass/CMakeFiles/test-binary.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test-pass/CMakeFiles/test-binary.dir/depend

