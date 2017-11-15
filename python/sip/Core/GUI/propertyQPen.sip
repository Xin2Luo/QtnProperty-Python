// Author : Xin Luo

class QtnPropertyQPenStyleBase: public QtnProperty /Abstract,Supertype=sip.wrapper/
{
%TypeHeaderCode
#include "Core/GUI/PropertyQPen.h"
%End
public:
    typedef Qt::PenStyle ValueType;
    explicit QtnPropertyQPenStyleBase(QObject *parent /TransferThis/ = 0);
    ValueType value() const;
    bool setValue(ValueType newValue);
};

%ModuleHeaderCode
#include "Core/GUI/PropertyQPen.h"
using namespace Qt;
%End 
//QDataStream& operator<< (QDataStream& stream, Qt::PenStyle penStyle);
//QDataStream& operator>> (QDataStream& stream, Qt::PenStyle& penStyle);
class QtnPropertyQPenStyleCallback: public QtnPropertyQPenStyleBase /NoDefaultCtors/
{
%TypeHeaderCode
#include "Core/GUI/PropertyQPen.h"
%End
public:
    explicit QtnPropertyQPenStyleCallback(QObject *parent /TransferThis/ = 0);
//Callback template begin.
%TypeCode   
    typedef Qt::PenStyle ValueType;
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
                sipParseResult(0, callbackValueGet_PyHandler, res_obj, "Hf", sipType_Qt_PenStyle, &sipRes);
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
            sipCallMethod(0, callbackValueSet_PyHandler, "D", value, sipType_Qt_PenStyle, NULL);
        SIP_UNBLOCK_THREADS
    }

    static bool callbackValueAccepet_handler(ValueType value)
    {
        bool sipRes = false;
        SIP_BLOCK_THREADS
        if(callbackValueAccepted_PyHandler){
            PyObject *res_obj = sipCallMethod(0, callbackValueAccepted_PyHandler, "D", value, sipType_Qt_PenStyle, NULL);
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
            PyObject *res_obj = sipCallMethod(0, callbackvalueEqual_PyHandler, "D", value, sipType_Qt_PenStyle, NULL);
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
    void setCallbackValueGet(SIP_PYCALLABLE /TypeHint = "Callable[[None], PenStyle]" /);
%MethodCode
    sipCpp->setCallbackValueGet(callbackValueGetFunc);
    Py_XDECREF(callbackValueGet_PyHandler);
    callbackValueGet_PyHandler = a0;
    Py_INCREF(callbackValueGet_PyHandler);
%End
    // void setCallbackValueSet(const CallbackValueSet& callback);
    void setCallbackValueSet(SIP_PYCALLABLE /TypeHint = "Callable[[PenStyle], None]" /);
%MethodCode
    sipCpp->setCallbackValueSet(callbackValueSetFunc);
    Py_XDECREF(callbackValueSet_PyHandler);
    callbackValueSet_PyHandler = a0;
    Py_INCREF(callbackValueSet_PyHandler);
%End
    // void setCallbackValueAccepted(const CallbackValueAccepted& callback);
    void setCallbackValueAccepted(SIP_PYCALLABLE /TypeHint = "Callable[[PenStyle], bool]" /);
%MethodCode
    sipCpp->setCallbackValueAccepted(callbackValueAccepetFunc);
    Py_XDECREF(callbackValueAccepted_PyHandler);
    callbackValueAccepted_PyHandler = a0;
    Py_INCREF(callbackValueAccepted_PyHandler);
%End
    // void setCallbackValueEqual(const CallbackValueEqual& callback);
    void setCallbackValueEqual(SIP_PYCALLABLE /TypeHint = "Callable[[PenStyle], bool]" /);
%MethodCode
    sipCpp->setCallbackValueEqual(CallbackValueEqualFunc);
    Py_XDECREF(callbackvalueEqual_PyHandler);
    callbackvalueEqual_PyHandler = a0;
    Py_INCREF(callbackvalueEqual_PyHandler);
%End
//Callback template end.   
};

class QtnPropertyQPenStyle: public QtnPropertyQPenStyleBase /NoDefaultCtors/
{
%TypeHeaderCode
#include "Core/GUI/PropertyQPen.h"
%End
public:
    explicit QtnPropertyQPenStyle(QObject *parent  /TransferThis/ = 0);
};

class QtnPropertyQPenBase: public QtnProperty /Abstract,Supertype=sip.wrapper/
{
%TypeHeaderCode
#include "Core/GUI/PropertyQPen.h"
%End
public:
    typedef QPen ValueType;
    explicit QtnPropertyQPenBase(QObject *parent /TransferThis/ = 0);
    ValueType value() const;
    bool setValue(ValueType newValue);

    static QtnEnumInfo* penStyleEnum();
    static QtnEnumInfo* penCapStyleEnum();
    static QtnEnumInfo* penJoinStyleEnum();
    static bool penFromStr(const QString& str, QPen& pen);
    static bool strFromPen(const QPen& pen, QString& str);
};

class QtnPropertyQPenCallback: public QtnPropertyQPenBase /NoDefaultCtors/
{
%TypeHeaderCode
#include "Core/GUI/PropertyQPen.h"
%End
public:
    explicit QtnPropertyQPenCallback(QObject *parent  /TransferThis/ = 0);
//Callback template begin.
%TypeCode   
    typedef QPen ValueType;
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
                sipParseResult(0, callbackValueGet_PyHandler, res_obj, "Hf", sipType_QPen, &sipRes);
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
            sipCallMethod(0, callbackValueSet_PyHandler, "D", value, sipType_QPen, NULL);
        SIP_UNBLOCK_THREADS
    }

    static bool callbackValueAccepet_handler(ValueType value)
    {
        bool sipRes = false;
        SIP_BLOCK_THREADS
        if(callbackValueAccepted_PyHandler){
            PyObject *res_obj = sipCallMethod(0, callbackValueAccepted_PyHandler, "D", value, sipType_QPen, NULL);
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
            PyObject *res_obj = sipCallMethod(0, callbackvalueEqual_PyHandler, "D", value, sipType_QPen, NULL);
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
    void setCallbackValueGet(SIP_PYCALLABLE /TypeHint = "Callable[[None], QPen]" /);
%MethodCode
    sipCpp->setCallbackValueGet(callbackValueGetFunc);
    Py_XDECREF(callbackValueGet_PyHandler);
    callbackValueGet_PyHandler = a0;
    Py_INCREF(callbackValueGet_PyHandler);
%End
    // void setCallbackValueSet(const CallbackValueSet& callback);
    void setCallbackValueSet(SIP_PYCALLABLE /TypeHint = "Callable[[QPen], None]" /);
%MethodCode
    sipCpp->setCallbackValueSet(callbackValueSetFunc);
    Py_XDECREF(callbackValueSet_PyHandler);
    callbackValueSet_PyHandler = a0;
    Py_INCREF(callbackValueSet_PyHandler);
%End
    // void setCallbackValueAccepted(const CallbackValueAccepted& callback);
    void setCallbackValueAccepted(SIP_PYCALLABLE /TypeHint = "Callable[[QPen], bool]" /);
%MethodCode
    sipCpp->setCallbackValueAccepted(callbackValueAccepetFunc);
    Py_XDECREF(callbackValueAccepted_PyHandler);
    callbackValueAccepted_PyHandler = a0;
    Py_INCREF(callbackValueAccepted_PyHandler);
%End
    // void setCallbackValueEqual(const CallbackValueEqual& callback);
    void setCallbackValueEqual(SIP_PYCALLABLE /TypeHint = "Callable[[QPen], bool]" /);
%MethodCode
    sipCpp->setCallbackValueEqual(CallbackValueEqualFunc);
    Py_XDECREF(callbackvalueEqual_PyHandler);
    callbackvalueEqual_PyHandler = a0;
    Py_INCREF(callbackvalueEqual_PyHandler);
%End
//Callback template end.   
};

class QtnPropertyQPen: public QtnPropertyQPenBase /NoDefaultCtors/
{
%TypeHeaderCode
#include "Core/GUI/PropertyQPen.h"
%End
public:
    explicit QtnPropertyQPen(QObject *parent /TransferThis/ = 0);
};
