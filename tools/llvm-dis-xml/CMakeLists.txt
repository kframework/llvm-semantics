cmake_minimum_required (VERSION 2.6)
project (llvm-dis-xml)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/make/Modules)

find_package(LLVM 3.0 REQUIRED)
include_directories(include)

if (NOT CMAKE_BUILD_TYPE)
  set (CMAKE_BUILD_TYPE "Release")
endif()
set (CMAKE_BUILD_TYPE "Debug")

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

enable_testing()

add_subdirectory (lib)
add_subdirectory (tools)
add_subdirectory (tests)
