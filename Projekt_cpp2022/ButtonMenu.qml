import QtQuick 2.0

Rectangle {
    id: button
    property string title: ""

    color: "darkRed"
    width: 200
    height: 60

    Text {
        text: button.title
        color: "white"
        font.bold: true
        font.pixelSize: 25
        anchors.centerIn: parent
    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: button
                color: "blue"
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: button
                color: "darkRed"
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked:
            if (button.state == "pressed") {
                button.state = "hover"
            } else {
                button.state = "pressed"
            }
        onEntered:
            if (button.state != "pressed") {
                button.state = "hover"
            }
        onExited:
            if (button.state != "pressed") {
                button.state = ""
            }
    }

    transitions: Transition {
        ColorAnimation {
            duration: 200 // ms
        }
    }
}
