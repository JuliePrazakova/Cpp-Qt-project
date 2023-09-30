

import QtQuick 2.0

Rectangle {
    id: dialogHard
    visible: false
    color: "transparent"
    width: parent.width * 0.8
    height: parent.height * 0.8

    anchors {
        rightMargin: 10
        topMargin: 10
        leftMargin: 10
        bottomMargin: 10
    }


    Image{
        id: closeButtonHard
        source: "/images/close_icon2.png"
        anchors.centerIn: parent
        anchors.fill:parent
    }


    MouseArea {
        anchors.fill: parent
        onClicked: dialogHard.visible = false
    }


    Text {
        id: headingHard
        text: "Hard level"
        color: "darkGray"
        font {
            pixelSize: 25
            weight: Font.Bold
        }
        anchors {
            top: parent.top
            left: closeButtonHard.right
            leftMargin: 20
            topMargin: 20
        }
    }

    Text {
        id: descriptionHard
        text: "Tahle mapa je 4x4 a najdeš v ní více příšerek"
        color: "darkGray"
        wrapMode: Text.Wrap
        font {
            pixelSize: 15
        }
        anchors {
            top: headingHard.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: 20
            leftMargin: 20
            rightMargin: 20
            bottomMargin: 20
        }
    }
}
