cmake_minimum_required(VERSION 3.19)
project(project)

set(INSTALL_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
set(INSTALL_LIB_DIR ${PROJECT_SOURCE_DIR}/lib)
set(INSTALL_BIN_DIR ${PROJECT_SOURCE_DIR}/bin)

set(HEADERS_DIR ${PROJECT_SOURCE_DIR}/src/base64)

include_directories(${INSTALL_INCLUDE_DIR})
include_directories(${HEADERS_DIR})

add_subdirectory(src)
add_subdirectory(test)