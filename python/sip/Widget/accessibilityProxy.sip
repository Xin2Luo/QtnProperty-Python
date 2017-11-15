// Author : Xin Luo

class QtnAccessibilityProxy: public QObject
{
%TypeHeaderCode
#include "PropertyWidget/Utils/AccessibilityProxy.h"
%End
public:
    explicit QtnAccessibilityProxy(QtnPropertyView* owner = 0);
    ~QtnAccessibilityProxy();
    QtnPropertyView* owner();
    QtnPropertyBase* activeProperty();
    QtnPropertySet* propertySet();
    QtnPropertyBase* findProperty(QString nameOrPath);
    QtnPropertyBase* propertyUnderPoint(QPoint point);
    void ensureVisibleProperty(QtnPropertyBase* property);

    QRect propertyNameRect(QtnPropertyBase* property);
    QRect propertyValueRect(QtnPropertyBase* property);
    QRect propertyActionRect(QtnPropertyBase* property, int actionIndex);

    QString propertyDelegateName(QtnPropertyBase* property);

};

