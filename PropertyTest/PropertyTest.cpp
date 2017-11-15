#include "PropertyTest.h"

#include "Core/PropertyFloat.h"
#include "Core/PropertyEnum.h"
#include "Core/PropertyEnumFlags.h"

#include "GUI/PropertyQColor.h"
#include "GUI/PropertyQPen.h"

enum Enum
{
    opt1 = 1,
    opt2 = 2,
    opt3 = 4
};
PropertyTest::PropertyTest(QWidget *parent)
    : QMainWindow(parent)
{
    ui.setupUi(this);

    m_propertySet = new QtnPropertySet(this);

    auto floatValue = new QtnPropertyFloat(m_propertySet);
    floatValue->setName(tr("Float"));
    floatValue->setDescription(tr("Float value"));
    floatValue->setMaxValue(1.f);
    floatValue->setMinValue(0.f);
    floatValue->setStepValue(0.1f);
    floatValue->setValue(0.3f);

    auto textColor = new QtnPropertyQColor(m_propertySet);
    textColor->setName(tr("TextColor"));
    textColor->setDescription(tr("Foreground text color"));
    textColor->setValue(QColor(0, 0, 0));

    auto enumValue = new QtnPropertyEnum(m_propertySet);
    enumValue->setName("Enum");
    enumValue->setDescription("Enum Test");
    auto enumValues = new QVector<QtnEnumValueInfo>();
    enumValues->push_back(QtnEnumValueInfo(0, "Test1"));
    enumValues->push_back(QtnEnumValueInfo(1, "Test2"));
    enumValues->push_back(QtnEnumValueInfo(2, "Test3"));
    auto qenumInfo = new QtnEnumInfo("Test", *enumValues);
    enumValue->setEnumInfo(qenumInfo);

    auto enumFlagValue = new QtnPropertyEnumFlags(m_propertySet);
    enumFlagValue->setName("EnumFlag");
    enumFlagValue->setDescription("EnumFlags Test");
    enumValues = new QVector<QtnEnumValueInfo>();
    enumValues->append(QtnEnumValueInfo(Enum::opt1, "Test1", "OPT1"));
    enumValues->append(QtnEnumValueInfo(Enum::opt2, "Test2", "OPT2"));
    enumValues->append(QtnEnumValueInfo(Enum::opt3, "Test3", "OPT3"));
    qenumInfo = new QtnEnumInfo("Test", *enumValues);
    enumFlagValue->setEnumInfo(qenumInfo);
    enumFlagValue->setValue(Enum::opt2);
    
    auto penProperty = new QtnPropertyQPen(m_propertySet);
    QString PenProperty_name = tr("PenProperty");
    penProperty->setName(PenProperty_name);
    static QString PenProperty_description = "Property to hold QPen values.";
    penProperty->setDescription(PenProperty_description);


    ui.centralWidget->setPropertySet(m_propertySet);
}
