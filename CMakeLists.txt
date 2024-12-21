cmake_minimum_required(VERSION 3.10)

# Project name
project(gps_collector)

# Compiler settings and flags
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror -g -Wno-unused-result -Wno-error=unused-result -Wno-unused-parameter -Wno-return-type -D _GNU_SOURCE -Wno-unused-variable")
set(CMAKE_VERBOSE_MAKEFILE "OFF")

set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

# Include directories
include_directories(
    ${CMAKE_SOURCE_DIR}/src
    ${CMAKE_SOURCE_DIR}/libnmea/src
    ${CMAKE_SOURCE_DIR}/libnmea/src/nmea
)

# Output executable
set(TARGET gps_collector)

# Source files
file(GLOB SRCS ${CMAKE_SOURCE_DIR}/src/*.c)
list(REMOVE_ITEM SRCS ${CMAKE_SOURCE_DIR}/src/cssl.c)
set(CSSL_SRC ${CMAKE_SOURCE_DIR}/src/cssl.c)
set(CJSON_SRCS
    ${CMAKE_SOURCE_DIR}/src/cJSON.c
    ${CMAKE_SOURCE_DIR}/src/cJSON_Utils.c
)

# Create build directory for libnmea
add_custom_target(
    build_libnmea ALL
    COMMAND ${CMAKE_COMMAND} -S ${CMAKE_SOURCE_DIR}/libnmea -B ${CMAKE_SOURCE_DIR}/libnmea/build -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -DBUILD_SHARED_LIBS=OFF
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_SOURCE_DIR}/libnmea/build
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Building static libraries from libnmea using CMakeLists.txt"
)
# Custom command to collect .a files from the build directory and copy them to the target build directory
add_custom_command(
    TARGET build_libnmea POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_SOURCE_DIR}/libnmea/build/build ${CMAKE_SOURCE_DIR}/build
    COMMENT "Collecting static libraries from libnmea/build/build to ${CMAKE_WORKING_DIRECTORY}/build"
)

# Optional: Specify the list of libraries to copy if needed
list(APPEND STATIC_LIBRARIES_TO_COPY ${CMAKE_SOURCE_DIR}/libnmea/build/build/*.a)

# Add executable target
add_executable(${TARGET} ${SRCS} ${CSSL_SRC} ${CJSON_SRCS})

# Add the build directory where the static libraries are located
link_directories(${CMAKE_SOURCE_DIR}/build)

# Link the target with the static libraries
target_link_libraries(${TARGET}
    ${CMAKE_SOURCE_DIR}/build/libnmea-static.a
    ${CMAKE_SOURCE_DIR}/build/libgprmc-static.a
)
# Custom command to clean libnmea build directory
add_custom_target(
    clean_libnmea
    COMMAND ${CMAKE_MAKE_PROGRAM} clean -C ${CMAKE_SOURCE_DIR}/libnmea
    COMMENT "Cleaning libnmea build directory"
)

# Clean target for CMake
set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES
    ${CMAKE_BINARY_DIR}/${TARGET}
    ${CMAKE_SOURCE_DIR}/libnmea/build
)

