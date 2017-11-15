#Author: Xin Luo
find_package(Qt5Core REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(PyQt5 REQUIRED)
find_package(SIP REQUIRED)
find_package(PythonLibs REQUIRED)
find_package(PYBIND11 REQUIRED)
include(SIPMacros)

set(PYQT_SIP_FLAGS ${PYQT5_SIP_FLAGS})
set(PYQT_SIP_DIR ${PYQT5_SIP_DIR})
separate_arguments(PYQT_SIP_FLAGS) # convert space separated values to a list
set(SIP_INCLUDES ${PYQT_SIP_DIR} sip)
set(SIP_CONCAT_PARTS 25)
set(SIP_EXTRA_FILES_DEPEND ${SIP_FILES})
set(SIP_EXTRA_OPTIONS ${PYQT_SIP_FLAGS} -o)
set(SIP_MOD_INCLUDES ${SIP_INCLUDE_DIR} ${PROJECT_SOURCE_DIR})

set(CPACK_PACKAGE_VERSION_MAJOR 1)
set(CPACK_PACKAGE_VERSION_MINOR 1)
set(CPACK_PACKAGE_VERSION_PATCH 0)
set(QTN_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")


set(SIP_EXTRA_LIBRARIES ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR}/QtnPropertyCore.lib ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR}/QtnPropertyWidget.lib ${PYTHON_LIBRARIES} )



#GENERATE_SIP_PYTHON_MODULE_CODE(_qtnProperty sip/QtnPropertymod.sip CPP_FILES)
#BUILD_SIP_PYTHON_MODULE(_qtnProperty ${CPP_FILES})

GENERATE_SIP_PYTHON_MODULE_CODE(_qtnPropertyCore sip/Core/PropertyCoremod.sip CPP_FILES)
BUILD_SIP_PYTHON_MODULE(_qtnPropertyCore ${CPP_FILES})
set(CPP_FILES_CORE ${CPP_FILES})

GENERATE_SIP_PYTHON_MODULE_CODE(_qtnPropertyWidget sip/Widget/PropertyWidgetmod.sip CPP_FILES)
BUILD_SIP_PYTHON_MODULE(_qtnPropertyWidget ${CPP_FILES})
set(CPP_FILES_WIDGET ${CPP_FILES})

get_property(qt5core_include TARGET Qt5::Core PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
get_property(qt5gui_include TARGET Qt5::Gui PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
get_property(qt5widgets_include TARGET Qt5::Widgets PROPERTY INTERFACE_INCLUDE_DIRECTORIES)


MESSAGE("SOURCE WIDGET" ${CPP_FILES_WIDGET})
MESSAGE("SOURCE CORE" ${CPP_FILES_CORE})


target_include_directories(_qtnPropertyCore
    PRIVATE 
    ${PYBIND11_INCLUDE_DIR}
    ${SIP_INCLUDE_DIR}
    ${qt5core_include}
    ${qt5gui_include}
    ${qt5widgets_include}
    )

target_link_libraries(_qtnPropertyCore
    Qt5::Core
    Qt5::Widgets
    )

target_include_directories(_qtnPropertyWidget
    PRIVATE 
    ${PYBIND11_INCLUDE_DIR}
    ${SIP_INCLUDE_DIR}
    ${qt5core_include}
    ${qt5gui_include}
    ${qt5widgets_include}
    )

target_link_libraries(_qtnPropertyWidget
    Qt5::Core
    Qt5::Widgets
    )

configure_file(
    setup.py.in
    ${EXECUTABLE_OUTPUT_PATH}/setup.py
    @ONLY
    )

add_custom_target(pyqtn DEPENDS _qtnProperty _qtnPropertyCore)

add_custom_command(TARGET pyqtn PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
    ${EXECUTABLE_OUTPUT_PATH}/setup.py ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR}/)

add_custom_command(TARGET pyqtn PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_CURRENT_SOURCE_DIR}/sip ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR}/sip)

add_custom_command(TARGET pyqtn PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_CURRENT_SOURCE_DIR}/pyqtn ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR}/pyqtn)

add_custom_command(TARGET pyqtn PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_CURRENT_SOURCE_DIR}/pyqtn/core ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR}/pyqtn/core)

add_custom_command(TARGET pyqtn PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_CURRENT_SOURCE_DIR}/pyqtn/widget ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR}/pyqtn/widget)

add_custom_command(TARGET pyqtn POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
    $<TARGET_FILE:_qtnPropertyCore> ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR})

add_custom_command(TARGET pyqtn POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
    $<TARGET_FILE:_qtnPropertyWidget> ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR})

add_custom_command(TARGET pyqtn POST_BUILD
    COMMAND 
    cd ${EXECUTABLE_OUTPUT_PATH}/${CMAKE_CFG_INTDIR} &&
    python setup.py bdist_wheel -d ../py)