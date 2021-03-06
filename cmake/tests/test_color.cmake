
macro(TEST_GLOBAL_COLOR)
    MSG_COLOR(STATUS ${blue} ${bold} "testing global color in" "blue bold" "mode")
endmacro()

macro(TEST_SPECIFIC_COLORS)
    MSG_BLUE(STATUS "testing" "blue" "color")
    MSG_YELLOW_BOLD(STATUS "testing" "yellow bold" "color")
    MSG_WHITE_BOLD(STATUS "testing" "white bold" "color")
    MSG_CYAN_BOLD(STATUS "testing" "cyan bold" "color")
    MSG_BLUE_BOLD(STATUS "testing" "blue bold" "color")
endmacro()

macro(TEST_ALL_COLOR)
    if (UNIX)
        set (color_list "${green}" "${red}" "${blue}" "${reset}")
        foreach(color IN LISTS color_list)
            message(STATUS "testing color: ${color}${reset}")
        endforeach()
    endif()
endmacro()