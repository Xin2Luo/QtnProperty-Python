#pragma once

#include <QtWidgets/QMainWindow>
#include "PropertySet.h"
#include "ui_PropertyTest.h"



class PropertyTest : public QMainWindow
{
    Q_OBJECT

public:
    
    PropertyTest(QWidget *parent = Q_NULLPTR);
    QtnPropertySet *m_propertySet;

private:
    Ui::PropertyTestClass ui;
};
