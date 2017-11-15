cmake_minimum_required(VERSION 3.0.0)

SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS ON)
cmake_policy(SET CMP0020 NEW)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

#
project(QtnProperty)

set(QT_VERSION 5.9.1)

if(CMAKE_SIZEOF_VOID_P MATCHES 8)
    set(ARCH_STR "x64")
else()
    set(ARCH_STR "x86")
endif()

#
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

#
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)


#Platform 
set(SDK_ROOT c:/sdk/${MSVC_VERSION}/${ARCH_STR})

set(QT_INSTALL_PATH ${SDK_ROOT}/Qt${QT_VERSION})
set(CMAKE_PREFIX_PATH ${QT_INSTALL_PATH})

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

add_subdirectory(python)
