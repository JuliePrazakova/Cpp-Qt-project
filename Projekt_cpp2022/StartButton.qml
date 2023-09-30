import QtQuick 2.15

Rectangle {
    id: info
    property string title: "Start the Game"

    color: "transparent"
    border.color: "transparent"
    width : 220
    height: 60
    anchors.centerIn: parent


    Text {
        text: info.title
        color: "darkGrey"
        font.pixelSize: 30
        anchors.fill: parent
        anchors.centerIn: parent
        padding: 10
    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: info
                color: "blue"
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: info
                color: "darkRed"

            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked:
            if (info.state === "pressed") {
                info.state = "hover"
            } else {
                info.state = "pressed"
            }
        onEntered:
            if (info.state !== "pressed") {
                info.state = "hover"
            }
        onExited:
            if (info.state !== "pressed") {
                info.state = ""
            }
    }

    transitions: Transition {
        ColorAnimation {
            duration: 200 // ms
        }
    }
}
