include(GoogleTest)

###################### INTERNAL ####################################
macro(__internal_specific_unit_test_platform_configuration EXECUTABLE_NAME)
    if (WIN32)
        target_compile_definitions(${EXECUTABLE_NAME} PRIVATE _SILENCE_TR1_NAMESPACE_DEPRECATION_WARNING)
        ##DLL BASE CLASS WARNING SUPPRESION
        set_target_properties(${EXECUTABLE_NAME} PROPERTIES COMPILE_FLAGS "${CMAKE_CXX_FLAGS} /wd4251 /wd4275")
    endif (WIN32)
endmacro()

macro(__internal_specific_unit_test_properties EXECUTABLE_NAME)
    set_target_properties(${EXECUTABLE_NAME}
            PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
endmacro()
###################### INTERNAL ####################################

macro(CREATE_UNIT_TEST EXECUTABLE_NAME CTEST_NAME PREFIX_NAME SOURCES)
    add_executable(${EXECUTABLE_NAME} ${SOURCES})
    target_link_libraries(${EXECUTABLE_NAME} GTest::GTest GTest::Main)
    __internal_specific_unit_test_platform_configuration(${EXECUTABLE_NAME})
    __internal_specific_unit_test_properties(${EXECUTABLE_NAME})
    gtest_discover_tests(${EXECUTABLE_NAME} TEST_PREFIX ${PREFIX_NAME})
    add_test(NAME ${CTEST_NAME} COMMAND ${EXECUTABLE_NAME})
endmacro()