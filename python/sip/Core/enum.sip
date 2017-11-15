//Author : Xin Luo

%ModuleHeaderCode
#include "Core/Enum.h"
%End 
typedef qint32 QtnEnumValueType;
enum QtnEnumValueStateFlag
{
    QtnEnumValueStateNone,
    QtnEnumValueStateHidden,
    QtnEnumValueStateObsolete,
    QtnEnumValueStateInvalid
};
typedef QFlags<QtnEnumValueStateFlag> QtnEnumValueState;
QFlags<QtnEnumValueStateFlag> operator|(QtnEnumValueStateFlag f1, QFlags<QtnEnumValueStateFlag> f2);

class QtnEnumValueInfo
{
%TypeHeaderCode
#include "Core/Enum.h"
%End
public:
    QtnEnumValueInfo();

    QtnEnumValueInfo(QtnEnumValueType value, const QString& name, const QString& displayName = "", QtnEnumValueState state = QtnEnumValueStateNone);

    ~QtnEnumValueInfo();

    QtnEnumValueType value() const;
    const QString& name() const;
    const QString& displayName() const;
    QtnEnumValueState state() const;
};

class QtnEnumInfo
{
%TypeHeaderCode
#include "Core/Enum.h"
%End
public:
    QtnEnumInfo(const QString& name, QVector<QtnEnumValueInfo>& staticValues);
    const QString& name() const;

    const QtnEnumValueInfo* findByValue(QtnEnumValueType value) const;
    const QtnEnumValueInfo* findByName(const QString& name, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
    const QtnEnumValueInfo* findByDisplayName(const QString& displayName, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;

    const QtnEnumValueInfo* fromStr(const QString& str) const;
    bool toStr(QString& str, const QtnEnumValueInfo* value) const;
    bool toStr(QString& str, QtnEnumValueType value) const;

    void setDynamicValues(const QVector<QtnEnumValueInfo>& dynamicValues);
};
