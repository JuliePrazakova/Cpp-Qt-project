import QtQuick 2.0

Rectangle{
    property alias gameText: myText.text;

    anchors.fill: parent
    color: "lightgray"
    opacity: 0.8

    Rectangle {
        color: "black"
        width: 200
        height: 80
        radius: 10
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20
        }

        Text {
            id: myText
            text: "Some Text"
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: 26
        }
    }

}


