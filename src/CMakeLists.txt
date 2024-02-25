cmake_minimum_required(VERSION 3.2)
project(base64)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsized-deallocation -Wall")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")

#add_subdirectory(base64)
set(SOURCE_FILES main.cpp)

add_executable(base64 ${SOURCE_FILES})
#target_link_libraries(apps base64)
install(TARGETS base64 DESTINATION ${INSTALL_BIN_DIR})