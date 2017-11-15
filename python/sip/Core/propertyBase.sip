//Author : Xin Luo

class QtnPropertyBase: public QObject /Abstract,Supertype=sip.wrapper/
{
%TypeHeaderCode
#include "Core/PropertyBase.h"
%End
public:
    virtual ~QtnPropertyBase();

    QString name() const;
    void setName(const QString& name);

    QString displayName() const;
    void setDisplayName(const QString& displayName);

    QString description() const;
    void setDescription(const QString& description);

    int id() const;
    void setId(int id);

    // states
    QtnPropertyState state() const;
    QtnPropertyState stateLocal() const;
    QtnPropertyState stateInherited() const;

    void setState(QtnPropertyState stateToSet, bool force = false);
    void addState(QtnPropertyState stateToAdd, bool force = false);
    void removeState(QtnPropertyState stateToRemove, bool force = false);
    void switchState(QtnPropertyState stateToSwitch, bool switchOn, bool force = false);
    void switchStateAuto(QtnPropertyState stateToSwitch, bool force = false);

    bool isEditable() const;
    bool isEditableByUser() const;
    bool isVisible() const;
    bool isSimple() const;

    // serialization
    bool load(QDataStream& stream);
    bool save(QDataStream& stream) const;
    static bool skipLoad(QDataStream& stream);

    // string conversion
    bool fromStr(const QString& str);
    bool toStr(QString& str) const;

    // variant conversion
    bool fromVariant(const QVariant& var);
    bool toVariant(QVariant& var) const;

    // casts
    virtual QtnProperty* asProperty();
    virtual QtnPropertySet* asPropertySet();

    // delegates
    const QtnPropertyDelegateInfo* delegate() const;
    void setDelegate(const QtnPropertyDelegateInfo& delegate);
    //void setDelegateCallback(const std::function<QtnPropertyDelegateInfo*()>& callback);

    void setDelegateAttribute(const QByteArray& attributeName, const QVariant& attributeValue);

    // reset callback
    bool hasResetCallback() const;
%TypeCode
    static PyObject *propertyBase_PyResetCallback = 0;
    static void propertyBase_ResetCallback(QtnPropertyBase& property)
    {
        SIP_BLOCK_THREADS
        sipCallMethod(0,propertyBase_PyResetCallback, "D", property, sipType_QtnPropertyBase, NULL);
        SIP_UNBLOCK_THREADS
    }
    static std::function<void(QtnPropertyBase&)> resetCallbackFunc = propertyBase_ResetCallback;
%End
    //void setResetCallback(const std::function<void(QtnPropertyBase&)>& resetCallback);
    void setResetCallback(SIP_PYCALLABLE /TypeHint = "Callable[[QtnPropertyBase&], None]"/ );
%MethodCode
    sipCpp->setResetCallback(resetCallbackFunc);
    Py_XDECREF(propertyBase_PyResetCallback);
    propertyBase_PyResetCallback = a0;
    Py_INCREF(propertyBase_PyResetCallback);
%End
    bool reset();

    static void connectMasterSignals(const QtnPropertyBase& masterProperty, QtnPropertyBase& slaveProperty);
    static void disconnectMasterSignals(const QtnPropertyBase& masterProperty, QtnPropertyBase& slaveProperty);

    void propertyWillChange(const QtnPropertyBase* changedProperty, const QtnPropertyBase* firedProperty, QtnPropertyChangeReasonFlag reason, void* newValue);
    void propertyDidChange(const QtnPropertyBase* changedProperty, const QtnPropertyBase* firedProperty, QtnPropertyChangeReasonFlag reason);
};
