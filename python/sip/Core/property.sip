//Author : Xin Luo

class QtnProperty: public QtnPropertyBase /Abstract,Supertype=sip.wrapper/
{
%TypeHeaderCode
#include "Core/Property.h"
%End
public:
    virtual ~QtnProperty();

    // casts
    QtnProperty* asProperty();

    void propertyValueAccept(const QtnProperty* property, void* valueToAccept, bool* accept);

};
