cmake_minimum_required(VERSION 2.8.12)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
include(cmake/general.cmake)

set_option(BUILD_TESTS    "Build Tests"     ON)
if(BUILD_TESTS)
    add_subdirectory("3rdparty")
endif()

add_lib_static("lib1" "src/lib1.cpp")

clear_dependency()
add_local_dependency("lib1")
add_app("app" "src/main.cpp")

if(BUILD_TESTS)
    add_dir_inc("src")
    add_local_dependency("lib1" "gtest")
    add_app("unittests" "tests")
endif()

set_solution("application")
