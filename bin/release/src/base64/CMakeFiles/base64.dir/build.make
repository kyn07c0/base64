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
CMAKE_BINARY_DIR = /home/yura/projects/cpp/base64/bin/release

# Include any dependencies generated for this target.
include src/base64/CMakeFiles/base64.dir/depend.make
# Include the progress variables for this target.
include src/base64/CMakeFiles/base64.dir/progress.make

# Include the compile flags for this target's objects.
include src/base64/CMakeFiles/base64.dir/flags.make

src/base64/CMakeFiles/base64.dir/base64.cpp.o: src/base64/CMakeFiles/base64.dir/flags.make
src/base64/CMakeFiles/base64.dir/base64.cpp.o: /home/yura/projects/cpp/base64/src/base64/base64.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yura/projects/cpp/base64/bin/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/base64/CMakeFiles/base64.dir/base64.cpp.o"
	cd /home/yura/projects/cpp/base64/bin/release/src/base64 && /usr/bin/g++-12 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/base64.dir/base64.cpp.o -c /home/yura/projects/cpp/base64/src/base64/base64.cpp

src/base64/CMakeFiles/base64.dir/base64.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/base64.dir/base64.cpp.i"
	cd /home/yura/projects/cpp/base64/bin/release/src/base64 && /usr/bin/g++-12 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yura/projects/cpp/base64/src/base64/base64.cpp > CMakeFiles/base64.dir/base64.cpp.i

src/base64/CMakeFiles/base64.dir/base64.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/base64.dir/base64.cpp.s"
	cd /home/yura/projects/cpp/base64/bin/release/src/base64 && /usr/bin/g++-12 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yura/projects/cpp/base64/src/base64/base64.cpp -o CMakeFiles/base64.dir/base64.cpp.s

# Object files for target base64
base64_OBJECTS = \
"CMakeFiles/base64.dir/base64.cpp.o"

# External object files for target base64
base64_EXTERNAL_OBJECTS =

src/base64/libbase64.a: src/base64/CMakeFiles/base64.dir/base64.cpp.o
src/base64/libbase64.a: src/base64/CMakeFiles/base64.dir/build.make
src/base64/libbase64.a: src/base64/CMakeFiles/base64.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yura/projects/cpp/base64/bin/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libbase64.a"
	cd /home/yura/projects/cpp/base64/bin/release/src/base64 && $(CMAKE_COMMAND) -P CMakeFiles/base64.dir/cmake_clean_target.cmake
	cd /home/yura/projects/cpp/base64/bin/release/src/base64 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/base64.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/base64/CMakeFiles/base64.dir/build: src/base64/libbase64.a
.PHONY : src/base64/CMakeFiles/base64.dir/build

src/base64/CMakeFiles/base64.dir/clean:
	cd /home/yura/projects/cpp/base64/bin/release/src/base64 && $(CMAKE_COMMAND) -P CMakeFiles/base64.dir/cmake_clean.cmake
.PHONY : src/base64/CMakeFiles/base64.dir/clean

src/base64/CMakeFiles/base64.dir/depend:
	cd /home/yura/projects/cpp/base64/bin/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yura/projects/cpp/base64 /home/yura/projects/cpp/base64/src/base64 /home/yura/projects/cpp/base64/bin/release /home/yura/projects/cpp/base64/bin/release/src/base64 /home/yura/projects/cpp/base64/bin/release/src/base64/CMakeFiles/base64.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/base64/CMakeFiles/base64.dir/depend

