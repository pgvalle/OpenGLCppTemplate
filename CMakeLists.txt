cmake_minimum_required(VERSION 3.10)

project(ProjectNameHere)
set (FINAL_TARGET exampleProgram)

# adding all .c files inside src as sources
file(GLOB_RECURSE SOURCE_FILES ${CMAKE_SOURCE_DIR}/src/*.cpp)
add_executable(${FINAL_TARGET} ${SOURCE_FILES})
target_include_directories(${FINAL_TARGET} PRIVATE ${CMAKE_SOURCE_DIR}/ext)

find_package(glfw3 3.3 QUIET)
if(NOT glfw3_FOUND)
    include(FetchContent)

    FetchContent_Declare(
        glfw
        GIT_REPOSITORY https://github.com/glfw/glfw
        GIT_TAG 3.3.8
        SOURCE_DIR ext/glfw
    )
    # pre-configuration and download
    set(BUILD_SHARED_LIBS   OFF)
    set(GLFW_BUILD_EXAMPLES OFF)
    set(GLFW_BUILD_TESTS    OFF)
    set(GLFW_BUILD_DOCS     OFF)
    FetchContent_MakeAvailable(glfw)

    # integration
    add_dependencies(${FINAL_TARGET} glfw)
    target_include_directories(${FINAL_TARGET} PRIVATE ${glfw3_SOURCE_DIR}/include)
endif()

target_link_libraries(${FINAL_TARGET} PRIVATE glfw)
