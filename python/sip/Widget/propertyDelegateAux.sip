// Author: Xin Luo

class QtnSubItemEvent: QEvent
{
%TypeHeaderCode
#include "PropertyWidget/Delegates/PropertyDelegateAux.h"
%End
public:
    enum Type
    {
        Activated,
        Deactivated,
        PressMouse,
        ReleaseMouse

    };
    QtnSubItemEvent(Type type, QPoint mousePos);

    QPoint pos();
    int x() const;
    int y() const;

};

%ModuleHeaderCode
#include "PropertyWidget/Delegates/PropertyDelegateAux.h"
%End
enum QtnSubItemState
{
    QtnSubItemStateNone,
    QtnSubItemStateUnderCursor,
    QtnSubItemStatePushed
};

struct QtnDrawContext
{
%TypeHeaderCode
#include "PropertyWidget/Delegates/PropertyDelegateAux.h"
%End
public:
    QtnDrawContext(QStylePainter* painter_, const QtnPropertyView* widget_, const QRect rect_,
            QMargins margins_, const int splitPos_, const bool isActive_, const bool hasChildren_);
    QStylePainter* painter;
    const QtnPropertyView* widget;

    const QRect rect;
    QMargins margins;
    const int splitPos;

    const bool isActive;
    const bool hasChildren;

    QStyle* style() const;
    void initStyleOption(QStyleOption& option) const;
    const QPalette& palette() const;
    QPalette::ColorGroup colorGroup() const;
};

struct QtnSubItem
{
%TypeHeaderCode
#include "PropertyWidget/Delegates/PropertyDelegateAux.h"
%End
public:
    QtnSubItem(const QRect& rect);

    QRect rect;

    //std::function<void(QtnDrawContext&, const QtnSubItem&)> drawHandler;
    //std::function<bool(QtnEventContext&, const QtnSubItem&)> eventHandler;
    //std::function<QString(QtnEventContext&, const QtnSubItem&)> tooltipHandler;

    QtnSubItemState state() const;
    void trackState(); 

    void setTextAsTooltip(const QString& text);
    void setPropertyNameAsTooltip(const QtnPropertyBase& property);
    void setPropertyDescriptionAsTooltip(const QtnPropertyBase& property);
};

struct QtnEventContext
{
%TypeHeaderCode
#include "PropertyWidget/Delegates/PropertyDelegateAux.h"
%End
public:
    QEvent* event;
    QtnPropertyView* widget;

    int eventType() const;
    void updateWidget();

};

QString qtnElidedText(const QPainter& painter, const QString& text, const QRect& rect, bool* elided = 0);
void qtnDrawValueText(const QString& text, QPainter& painter, const QRect& rect, QStyle::State state, bool* needTooltip = nullptr);
