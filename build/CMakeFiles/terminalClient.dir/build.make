# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ilyagu/MonKeys

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ilyagu/MonKeys/build

# Include any dependencies generated for this target.
include CMakeFiles/terminalClient.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/terminalClient.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/terminalClient.dir/flags.make

CMakeFiles/terminalClient.dir/terminalClient/main.cpp.o: CMakeFiles/terminalClient.dir/flags.make
CMakeFiles/terminalClient.dir/terminalClient/main.cpp.o: ../terminalClient/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ilyagu/MonKeys/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/terminalClient.dir/terminalClient/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/terminalClient.dir/terminalClient/main.cpp.o -c /home/ilyagu/MonKeys/terminalClient/main.cpp

CMakeFiles/terminalClient.dir/terminalClient/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/terminalClient.dir/terminalClient/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ilyagu/MonKeys/terminalClient/main.cpp > CMakeFiles/terminalClient.dir/terminalClient/main.cpp.i

CMakeFiles/terminalClient.dir/terminalClient/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/terminalClient.dir/terminalClient/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ilyagu/MonKeys/terminalClient/main.cpp -o CMakeFiles/terminalClient.dir/terminalClient/main.cpp.s

# Object files for target terminalClient
terminalClient_OBJECTS = \
"CMakeFiles/terminalClient.dir/terminalClient/main.cpp.o"

# External object files for target terminalClient
terminalClient_EXTERNAL_OBJECTS =

terminalClient: CMakeFiles/terminalClient.dir/terminalClient/main.cpp.o
terminalClient: CMakeFiles/terminalClient.dir/build.make
terminalClient: /usr/lib/x86_64-linux-gnu/libpqxx.so
terminalClient: /usr/lib/x86_64-linux-gnu/libpq.so
terminalClient: libvisionLib.so
terminalClient: /usr/lib/x86_64-linux-gnu/libpqxx.so
terminalClient: /usr/lib/x86_64-linux-gnu/libpq.so
terminalClient: CMakeFiles/terminalClient.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ilyagu/MonKeys/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable terminalClient"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/terminalClient.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/terminalClient.dir/build: terminalClient

.PHONY : CMakeFiles/terminalClient.dir/build

CMakeFiles/terminalClient.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/terminalClient.dir/cmake_clean.cmake
.PHONY : CMakeFiles/terminalClient.dir/clean

CMakeFiles/terminalClient.dir/depend:
	cd /home/ilyagu/MonKeys/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ilyagu/MonKeys /home/ilyagu/MonKeys /home/ilyagu/MonKeys/build /home/ilyagu/MonKeys/build /home/ilyagu/MonKeys/build/CMakeFiles/terminalClient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/terminalClient.dir/depend
