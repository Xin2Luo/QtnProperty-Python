//Author : Xin Luo

class QtnPropertyDelegate /Abstract,Supertype=sip.wrapper/
{
%TypeHeaderCode
#include "PropertyWidget/Delegates/PropertyDelegate.h"
%End
public:
    ~QtnPropertyDelegate();

    QtnPropertyBase* property();
    const QtnPropertyBase* propertyImmutable() const;

    // for complex properties like PropertyQFont
    int subPropertyCount() const;
    QtnPropertyBase* subProperty(int index);

    // tune up with attributes
    void applyAttributes(const QtnPropertyDelegateAttributes& attributes);
    // create GUI sub elements to present property on PropertyView
    void createSubItems(QtnDrawContext& context, QList<QtnSubItem>& subItems);

};
