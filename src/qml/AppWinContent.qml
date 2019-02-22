/***************************************************************************
 *   Copyright (C) 2019 by Stefan Kebekus                                  *
 *   stefan.kebekus@math.uni-freiburg.de                                   *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/


import QtQuick 2.9
import QtQuick.Controls 2.4

Item {
    id: appWinContent
    anchors.fill: parent
        
    PageIndicator {
        id: indicator
        
        anchors.top: parent.top
        anchors.topMargin: 0
        
        count: view.count
        currentIndex: view.currentIndex
        
        anchors.horizontalCenter: parent.horizontalCenter
    }
        
    SwipeView {
       	id: view
        currentIndex: 0

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: indicator.bottom
        anchors.topMargin: 0
        
        focus: true
        contentItem.focus: true
        
        Calculator {
            focus: true
        }

        Info {
            text: infoText
        }
    }

    Loader {
        id: firstTimeInfo
        anchors.fill: parent

        Connections {
            target: firstRunNotifier
            onFirstRun:  {
                firstTimeInfo.source = "FirstRunDialog.qml"
                firstTimeInfo.focus = true
            }
        }
    }
}
