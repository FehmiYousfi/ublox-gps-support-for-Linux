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
CMAKE_SOURCE_DIR = /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build

# Include any dependencies generated for this target.
include CMakeFiles/gps_collector.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/gps_collector.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/gps_collector.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gps_collector.dir/flags.make

CMakeFiles/gps_collector.dir/src/cJSON.c.o: CMakeFiles/gps_collector.dir/flags.make
CMakeFiles/gps_collector.dir/src/cJSON.c.o: ../src/cJSON.c
CMakeFiles/gps_collector.dir/src/cJSON.c.o: CMakeFiles/gps_collector.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/gps_collector.dir/src/cJSON.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gps_collector.dir/src/cJSON.c.o -MF CMakeFiles/gps_collector.dir/src/cJSON.c.o.d -o CMakeFiles/gps_collector.dir/src/cJSON.c.o -c /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cJSON.c

CMakeFiles/gps_collector.dir/src/cJSON.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gps_collector.dir/src/cJSON.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cJSON.c > CMakeFiles/gps_collector.dir/src/cJSON.c.i

CMakeFiles/gps_collector.dir/src/cJSON.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gps_collector.dir/src/cJSON.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cJSON.c -o CMakeFiles/gps_collector.dir/src/cJSON.c.s

CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o: CMakeFiles/gps_collector.dir/flags.make
CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o: ../src/cJSON_Utils.c
CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o: CMakeFiles/gps_collector.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o -MF CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o.d -o CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o -c /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cJSON_Utils.c

CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cJSON_Utils.c > CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.i

CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cJSON_Utils.c -o CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.s

CMakeFiles/gps_collector.dir/src/main.c.o: CMakeFiles/gps_collector.dir/flags.make
CMakeFiles/gps_collector.dir/src/main.c.o: ../src/main.c
CMakeFiles/gps_collector.dir/src/main.c.o: CMakeFiles/gps_collector.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/gps_collector.dir/src/main.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gps_collector.dir/src/main.c.o -MF CMakeFiles/gps_collector.dir/src/main.c.o.d -o CMakeFiles/gps_collector.dir/src/main.c.o -c /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/main.c

CMakeFiles/gps_collector.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gps_collector.dir/src/main.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/main.c > CMakeFiles/gps_collector.dir/src/main.c.i

CMakeFiles/gps_collector.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gps_collector.dir/src/main.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/main.c -o CMakeFiles/gps_collector.dir/src/main.c.s

CMakeFiles/gps_collector.dir/src/neo_6m.c.o: CMakeFiles/gps_collector.dir/flags.make
CMakeFiles/gps_collector.dir/src/neo_6m.c.o: ../src/neo_6m.c
CMakeFiles/gps_collector.dir/src/neo_6m.c.o: CMakeFiles/gps_collector.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/gps_collector.dir/src/neo_6m.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gps_collector.dir/src/neo_6m.c.o -MF CMakeFiles/gps_collector.dir/src/neo_6m.c.o.d -o CMakeFiles/gps_collector.dir/src/neo_6m.c.o -c /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/neo_6m.c

CMakeFiles/gps_collector.dir/src/neo_6m.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gps_collector.dir/src/neo_6m.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/neo_6m.c > CMakeFiles/gps_collector.dir/src/neo_6m.c.i

CMakeFiles/gps_collector.dir/src/neo_6m.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gps_collector.dir/src/neo_6m.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/neo_6m.c -o CMakeFiles/gps_collector.dir/src/neo_6m.c.s

CMakeFiles/gps_collector.dir/src/cssl.c.o: CMakeFiles/gps_collector.dir/flags.make
CMakeFiles/gps_collector.dir/src/cssl.c.o: ../src/cssl.c
CMakeFiles/gps_collector.dir/src/cssl.c.o: CMakeFiles/gps_collector.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/gps_collector.dir/src/cssl.c.o"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gps_collector.dir/src/cssl.c.o -MF CMakeFiles/gps_collector.dir/src/cssl.c.o.d -o CMakeFiles/gps_collector.dir/src/cssl.c.o -c /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cssl.c

CMakeFiles/gps_collector.dir/src/cssl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gps_collector.dir/src/cssl.c.i"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cssl.c > CMakeFiles/gps_collector.dir/src/cssl.c.i

CMakeFiles/gps_collector.dir/src/cssl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gps_collector.dir/src/cssl.c.s"
	gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/src/cssl.c -o CMakeFiles/gps_collector.dir/src/cssl.c.s

# Object files for target gps_collector
gps_collector_OBJECTS = \
"CMakeFiles/gps_collector.dir/src/cJSON.c.o" \
"CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o" \
"CMakeFiles/gps_collector.dir/src/main.c.o" \
"CMakeFiles/gps_collector.dir/src/neo_6m.c.o" \
"CMakeFiles/gps_collector.dir/src/cssl.c.o"

# External object files for target gps_collector
gps_collector_EXTERNAL_OBJECTS =

gps_collector: CMakeFiles/gps_collector.dir/src/cJSON.c.o
gps_collector: CMakeFiles/gps_collector.dir/src/cJSON_Utils.c.o
gps_collector: CMakeFiles/gps_collector.dir/src/main.c.o
gps_collector: CMakeFiles/gps_collector.dir/src/neo_6m.c.o
gps_collector: CMakeFiles/gps_collector.dir/src/cssl.c.o
gps_collector: CMakeFiles/gps_collector.dir/build.make
gps_collector: libnmea-static.a
gps_collector: libgprmc-static.a
gps_collector: CMakeFiles/gps_collector.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable gps_collector"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gps_collector.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gps_collector.dir/build: gps_collector
.PHONY : CMakeFiles/gps_collector.dir/build

CMakeFiles/gps_collector.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gps_collector.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gps_collector.dir/clean

CMakeFiles/gps_collector.dir/depend:
	cd /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build /home/fyousfi/Desktop/UltimaRobotics/firmware/gps_collector/build/CMakeFiles/gps_collector.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gps_collector.dir/depend

