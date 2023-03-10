cmake_minimum_required(VERSION 3.10)

project(ProjectNameHere)
set (FINAL_TARGET executableNameHere)

# adding all .h and .c files inside src directory as sources
file(GLOB_RECURSE SOURCE_FILES src/*.h src/*.c)
add_executable(${FINAL_TARGET} ${SOURCE_FILES})

include(FetchContent)

# configuring glfw
set(BUILD_SHARED_LIBS   ON )
set(GLFW_BUILD_EXAMPLES OFF)
set(GLFW_BUILD_TESTS    OFF)
set(GLFW_BUILD_DOCS     OFF)

# fetching glfw
FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw
    GIT_TAG 3.3.8
    SOURCE_DIR ${CMAKE_SOURCE_DIR}/ext/glfw
)
FetchContent_MakeAvailable(glfw)

# integrating glfw (and its dependencies) with project
add_dependencies(${FINAL_TARGET} glfw)
target_include_directories(${FINAL_TARGET} PRIVATE
    ${glfw_SOURCE_DIR}/include ${glfw_SOURCE_DIR}/deps
)
target_link_libraries(${FINAL_TARGET} PRIVATE glfw)
target_sources(${FINAL_TARGET} PRIVATE ${glfw_SOURCE_DIR}/deps/glad_gl.c)
# when build is done, copy glfw3.dll to where the executable is
add_custom_command(TARGET ${FINAL_TARGET} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy ${glfw_BINARY_DIR}/src/glfw3.dll ${CMAKE_BINARY_DIR}
)
