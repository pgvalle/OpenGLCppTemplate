set(GLFW_TAG 3.4)
set(GLFW_SOURCE_DIR ${CMAKE_BINARY_DIR}/glfw-${GLFW_TAG})

if(NOT EXISTS ${GLFW_SOURCE_DIR})
  message(STATUS "Downloading glfw ${GLFW_TAG}")
  file(
    DOWNLOAD https://github.com/glfw/glfw/releases/download/${GLFW_TAG}/glfw-${GLFW_TAG}.zip
    ${GLFW_SOURCE_DIR}.zip
  )
  message(STATUS "Downloading glfw ${GLFW_TAG} - done")

  message(STATUS "Extracting glfw ${GLFW_TAG}")
  file(ARCHIVE_EXTRACT INPUT ${GLFW_SOURCE_DIR}.zip)
  message(STATUS "Extracting glfw ${GLFW_TAG} - done")
endif()

set(GLFW_BUILD_EXAMPLES OFF)
set(GLFW_BUILD_TESTS OFF)
set(GLFW_BUILD_DOCS OFF)
set(GLFW_BUILD_X11 OFF)
set(GLFW_BUILD_WAYLAND ON)

add_subdirectory(${GLFW_SOURCE_DIR})
