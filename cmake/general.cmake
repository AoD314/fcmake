
macro(set_solution name)
    set(target_name ${name})
    project(${target_name})
endmacro()

include(project_utils REQUIRED)
include(dependency REQUIRED)

include(config REQUIRED)

include(status REQUIRED)
include(compiler REQUIRED)

macro(print_status)
    status("    sources: ")
    foreach(s ${target_global_list_code})
        status("        ${s}")
    endforeach()

    status("    libraries: ")
    foreach(l ${target_global_list_libs})
        if((${l} STREQUAL "debug") OR (${l} STREQUAL "optimized"))

        else()
            status("        ${l}")
        endif()
    endforeach()

    if (target_use_qt)
        status("    moc objects: ")
        foreach(m ${target_global_list_moc_obj})
            status("        ${m}")
        endforeach()
    endif()
endmacro()

include(add_library REQUIRED)
include(add_application REQUIRED)
include(add_documentation REQUIRED)
include(android REQUIRED)
