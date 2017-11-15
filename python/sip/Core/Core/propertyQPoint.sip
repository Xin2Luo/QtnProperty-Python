//Author : Xin Luo

class QtnPropertyQPointBase: public QtnProperty /Abstract,Supertype=sip.wrapper/
{
%TypeHeaderCode
#include "Core/Core/propertyQPoint.h"
%End
public:
	typedef QPoint ValueType;
    explicit QtnPropertyQPointBase(QObject *parent /TransferThis/ = 0);
    ValueType value() const;
    bool setValue(ValueType newValue);
};

%ModuleHeaderCode
#include "Core/Core/propertyQPoint.h"
%End 
QtnProperty* qtnCreateXProperty(QObject *parent, QtnPropertyQPointBase *propertyPoint);
QtnProperty* qtnCreateYProperty(QObject *parent, QtnPropertyQPointBase *propertyPoint);

class QtnPropertyQPointCallback:public QtnPropertyQPointBase /NoDefaultCtors/
{
%TypeHeaderCode
#include "Core/Core/propertyQPoint.h"
%End
public:
    explicit QtnPropertyQPointCallback(QObject *parent /TransferThis/ = 0);

//Callback template begin.
%TypeCode   
    typedef QPoint ValueType;
    typedef std::function<ValueType()>     CallbackValueGet;
    typedef std::function<void(ValueType)> CallbackValueSet;
    typedef std::function<bool(ValueType)> CallbackValueAccepted;
    typedef std::function<bool(ValueType)> CallbackValueEqual;

    static PyObject *callbackValueGet_PyHandler = 0;
    static PyObject *callbackValueSet_PyHandler = 0;
    static PyObject *callbackValueAccepted_PyHandler = 0;
    static PyObject *callbackvalueEqual_PyHandler = 0;

    static ValueType callbackValueGet_Handler()
    {
        ValueType sipRes;
        SIP_BLOCK_THREADS
        if(callbackValueGet_PyHandler){
            PyObject *res_obj = sipCallMethod(0, callbackValueGet_PyHandler, "");
            if (res_obj ) {
                sipParseResult(0, callbackValueGet_PyHandler, res_obj, "Hf", sipType_QPoint, &sipRes);
                Py_DECREF(res_obj);
            }
        }
        SIP_UNBLOCK_THREADS     
        return sipRes;
    }

    static void callbackValueSet_handler(ValueType value)
    {
        SIP_BLOCK_THREADS
        if(callbackValueSet_PyHandler)
            sipCallMethod(0, callbackValueSet_PyHandler, "D", value, sipType_QPoint, NULL);
        SIP_UNBLOCK_THREADS
    }

    static bool callbackValueAccepet_handler(ValueType value)
    {
        bool sipRes = false;
        SIP_BLOCK_THREADS
        if(callbackValueAccepted_PyHandler){
            PyObject *res_obj = sipCallMethod(0, callbackValueAccepted_PyHandler, "D", value, sipType_QPoint, NULL);
            if (res_obj ) {
                sipParseResult(0, callbackValueAccepted_PyHandler, res_obj, "b", &sipRes);
                Py_DECREF(res_obj);
            }
        }
        SIP_UNBLOCK_THREADS
        return sipRes;
    }

    static bool CallbackValueEqual_handler(ValueType value)
    {
        bool sipRes;
        SIP_BLOCK_THREADS
        if(callbackvalueEqual_PyHandler){
            PyObject *res_obj = sipCallMethod(0, callbackvalueEqual_PyHandler, "D", value, sipType_QPoint, NULL);
            if (res_obj ) {
                sipParseResult(0, callbackvalueEqual_PyHandler, res_obj, "b", &sipRes);
                Py_DECREF(res_obj);
            }
        }
        SIP_UNBLOCK_THREADS
        return sipRes;
    }

    static CallbackValueGet callbackValueGetFunc = callbackValueGet_Handler;
    static CallbackValueSet callbackValueSetFunc = callbackValueSet_handler;
    static CallbackValueAccepted callbackValueAccepetFunc = callbackValueAccepet_handler;
    static CallbackValueEqual CallbackValueEqualFunc = CallbackValueEqual_handler;
%End
    //void setCallbackValueGet(const CallbackValueGet& callback);
    void setCallbackValueGet(SIP_PYCALLABLE /TypeHint = "Callable[[None], QPoint]" /);
%MethodCode
    sipCpp->setCallbackValueGet(callbackValueGetFunc);
    Py_XDECREF(callbackValueGet_PyHandler);
    callbackValueGet_PyHandler = a0;
    Py_INCREF(callbackValueGet_PyHandler);
%End
    // void setCallbackValueSet(const CallbackValueSet& callback);
    void setCallbackValueSet(SIP_PYCALLABLE /TypeHint = "Callable[[QPoint], None]" /);
%MethodCode
    sipCpp->setCallbackValueSet(callbackValueSetFunc);
    Py_XDECREF(callbackValueSet_PyHandler);
    callbackValueSet_PyHandler = a0;
    Py_INCREF(callbackValueSet_PyHandler);
%End
    // void setCallbackValueAccepted(const CallbackValueAccepted& callback);
    void setCallbackValueAccepted(SIP_PYCALLABLE /TypeHint = "Callable[[QPoint], bool]" /);
%MethodCode
    sipCpp->setCallbackValueAccepted(callbackValueAccepetFunc);
    Py_XDECREF(callbackValueAccepted_PyHandler);
    callbackValueAccepted_PyHandler = a0;
    Py_INCREF(callbackValueAccepted_PyHandler);
%End
    // void setCallbackValueEqual(const CallbackValueEqual& callback);
    void setCallbackValueEqual(SIP_PYCALLABLE /TypeHint = "Callable[[QPoint], bool]" /);
%MethodCode
    sipCpp->setCallbackValueEqual(CallbackValueEqualFunc);
    Py_XDECREF(callbackvalueEqual_PyHandler);
    callbackvalueEqual_PyHandler = a0;
    Py_INCREF(callbackvalueEqual_PyHandler);
%End
//Callback template end.   
};

class QtnPropertyQPoint:public QtnPropertyQPointBase /NoDefaultCtors/
{
%TypeHeaderCode
#include "Core/Core/propertyQPoint.h"
%End
public:
    explicit QtnPropertyQPoint(QObject *parent /TransferThis/ = 0);

};
