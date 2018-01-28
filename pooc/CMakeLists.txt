find_package(Boost REQUIRED COMPONENTS system filesystem)
add_executable(pooc main.cpp)
set_target_properties(pooc
        PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/lib"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/lib"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
add_library(graphics SHARED IPlugin.hpp SFMLPlugin.cpp)
set_target_properties(graphics
        PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/lib"
        LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/lib"
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
target_link_libraries(graphics Boost::system Boost::filesystem)
target_link_libraries(pooc Boost::system Boost::filesystem)
add_dependencies(pooc graphics)

if (UNIX)
    target_link_libraries(pooc ${CMAKE_DL_LIBS})
endif(UNIX)