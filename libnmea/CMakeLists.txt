# Minimum CMake version
cmake_minimum_required(VERSION 3.10)

# Project Name
project(nmea_lib)

# Build options
option(NMEA_STATIC "Enable static build" OFF)

set(BUILD_SHARED_LIBS "OFF")
set(CMAKE_VERBOSE_MAKEFILE "OFF")

set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

# Compiler and flags
set(CMAKE_C_FLAGS "-fPIC -g -Wall -Wno-return-type ")

# Include directories
include_directories(src src/nmea src/parsers)

# Source files
if(NMEA_STATIC)
    set(SRC_FILES src/nmea/nmea.c src/nmea/parser_static.c)
    string(REPLACE "," " " PARSER_STATIC_LIST "${NMEA_STATIC}")
    foreach(PARSER IN LISTS PARSER_STATIC_LIST)
        add_definitions(-DENABLE_${PARSER})
    endforeach()
    add_definitions(-DSTATIC)
    add_definitions(-DPARSER_COUNT=${PARSER_STATIC_LIST_LENGTH})
else()
    set(SRC_FILES src/nmea/nmea.c src/nmea/parser.c)
endif()

# Parser source files
file(GLOB SRC_PARSERS "src/parsers/*.c")
list(REMOVE_ITEM SRC_PARSERS "src/parsers/parse.c")
set(SRC_PARSER_DEP "src/parsers/parse.c")

# Object files
set(OBJ_FILES "")
foreach(SRC ${SRC_FILES})
    get_filename_component(SRC_NAME ${SRC} NAME_WE)
    list(APPEND OBJ_FILES "${CMAKE_CURRENT_BINARY_DIR}/${SRC_NAME}.o")
endforeach()

# Build library
# This variable will be set externally via `-D` when running CMake
# If BUILD_SHARED_LIBS is TRUE, shared libraries will be built, otherwise static libraries
if(NOT DEFINED BUILD_SHARED_LIBS)
    set(BUILD_SHARED_LIBS OFF CACHE BOOL "Build shared libraries")
endif()

set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/build)

# Check if shared build is requested
if(BUILD_SHARED_LIBS)
    # Create shared library for nmea
    add_library(nmea SHARED ${SRC_FILES} ${SRC_PARSER_DEP})
    set_target_properties(nmea PROPERTIES OUTPUT_NAME "nmea")
    set_target_properties(nmea PROPERTIES VERSION 1.0)

    # Create shared libraries for each parser
    foreach(src_file ${SRC_PARSERS})
        get_filename_component(lib_name ${src_file} NAME_WE)
        add_library(${lib_name} SHARED ${src_file})
        set_target_properties(${lib_name} PROPERTIES OUTPUT_NAME "${lib_name}")
        set_target_properties(${lib_name} PROPERTIES VERSION 1.0)
    endforeach()
else()
    # Create static library for nmea
    add_library(nmea-static STATIC ${SRC_FILES} ${SRC_PARSER_DEP})
    set_target_properties(nmea-static PROPERTIES OUTPUT_NAME "nmea-static")
    set_target_properties(nmea-static PROPERTIES VERSION 1.0)

    # Create static libraries for each parser
    foreach(src_file ${SRC_PARSERS})
        get_filename_component(lib_name ${src_file} NAME_WE)
        add_library(${lib_name}-static STATIC ${src_file})
        set_target_properties(${lib_name}-static PROPERTIES OUTPUT_NAME "${lib_name}-static")
        set_target_properties(${lib_name}-static PROPERTIES VERSION 1.0)
    endforeach()
endif()

# Linker flags for shared library (if not building static)
if(BUILD_SHARED_LIBS)
    target_link_libraries(nmea dl)
    set_target_properties(nmea PROPERTIES LINK_FLAGS "-shared -fvisibility=hidden -Wl,--exclude-libs=ALL,--no-as-needed")
    # Installation
    install(TARGETS nmea DESTINATION lib)
    install(DIRECTORY src/nmea DESTINATION include FILES_MATCHING PATTERN "*.h")
    install(DIRECTORY src/parsers DESTINATION include FILES_MATCHING PATTERN "*.h")
endif()
# Examples
file(GLOB SRC_EXAMPLES "examples/*.c")
foreach(EXAMPLE_SRC ${SRC_EXAMPLES})
    get_filename_component(EXAMPLE_NAME ${EXAMPLE_SRC} NAME_WE)
    add_executable(${EXAMPLE_NAME} ${EXAMPLE_SRC})
    target_link_libraries(${EXAMPLE_NAME} nmea)
endforeach()

# Clean target
add_custom_target(clean-all
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}/build
    COMMAND ${CMAKE_COMMAND} -E remove -f ${OBJ_FILES}
    COMMENT "Cleaning up..."
)

# Tests (optional)
add_custom_target(unit-tests
    COMMAND ${CMAKE_COMMAND} -E echo "Unit tests are currently not implemented in this CMakeLists."
    COMMENT "Run unit tests"
)
