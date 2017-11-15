// Author : Xin Luo

%ModuleHeaderCode
#include "PropertyWidget/PropertyWidget.h"
%End
enum QtnPropertyWidgetPartsFlag
{
    QtnPropertyWidgetPartsNone,
    QtnPropertyWidgetPartsToolbar,
    QtnPropertyWidgetPartsDescriptionPanel
};

typedef QFlags<QtnPropertyWidgetPartsFlag> QtnPropertyWidgetParts;
QFlags<QtnPropertyWidgetPartsFlag> operator|(QtnPropertyWidgetPartsFlag f1, QFlags<QtnPropertyWidgetPartsFlag> f2);

class QtnPropertyWidget: public QWidget
{
%TypeHeaderCode
#include "PropertyWidget/PropertyWidget.h"
%End
public:
    explicit QtnPropertyWidget(QWidget* parent /TransferThis/ = 0);
    QtnPropertyWidget(QtnPropertyView* propertyView, QWidget* parent /TransferThis/ = 0);
    ~QtnPropertyWidget();

    QtnPropertyWidgetParts parts() const;
    void setParts(QtnPropertyWidgetParts newParts);

    QtnPropertySet* propertySet();
    void setPropertySet(QtnPropertySet* newPropertySet);

    QtnPropertyView* propertyView();
};
