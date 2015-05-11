
macro(create_cmake_module config_name)
    # write _LIBS _LIB_DIR _INCLUDE_DIRS 
    string(TOUPPER       "${config_name}" PROJECT)
    set(PROJECT_LIBS     "${LAST_PROJECT_LIBRARY}")
    set(PROJECT_LIB_DIR  "\"${CMAKE_BINARY_DIR}/lib/\"")
    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_BINARY_DIR})
    set(CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

    #status("CMAKE_SOURCE_DIR  : [${CMAKE_SOURCE_DIR}]")
    #status("CMAKE_BINARY_DIR  : [${CMAKE_BINARY_DIR}]")
    #status("CMAKE_MODULE_PATH : [${CMAKE_MODULE_PATH}]")
    #status("CMAKE_PREFIX_PATH : [${CMAKE_PREFIX_PATH}]")
    configure_file("${CMAKE_SOURCE_DIR}/cmake/template.cmake.in" "${CMAKE_BINARY_DIR}/${config_name}-config.cmake" IMMEDIATE @ONLY)
endmacro()

macro(create_config file_name)
    status("Parsing ${file_name}")
    configure_file("${CMAKE_CURRENT_SOURCE_DIR}/${file_name}.cmake.in" "${file_name}")
    list(APPEND PROJECT_INCLUDE_DIRS "\"${CMAKE_BINARY_DIR}\"")
    status("add to include: ${CMAKE_BINARY_DIR}")
endmacro()
