//Author : Xin Luo

typedef QMap<QByteArray, QVariant> QtnPropertyDelegateAttributes;

struct QtnPropertyDelegateInfo
{
%TypeHeaderCode
#include "Core/Auxiliary/PropertyDelegateInfo.h"
%End
    QByteArray name;
    QtnPropertyDelegateAttributes attributes;

    QtnPropertyDelegateInfo();

    QtnPropertyDelegateInfo(const QtnPropertyDelegateInfo& other);
};

// template <typename T>
// bool qtnGetAttribute(const QtnPropertyDelegateAttributes& attributes, const QByteArray& attributeName, T& attributeValue)
// {
//     auto it = attributes.find(attributeName);
//     if (it == attributes.end())
//         return false;

//     attributeValue = it.value().value<T>();
//     return true;
// }
