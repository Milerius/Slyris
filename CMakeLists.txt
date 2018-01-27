cmake_minimum_required(VERSION 3.9)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

option(SLYRIS_BUILD_TESTS "Build test of Slyris engine" OFF)


include(${CMAKE_MODULE_PATH}/unit_tests.cmake)
project(slyris)

add_executable(slyris example/main.cpp)

enable_testing()

if (SLYRIS_BUILD_TESTS)
    add_subdirectory(test)
endif()