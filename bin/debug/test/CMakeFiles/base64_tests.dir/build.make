# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yura/projects/cpp/base64

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yura/projects/cpp/base64/bin/debug

# Include any dependencies generated for this target.
include test/CMakeFiles/base64_tests.dir/depend.make
# Include the progress variables for this target.
include test/CMakeFiles/base64_tests.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/base64_tests.dir/flags.make

test/CMakeFiles/base64_tests.dir/main.cpp.o: test/CMakeFiles/base64_tests.dir/flags.make
test/CMakeFiles/base64_tests.dir/main.cpp.o: /home/yura/projects/cpp/base64/test/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yura/projects/cpp/base64/bin/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/base64_tests.dir/main.cpp.o"
	cd /home/yura/projects/cpp/base64/bin/debug/test && /usr/bin/g++-12 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/base64_tests.dir/main.cpp.o -c /home/yura/projects/cpp/base64/test/main.cpp

test/CMakeFiles/base64_tests.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/base64_tests.dir/main.cpp.i"
	cd /home/yura/projects/cpp/base64/bin/debug/test && /usr/bin/g++-12 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yura/projects/cpp/base64/test/main.cpp > CMakeFiles/base64_tests.dir/main.cpp.i

test/CMakeFiles/base64_tests.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/base64_tests.dir/main.cpp.s"
	cd /home/yura/projects/cpp/base64/bin/debug/test && /usr/bin/g++-12 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yura/projects/cpp/base64/test/main.cpp -o CMakeFiles/base64_tests.dir/main.cpp.s

# Object files for target base64_tests
base64_tests_OBJECTS = \
"CMakeFiles/base64_tests.dir/main.cpp.o"

# External object files for target base64_tests
base64_tests_EXTERNAL_OBJECTS =

test/base64_tests: test/CMakeFiles/base64_tests.dir/main.cpp.o
test/base64_tests: test/CMakeFiles/base64_tests.dir/build.make
test/base64_tests: test/CMakeFiles/base64_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yura/projects/cpp/base64/bin/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable base64_tests"
	cd /home/yura/projects/cpp/base64/bin/debug/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/base64_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/base64_tests.dir/build: test/base64_tests
.PHONY : test/CMakeFiles/base64_tests.dir/build

test/CMakeFiles/base64_tests.dir/clean:
	cd /home/yura/projects/cpp/base64/bin/debug/test && $(CMAKE_COMMAND) -P CMakeFiles/base64_tests.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/base64_tests.dir/clean

test/CMakeFiles/base64_tests.dir/depend:
	cd /home/yura/projects/cpp/base64/bin/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yura/projects/cpp/base64 /home/yura/projects/cpp/base64/test /home/yura/projects/cpp/base64/bin/debug /home/yura/projects/cpp/base64/bin/debug/test /home/yura/projects/cpp/base64/bin/debug/test/CMakeFiles/base64_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/base64_tests.dir/depend

