// Author : Xin Luo

class QtnPropertyViewFilter
{
%TypeHeaderCode
#include "PropertyWidget/PropertyView.h"
%End
public:
    virtual bool accept(const QtnPropertyBase* property) const = 0;

    virtual ~QtnPropertyViewFilter();
};

%ModuleCode
#include "PropertyWidget/PropertyView.h"
%End
enum QtnPropertyViewStyleFlag
{
    QtnPropertyViewStyleNone,
    QtnPropertyViewStyleShowRoot,
    QtnPropertyViewStyleLiveSplit,
    QtnPropertyViewStyleDblClickActivation
    //QtnPropertyViewStyle = 0x0008
};

typedef QFlags<QtnPropertyViewStyleFlag> QtnPropertyViewStyle;
QFlags<QtnPropertyViewStyleFlag> operator|(QtnPropertyViewStyleFlag f1, QFlags<QtnPropertyViewStyleFlag> f2);


class QtnPropertyView: public QAbstractScrollArea
{
%TypeHeaderCode
#include "PropertyWidget/PropertyView.h"
%End
public:
    explicit QtnPropertyView(QWidget* parent /TransferThis/ = nullptr, QtnPropertySet* propertySet = nullptr);
    ~QtnPropertyView();

    QtnPropertySet* propertySet();
    void setPropertySet(QtnPropertySet* newPropertySet);

    QtnPropertyBase* activeProperty();
    bool setActiveProperty(QtnPropertyBase*newActiveProperty);

    bool ensureVisible(const QtnPropertyBase* property);

    quint32 itemHeightSpacing() const;
    bool setItemHeightSpacing(quint32 itemHeightSpacing);

    QtnPropertyViewStyle propertyViewStyle() const;
    void setPropertyViewStyle(QtnPropertyViewStyle style);
    void addPropertyViewStyle(QtnPropertyViewStyle style);
    void removePropertyViewStyle(QtnPropertyViewStyle style);

    int valueLeftMargin() const;
    QtnAccessibilityProxy* accessibilityProxy();
    void activePropertyChanged(QtnPropertyBase* activeProperty);
};
