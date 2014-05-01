
#MSVC_VERSION >= "1600"

if(CXX_MS)
    include(ProcessorCount)
    ProcessorCount(N)
    if(NOT N EQUAL 0)
        SET(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   /MP${N} ")
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP${N} ")
    endif()

    if(${ENABLE_ALLWARNING})
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Wp64 /Wall ")
        set(CMAKE_C_FLAGS     "${CMAKE_C_FLAGS} /Wp64 /Wall ")
    endif()

    if(${ENABLE_OPTIMIZATION})
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Ox /GL ")
        set(CMAKE_C_FLAGS     "${CMAKE_C_FLAGS} /Ox /GL ")
    endif()

    if(${ENABLE_RELEASE})
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  /O2 ")
        set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}    /O2 ")
    endif()

    if(${ENABLE_DEBUG_INFO})
        set(CMAKE_BUILD_TYPE "Debug")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  /Od ")
        set(CMAKE_C_FLAGS     "${CMAKE_C_FLAGS}  /Od ")
    endif()

    if(${ENABLE_SSE})
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  /arch:SSE ")
        set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}    /arch:SSE ")
    endif()

    if(${ENABLE_SSE2})
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  /arch:SSE2 ")
        set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}    /arch:SSE2 ")
    endif()

    if(${ENABLE_OPENMP})
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  /openmp ")
        set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}    /openmp ")
    endif()
endif()
