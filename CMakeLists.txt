cmake_minimum_required(VERSION 3.14)
project(OpenGLCppTemplate LANGUAGES CXX)

set(TARGET executable)
# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

file(GLOB_RECURSE SRC_FILES src/**.cpp)
add_executable(${TARGET} ${SRC_FILES})

# track dependencies between source files (Pretty good tracking ngl)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

include_directories(src ext)

# configure GLFW dependency
include(cmake/SetupGLFW.cmake)
target_link_libraries(${TARGET} glfw)

