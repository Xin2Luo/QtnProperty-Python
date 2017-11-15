// Author : Xin Luo

enum QtnPropertyStateFlag
{
    QtnPropertyStateNone,
    QtnPropertyStateNonSimple,
    QtnPropertyStateInvisible,
    QtnPropertyStateImmutable,
    QtnPropertyStateCollapsed,
    QtnPropertyStateNonSerialized
};
%ModuleHeaderCode
#include "Core/Auxiliary/PropertyAux.h"
%End 
typedef QFlags<QtnPropertyStateFlag> QtnPropertyState;
QFlags<QtnPropertyStateFlag> operator|(QtnPropertyStateFlag f1, QFlags<QtnPropertyStateFlag> f2);


enum QtnPropertyChangeReasonFlag
{
    QtnPropertyChangeReasonNewValue,
    QtnPropertyChangeReasonLoadedValue,
    QtnPropertyChangeReasonValue,
    QtnPropertyChangeReasonName,
    QtnPropertyChangeReasonDisplayName,
    QtnPropertyChangeReasonDescription,
    QtnPropertyChangeReasonId,
    QtnPropertyChangeReasonStateLocal,
    QtnPropertyChangeReasonStateInherited,
    QtnPropertyChangeReasonState,
    QtnPropertyChangeReasonChildPropertyAdd,
    QtnPropertyChangeReasonChildPropertyRemove,
    QtnPropertyChangeReasonChildren
};

typedef QFlags<QtnPropertyChangeReasonFlag> QtnPropertyChangeReason;
QFlags<QtnPropertyChangeReasonFlag> operator|(QtnPropertyChangeReasonFlag f1, QFlags<QtnPropertyChangeReasonFlag> f2);
