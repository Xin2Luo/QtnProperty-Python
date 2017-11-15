// Author: Xin Luo

%Module(name=_qtnPropertyCore, keyword_arguments="Optional")

%Import QtWidgets/QtWidgetsmod.sip
%Import QtCore/QtCoremod.sip
%Import QtGui/QtGuimod.sip

%Include propertyAux.sip
%Include property.sip
%Include propertyBase.sip
%Include propertyDelegateInfo.sip
%Include propertySet.sip
%Include enum.sip

//Core
%Include Core/propertyBool.sip
%Include Core/propertyDouble.sip
%Include Core/propertyEnum.sip
%Include Core/propertyEnumFlags.sip
%Include Core/propertyFloat.sip
%Include Core/propertyInt.sip
%Include Core/propertyQPoint.sip
%Include Core/propertyQPointF.sip
%Include Core/propertyQRect.sip
%Include Core/propertyQRectF.sip
%Include Core/propertyQSize.sip
%Include Core/propertyQSizeF.sip
%Include Core/propertyQString.sip
%Include Core/propertyUInt.sip

//GUI
%Include GUI/propertyButton.sip
%Include GUI/propertyQBrush.sip
%Include GUI/propertyQColor.sip
%Include GUI/propertyQFont.sip
%Include GUI/propertyQPen.sip
