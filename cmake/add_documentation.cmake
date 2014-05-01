macro(add_documentation TARGET PATH_TO_DOXYGEN)
    FIND_PACKAGE(Doxygen)
    IF(DOXYGEN_FOUND)
        SET( doxyfile_in          ${CMAKE_CURRENT_SOURCE_DIR}/${PATH_TO_DOXYGEN} )
        SET( doxyfile_out         ${PROJECT_BINARY_DIR}/docs/Doxyfile         )
        SET( doxy_html_index_file ${CMAKE_CURRENT_BINARY_DIR}/docs/html/index.html )

        CONFIGURE_FILE( ${doxyfile_in} ${doxyfile_out})

        ADD_CUSTOM_COMMAND( OUTPUT ${doxy_html_index_file}
                      COMMAND ${DOXYGEN_EXECUTABLE} ${doxyfile_out}
                      MAIN_DEPENDENCY ${doxyfile_out} ${doxyfile_in}
                      COMMENT "Generating HTML documentation")

        ADD_CUSTOM_TARGET( ${TARGET} ALL DEPENDS ${doxy_html_index_file} )

    ELSE(DOXYGEN_FOUND)
        MESSAGE(FATAL_ERROR "Doxygen not found. Doxygen is needed to build the documentation.")
    ENDIF(DOXYGEN_FOUND)
endmacro()
