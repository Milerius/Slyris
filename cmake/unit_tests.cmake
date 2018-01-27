include(GoogleTest)

macro(CREATE_UNIT_TEST EXECUTABLE_NAME CTEST_NAME PREFIX_NAME SOURCES)
    add_executable(${EXECUTABLE_NAME} ${SOURCES})
    target_link_libraries(${EXECUTABLE_NAME} GTest::GTest GTest::Main)
    set_target_properties(${EXECUTABLE_NAME}
            PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
            )
    gtest_discover_tests(${EXECUTABLE_NAME} TEST_PREFIX ${PREFIX_NAME})
    add_test(NAME ${CTEST_NAME} COMMAND ${EXECUTABLE_NAME})
endmacro()