// Author : Xin Luo

class QtnPropertySet: public QtnPropertyBase
{
%TypeHeaderCode
#include "Core/PropertySet.h"
%End
public:
    explicit QtnPropertySet(QObject* parent /TransferThis/ );
    virtual ~QtnPropertySet();
    // sub properties
    bool hasChildProperties() const;
    const QList<QtnPropertyBase*>& childProperties() const;
    QList<QtnPropertyBase*> findChildProperties(QString name, Qt::FindChildOptions options = Qt::FindChildrenRecursively);
    QList<QtnPropertyBase*> findChildProperties(const QRegularExpression& re, Qt::FindChildOptions options = Qt::FindChildrenRecursively);
    QtnPropertyBase* findChildProperty(int id);
    void clearChildProperties();
    bool addChildProperty(QtnPropertyBase* childProperty, bool moveOwnership = true);
    bool removeChildProperty(QtnPropertyBase* childProperty);

    // cloning
    QtnPropertySet* createNew(QObject* parentForNew) const;
    QtnPropertySet* createCopy(QObject* parentForCopy) const;

    // copy values
    bool copyValues(QtnPropertySet* propertySetCopyFrom, QtnPropertyStateFlag ignoreMask = QtnPropertyStateNone);

    // casts
    QtnPropertySet* asPropertySet();

    // JSON support
    bool fromJson(const QJsonObject& jsonObject);
    bool toJson(QJsonObject& jsonObject) const;

};
