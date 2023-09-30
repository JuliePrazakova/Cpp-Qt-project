import QtQuick 2.15

Rectangle {
    id: level
    property string title: ""

    color: "transparent"
    width : 75
    height: 40
    anchors {
        rightMargin: 10
        topMargin: 20
        leftMargin: 5
        bottomMargin: 10

    }

    Text {
        text: level.title
        wrapMode: Text.Wrap
        color: "White"
        font.pixelSize: 25
        anchors.fill: parent
        anchors.centerIn: parent
        padding: 10
        topPadding: 5
    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: level
                color: "blue"
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: level
                color: "darkRed"
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked:
            if (level.state === "pressed") {
                level.state = "hover"
            } else {
                level.state = "pressed"
            }
        onEntered:
            if (level.state !== "pressed") {
                level.state = "hover"
            }
        onExited:
            if (level.state !== "pressed") {
                level.state = ""
            }
    }

    transitions: Transition {
        ColorAnimation {
            duration: 200 // ms
        }
    }

}

