cmake_minimum_required(VERSION 3.2)
project(base64_tests)

set(CMAKE_CXX_STANDARD 17)

include_directories(lib)

set(SOURCE_FILES main.cpp src/base64_tests.hpp)

add_executable(base64_tests ${SOURCE_FILES})
install(TARGETS base64_tests DESTINATION bin)