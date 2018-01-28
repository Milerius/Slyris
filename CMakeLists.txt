cmake_minimum_required(VERSION 3.9)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

option(SLYRIS_BUILD_TESTS "Build test of Slyris engine" ON)
option(TEST_CMAKE_PERSONAL_FEATURES "test personal cmake features" OFF)

include(${CMAKE_MODULE_PATH}/color.cmake)
include(${CMAKE_MODULE_PATH}/unit_tests.cmake)

if (TEST_CMAKE_PERSONAL_FEATURES)
    include(${CMAKE_MODULE_PATH}/test_features.cmake)
endif ()

project(slyris)

add_executable(slyris example/main.cpp)

enable_testing()

if (SLYRIS_BUILD_TESTS)
    add_subdirectory(test)
endif ()