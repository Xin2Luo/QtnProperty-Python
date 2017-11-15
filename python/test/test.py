import sys
import numpy as np
from PyQt5 import QtWidgets, QtCore, QtGui
from enum import Enum
import pyqtn


class SiEnum(Enum):
    Opt1 = 1
    Opt2 = 2
    Opt3 = 3


def button_callback(buttonObject):
    print("Click callback")
    print(dir(buttonObject))
    print(buttonObject.name())


def reset_callback(object):
    print("Reset callback")
    print(dir(object))
    print(object.name())


def bool_callback_get():
    print("bool callback get")
    return False


def bool_callback_set(val):
    print("bool callback set")


def bool_callback_accepted(val):
    print("bool accepted")
    return True


def bool_callback_equal(val):
    print("bool equal")
    return 1


def qpoint_callback_get():
    print("qpoint callback get")
    return QtCore.QPoint(-10, 10)


def qpoint_callback_set(point):
    print("qpoint callback set")


def qpoint_callback_accepted(val):
    print("qpoint callback accepted")
    return True


def qpoint_callback_equal(val):
    print("qpoint callback equal")
    return False


class PropertyTest(QtWidgets.QMainWindow):
    def __init__(self):
        QtWidgets.QMainWindow.__init__(self)
        self.setup_ui()

    def setup_ui(self):
        if len(self.objectName()) == 0:
            pass

        self.resize(600, 400)
        menu_bar = QtWidgets.QMenuBar(self)
        menu_bar.setObjectName("menuBar")
        self.setMenuBar(menu_bar)

        main_tool_bar = QtWidgets.QToolBar(self)
        main_tool_bar.setObjectName("mainToolBar")
        self.addToolBar(main_tool_bar)

        central_widget = pyqtn.widget.QtnPropertyWidget(self)
        central_widget.setObjectName("centralWidget")

        property_set = pyqtn.core.QtnPropertySet(self)
        central_widget.setPropertySet(property_set)

        self.setCentralWidget(central_widget)

        status_bar = QtWidgets.QStatusBar(self)
        status_bar.setObjectName("statusBar")
        self.setStatusBar(status_bar)
        self.setWindowTitle(QtWidgets.QApplication.translate("PropertyTestClass", "PropertyTest"))

        QtCore.QMetaObject.connectSlotsByName(self)

        m_property_set = pyqtn.core.QtnPropertySet(self)

        bool_prop = pyqtn.core.QtnPropertyBool(m_property_set)
        bool_prop.setName("Bool")
        bool_prop.setDescription("Bool Property")
        bool_prop.setValue(True)

        float_prop = pyqtn.core.QtnPropertyFloat(m_property_set)
        float_prop.setName("Float")
        float_prop.setDisplayName("FloatDisplay")
        float_prop.setDescription("Float Property")
        float_prop.setMaxValue(1.0)
        float_prop.setMinValue(0.0)
        float_prop.setStepValue(0.1)
        float_prop.setValue(0.3)

        double_prop = pyqtn.core.QtnPropertyDouble(m_property_set)
        double_prop.setName("Double")
        double_prop.setDescription("Double Property")
        double_prop.setMaxValue(10.0)
        double_prop.setMinValue(-10.0)
        double_prop.setStepValue(0.1)
        double_prop.setValue(3)

        int_prop = pyqtn.core.QtnPropertyInt(m_property_set)
        int_prop.setName("Int")
        int_prop.setDescription("Int Property")
        int_prop.setDisplayName("Int Display")
        int_prop.setMaxValue(100)
        int_prop.setMinValue(-100)
        int_prop.setStepValue(10)
        int_prop.setValue(30)

        uint_prop = pyqtn.core.QtnPropertyUInt(m_property_set)
        uint_prop.setName("UInt")
        uint_prop.setDescription("UInt Property")
        uint_prop.setDisplayName("UInt Display")
        uint_prop.setMaxValue(100)
        uint_prop.setMinValue(200)
        uint_prop.setStepValue(10)
        uint_prop.setValue(30)

        enum_prop = pyqtn.core.QtnPropertyEnum(m_property_set)
        enum_prop.setName("Enum")
        enum_prop.setDescription("Enum Property")
        enum_values = [pyqtn.core.QtnEnumValueInfo(1, "Test1"), pyqtn.core.QtnEnumValueInfo(4, "Test2"),
                       pyqtn.core.QtnEnumValueInfo(8, "Test3")]
        enum_info = pyqtn.core.QtnEnumInfo("Test", enum_values)
        enum_prop.setEnumInfo(enum_info)
        enum_prop.setValue(1)

        enum_flag_prop = pyqtn.core.QtnPropertyEnumFlags(m_property_set)
        enum_flag_prop.setName("EnumFlags")
        enum_flag_prop.setDescription("Enum Flag Property")
        enum_flag_prop.setEnumInfo(enum_info)
        enum_flag_prop.setValue(4)

        string_prop = pyqtn.core.QtnPropertyQString(m_property_set)
        string_prop.setName("String")
        string_prop.setDescription("String Property")
        string_prop.setDisplayName("String Display")
        string_prop.setValue("Hello world!")

        enable_sub_property_set = pyqtn.core.QtnPropertyBool(m_property_set)
        enable_sub_property_set.setName("EnableSubPropertySet")
        enable_sub_property_set.setDescription("Enable/Disable Sub-PropertySet.")
        enable_sub_property_set.setValue(False)

        button_prop = pyqtn.core.QtnPropertyButton(m_property_set)
        button_prop.setName("Button")
        button_prop.setDisplayName("Button Display")
        button_prop.setDescription("Button Property")
        button_prop.setClickHandler(button_callback)

        m_sub_property_set = pyqtn.core.QtnPropertySet(m_property_set)
        m_sub_property_set.setDescription("This property set is part of the root property set")
        m_sub_property_set.setState(pyqtn.core.QtnPropertyStateImmutable)
        m_sub_property_set.switchState(pyqtn.core.QtnPropertyStateImmutable, True)

        qpoint_prop = pyqtn.core.QtnPropertyQPoint(m_sub_property_set)
        qpoint_prop.setName("QPointProperty")
        qpoint_prop.setDescription("Property to hold QPoint value.")
        qpoint_prop.setValue(QtCore.QPoint(-10, 10))

        qsize_prop = pyqtn.core.QtnPropertyQSize(m_sub_property_set)
        qsize_prop.setName("QSizeProperty")
        qsize_prop.setDescription("Property to hold QSize value.")
        qsize_prop.setValue(QtCore.QSize(100, 200))

        qrect_prop = pyqtn.core.QtnPropertyQRect(m_sub_property_set)
        qrect_prop.setName("QRectProperty")
        qrect_prop.setDescription("Property to hold QRect value.")
        qrect_prop.setValue(QtCore.QRect(10, 10, 200, 200))

        qpointf_prop = pyqtn.core.QtnPropertyQPointF(m_sub_property_set)
        qpointf_prop.setName("QPointFProperty")
        qpointf_prop.setDescription("Property to hold QPointF value.")
        qpointf_prop.setValue(QtCore.QPointF(-10.5, 10.2))

        qsizef_prop = pyqtn.core.QtnPropertyQSizeF(m_sub_property_set)
        qsizef_prop.setName("QSizeFProperty")
        qsizef_prop.setDescription("Property to hold QSizeF value.")
        qsizef_prop.setValue(QtCore.QSizeF(100.0, 200.1))

        qrectf_prop = pyqtn.core.QtnPropertyQRectF(m_sub_property_set)
        qrectf_prop.setName("QRectFProperty")
        qrectf_prop.setDescription("Property to hold QRectF value.")
        qrectf_prop.setValue(QtCore.QRectF(10.23, 10.4, 200.2, 200.6))

        qcolor_prop = pyqtn.core.QtnPropertyQColor(m_sub_property_set)
        qcolor_prop.setName("TextColor")
        qcolor_prop.setDescription("QColor Property")
        qcolor_prop.setValue(QtGui.QColor(255, 0, 0))

        qfont_prop = pyqtn.core.QtnPropertyQFont(m_sub_property_set)
        qfont_prop.setName("QFontProperty")
        qfont_prop.setDescription("Property to hold QFont value.")
        qfont_prop.setValue(QtGui.QFont("Sans Serif", 14))

        qbrush_style_prop = pyqtn.core.QtnPropertyQBrushStyle(m_sub_property_set)
        qbrush_style_prop.setName("BrushStyleProperty")
        qbrush_style_prop.setDescription("Property to hold QBrushStyle enum.")
        qbrush_style_prop.setValue(5)

        qpen_style_prop = pyqtn.core.QtnPropertyQPenStyle(m_sub_property_set)
        qpen_style_prop.setName("PenStyleProperty")
        qpen_style_prop.setDescription("Property to hold pen style values.")
        qpen_style_prop.setValue(2)

        qpen_prop = pyqtn.core.QtnPropertyQPen(m_sub_property_set)
        qpen_prop.setName("PenProperty")
        qpen_prop.setDescription("Property to hold QPen values.")

        # Reset Test
        int_prop.setResetCallback(reset_callback)
        int_prop.reset()
        central_widget.setPropertySet(m_property_set)

        # bool callback property test
        bool_callback_prop = pyqtn.core.QtnPropertyUIntCallback(m_property_set)
        bool_callback_prop.setName("BoolCallback")
        bool_callback_prop.setDescription("Bool callback property.")
        bool_callback_prop.setCallbackValueGet(bool_callback_get)
        bool_callback_prop.setCallbackValueSet(bool_callback_set)
        bool_callback_prop.setCallbackValueAccepted(bool_callback_accepted)
        bool_callback_prop.setCallbackValueEqual(bool_callback_equal)
        # bool_callback_prop.setValue(True)


        # qpoint callback property test
        qpoint_callback_prop = pyqtn.core.QtnPropertyQPointCallback(m_property_set)
        qpoint_callback_prop.setName("QPointCallback")
        qpoint_callback_prop.setDescription("Property to hold QPoint callback value.")
        qpoint_callback_prop.setCallbackValueGet(qpoint_callback_get)
        qpoint_callback_prop.setCallbackValueSet(qpoint_callback_set)
        qpoint_callback_prop.setCallbackValueAccepted(qpoint_callback_accepted)
        qpoint_callback_prop.setCallbackValueEqual(qpoint_callback_equal)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    test_window = PropertyTest()
    test_window.show()
    sys.exit(app.exec_())
