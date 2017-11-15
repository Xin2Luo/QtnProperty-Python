#Author : Red Li

find_path(PYBIND11_INCLUDE_DIR pybind11/pybind11.h 
    PATHS ${SDK_ROOT}/*/include)
get_filename_component(PYBIND11_ROOT ${PYBIND11_INCLUDE_DIR} DIRECTORY)


find_path(PYBIND11_EXPORT_DIR pybind11Targets.cmake 
    PATHS ${PYBIND11_ROOT}/share/cmake/pybind11)

if(PYBIND11_INCLUDE_DIR AND PYBIND11_EXPORT_DIR)
    message(STATUS "PYBIND11 library found")

    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PYBIND11_EXPORT_DIR})
    include(${PYBIND11_EXPORT_DIR}/pybind11Targets.cmake)
    include(${PYBIND11_EXPORT_DIR}/pybind11Tools.cmake)
    set(PYBIND11_FOUND True)
else()
    message(WARNING "PYBIND11 library not found")
    set(PYBIND11_FOUND False)
endif()

