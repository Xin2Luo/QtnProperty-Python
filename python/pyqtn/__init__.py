# coding: utf-8
# Author: Xin Luo

import os

Qtn_ROOT = os.path.join(
    os.path.dirname(os.path.dirname(__file__)),
    "qtnProperty"
)
os.environ['PATH'] += os.pathsep + Qtn_ROOT
from PyQt5 import QtCore,QtWidgets,QtGui # just make sure all Qt related dll were loaded
from pyqtn import core
from pyqtn import widget
