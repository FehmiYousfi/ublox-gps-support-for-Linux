# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_SOURCE_DIR = /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/build

# Include any dependencies generated for this target.
include CMakeFiles/gprmc-static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/gprmc-static.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/gprmc-static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gprmc-static.dir/flags.make

CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o: CMakeFiles/gprmc-static.dir/flags.make
CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o: ../src/parsers/gprmc.c
CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o: CMakeFiles/gprmc-static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o -MF CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o.d -o CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o -c /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/src/parsers/gprmc.c

CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/src/parsers/gprmc.c > CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.i

CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/src/parsers/gprmc.c -o CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.s

# Object files for target gprmc-static
gprmc__static_OBJECTS = \
"CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o"

# External object files for target gprmc-static
gprmc__static_EXTERNAL_OBJECTS =

build/libgprmc-static.a: CMakeFiles/gprmc-static.dir/src/parsers/gprmc.c.o
build/libgprmc-static.a: CMakeFiles/gprmc-static.dir/build.make
build/libgprmc-static.a: CMakeFiles/gprmc-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library build/libgprmc-static.a"
	$(CMAKE_COMMAND) -P CMakeFiles/gprmc-static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gprmc-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gprmc-static.dir/build: build/libgprmc-static.a
.PHONY : CMakeFiles/gprmc-static.dir/build

CMakeFiles/gprmc-static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gprmc-static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gprmc-static.dir/clean

CMakeFiles/gprmc-static.dir/depend:
	cd /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/build /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/build /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/libnmea/build/CMakeFiles/gprmc-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gprmc-static.dir/depend

