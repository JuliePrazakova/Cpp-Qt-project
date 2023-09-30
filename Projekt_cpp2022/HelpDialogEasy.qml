import QtQuick 2.0


Rectangle {
    id: dialog
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
        id: closeButtonEasy
        source: "/images/close_icon2.png"
        anchors.centerIn: parent
        anchors.fill:parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: dialog.visible = false
    }


    Text {
        id: headingEasy
        text: "Easy level"
        color: "darkGray"
        font {
            pixelSize: 25
            weight: Font.Bold
        }
        anchors {
            top: parent.top
            left: closeButtonEasy.right
            leftMargin: 20
            topMargin: 20
        }
    }

    Text {
        id: descriptionEasy
        text: "Tahle mapa je 3x3 a najdeš v ní 4 příšerky"
        color: "darkGray"
        wrapMode: Text.Wrap
        font {
            pixelSize: 15
        }
        anchors {
            top: headingEasy.bottom
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



