//Author : Xin Luo

class QtnPropertyQRectFBase: public QtnProperty  /Abstract,Supertype=sip.wrapper/
{
%TypeHeaderCode
#include "Core/Core/propertyQRectF.h"
%End
public:
	typedef QRectF ValueType;
    explicit QtnPropertyQRectFBase(QObject *parent /TransferThis/ = 0);
    ValueType value() const;
    bool setValue(ValueType newValue);
};
%ModuleHeaderCode
#include "Core/Core/propertyQRectF.h"
%End 
QtnProperty* qtnCreateLeftProperty(QObject *parent, QtnPropertyQRectFBase *propertyRect);
QtnProperty* qtnCreateRightProperty(QObject *parent, QtnPropertyQRectFBase *propertyRect);
QtnProperty* qtnCreateTopProperty(QObject *parent, QtnPropertyQRectFBase *propertyRect);
QtnProperty* qtnCreateBottomProperty(QObject *parent, QtnPropertyQRectFBase *propertyRect);
QtnProperty* qtnCreateWidthProperty(QObject *parent, QtnPropertyQRectFBase *propertyRect);
QtnProperty* qtnCreateHeightProperty(QObject *parent, QtnPropertyQRectFBase *propertyRect);

class QtnPropertyQRectFCallback: public QtnPropertyQRectFBase /NoDefaultCtors/
{
%TypeHeaderCode
#include "Core/Core/propertyQRectF.h"
%End
public:
    explicit QtnPropertyQRectFCallback(QObject *parent /TransferThis/ = 0);
//Callback template begin.
%TypeCode   
    typedef QRectF ValueType;
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
                sipParseResult(0, callbackValueGet_PyHandler, res_obj, "Hf", sipType_QRectF, &sipRes);
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
            sipCallMethod(0, callbackValueSet_PyHandler, "D", value, sipType_QRectF, NULL);
        SIP_UNBLOCK_THREADS
    }

    static bool callbackValueAccepet_handler(ValueType value)
    {
        bool sipRes = false;
        SIP_BLOCK_THREADS
        if(callbackValueAccepted_PyHandler){
            PyObject *res_obj = sipCallMethod(0, callbackValueAccepted_PyHandler, "D", value, sipType_QRectF, NULL);
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
            PyObject *res_obj = sipCallMethod(0, callbackvalueEqual_PyHandler, "D", value, sipType_QRectF, NULL);
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
    void setCallbackValueGet(SIP_PYCALLABLE /TypeHint = "Callable[[None], QRectF]" /);
%MethodCode
    sipCpp->setCallbackValueGet(callbackValueGetFunc);
    Py_XDECREF(callbackValueGet_PyHandler);
    callbackValueGet_PyHandler = a0;
    Py_INCREF(callbackValueGet_PyHandler);
%End
    // void setCallbackValueSet(const CallbackValueSet& callback);
    void setCallbackValueSet(SIP_PYCALLABLE /TypeHint = "Callable[[QRectF], None]" /);
%MethodCode
    sipCpp->setCallbackValueSet(callbackValueSetFunc);
    Py_XDECREF(callbackValueSet_PyHandler);
    callbackValueSet_PyHandler = a0;
    Py_INCREF(callbackValueSet_PyHandler);
%End
    // void setCallbackValueAccepted(const CallbackValueAccepted& callback);
    void setCallbackValueAccepted(SIP_PYCALLABLE /TypeHint = "Callable[[QRectF], bool]" /);
%MethodCode
    sipCpp->setCallbackValueAccepted(callbackValueAccepetFunc);
    Py_XDECREF(callbackValueAccepted_PyHandler);
    callbackValueAccepted_PyHandler = a0;
    Py_INCREF(callbackValueAccepted_PyHandler);
%End
    // void setCallbackValueEqual(const CallbackValueEqual& callback);
    void setCallbackValueEqual(SIP_PYCALLABLE /TypeHint = "Callable[[QRectF], bool]" /);
%MethodCode
    sipCpp->setCallbackValueEqual(CallbackValueEqualFunc);
    Py_XDECREF(callbackvalueEqual_PyHandler);
    callbackvalueEqual_PyHandler = a0;
    Py_INCREF(callbackvalueEqual_PyHandler);
%End
//Callback template end.   
};

class QtnPropertyQRectF: public QtnPropertyQRectFBase /NoDefaultCtors/
{
%TypeHeaderCode
#include "Core/Core/propertyQRectF.h"
%End
public:
    explicit QtnPropertyQRectF(QObject *parent /TransferThis/ = 0);
};

