cmake_minimum_required(VERSION 2.8)

set(PROJ "Hydrax")

option(${PROJ}_USE_BOOST "Use Boost (when Ogre compiled with Boost)" ON)

project(${PROJ})

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/ ${CMAKE_MODULE_PATH})

message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")

find_package(OGRE REQUIRED)

set(${PROJ}_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include"})

set(INCLUDE_DIRS
        ${OGRE_INCLUDE_DIR}
        ${${PROJ}_INCLUDE_DIR})

if((${OGRE_VERSION} VERSION_EQUAL "1.9.0") OR (${OGRE_VERSION} VERSION_GREATER "1.9.0"))
	list(APPEND INCLUDE_DIRS ${OGRE_Overlay_INCLUDE_DIR})
	message("Overlay: ${OGRE_Overlay_INCLUDE_DIR}")
endif()
message("OGRE_VER: ${OGRE_VERSION}")

if(${PROJ}_USE_BOOST)
        find_package(Boost REQUIRED)
        set(INCLUDE_DIRS ${INCLUDE_DIRS} ${Boost_INCLUDE_DIRS})
        if(NOT Boost_FOUND)
                message("")
                message("---------------------------------------------")
                message("---- Seems that your system has not Boost.")
                message("---- Set Boost_DIR variable to Boost root dir")
                message("---- if Ogre built with Boost or uncheck ${PROJ}_USE_BOOST option.")
                message("---------------------------------------------")
                message("")
        endif()
endif()

include_directories(${INCLUDE_DIRS})

link_directories(${OGRE_LIB_DIR})


set(SOURCES_${PROJ}_BASE
    src/CfgFileManager.cpp
    src/DecalsManager.cpp
    src/Enums.cpp
    src/GodRaysManager.cpp
    src/GPUNormalMapManager.cpp
    src/Help.cpp
    src/Hydrax.cpp
    src/Image.cpp
    src/MaterialManager.cpp
    src/Mesh.cpp
    src/Prerequisites.cpp
    src/RttManager.cpp
    src/TextureManager.cpp)

set(SOURCES_${PROJ}_MODULES
    src/Modules/Module.cpp
    src/Modules/ProjectedGrid/ProjectedGrid.cpp
    src/Modules/RadialGrid/RadialGrid.cpp
    src/Modules/SimpleGrid/SimpleGrid.cpp)

set(SOURCES_${PROJ}_NOISE
    src/Noise/Noise.cpp
    src/Noise/FFT/FFT.cpp
    src/Noise/Perlin/Perlin.cpp
    src/Noise/Real/PressurePoint.cpp
    src/Noise/Real/Real.cpp
    src/Noise/Real/Wave.cpp)


set(HEADERS_${PROJ}
    include/CfgFileManager.h
    include/DecalsManager.h
    include/Enums.h
    include/GodRaysManager.h
    include/GPUNormalMapManager.h
    include/Help.h
    include/Hydrax.h
    include/Image.h
    include/MaterialManager.h
    include/Mesh.h
    include/Prerequisites.h
    include/RttManager.h
    include/TextureManager.h
    include/Modules/Module.h
    include/Noise/Noise.h)

set(${PROJ}_LIB "${PROJ}")

add_library(${${PROJ}_LIB} ${SOURCES_${PROJ}_BASE} ${SOURCES_${PROJ}_MODULES} ${SOURCES_${PROJ}_NOISE})

set(INCLUDE_INSTALL_DIR include/${PROJ})

install(TARGETS ${${PROJ}_LIB}
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib)


install(FILES ${HEADERS_${PROJ}} DESTINATION ${INCLUDE_INSTALL_DIR})

