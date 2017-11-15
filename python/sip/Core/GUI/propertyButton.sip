// Author : Xin Luo

class QtnPropertyButton: public QtnProperty
{
%TypeHeaderCode
#include "Core/GUI/PropertyButton.h"
%End
public:
    explicit QtnPropertyButton(QObject *parent /TransferThis/ = 0);
    void invokeClick();
%TypeCode
    static PyObject *propertypButton_PyClickHandler = 0;
    static void propertyButton_ClickHandler(const QtnPropertyButton* button)
    {
        SIP_BLOCK_THREADS
        sipCallMethod(0, propertypButton_PyClickHandler, "D", button, sipType_QtnPropertyButton, NULL);
        SIP_UNBLOCK_THREADS
    }
    static std::function<void(const QtnPropertyButton*)> clickHandlerFunc = propertyButton_ClickHandler;
%End
    //void setClickHandler(const std::function<void(const QtnPropertyButton*)>& clickHandler);
    void setClickHandler(SIP_PYCALLABLE /TypeHint="Callable[[const QtnPropertyButton*], None]"/ );
%MethodCode
    sipCpp->setClickHandler(clickHandlerFunc);
    Py_XDECREF(propertypButton_PyClickHandler);
    propertypButton_PyClickHandler = a0;
    Py_INCREF(propertypButton_PyClickHandler);
%End

Q_SIGNALS:
    void click(const QtnPropertyButton* property);

public:
    void invokePreDrawButton(QStyleOptionButton* option);

Q_SIGNALS:
    void preDrawButton(const QtnPropertyButton* property, QStyleOptionButton* option);

protected:
    bool fromStrImpl(const QString& str);
    bool toStrImpl(QString& str) const;
};

