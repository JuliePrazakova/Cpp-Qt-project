import QtQuick 2.0

Rectangle {
    id: help
    property string title: ""

    color: "transparent"
    width : 30
    height: 30
    anchors {
        rightMargin: 10
        topMargin: 10
        leftMargin: 10
        bottomMargin: 10
    }

    Image {
        id: question
        source: "/images/question_icon.png"
        anchors.centerIn: parent
        anchors.fill:parent


    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: help
                color: "blue"
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: help
                color: "darkRed"
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked:
            if (help.state === "pressed") {
                help.state = "hover"
            } else {
                help.state = "pressed"
            }
        onEntered:
            if (help.state !== "pressed") {
                help.state = "hover"
            }
        onExited:
            if (help.state !== "pressed") {
                help.state = ""
            }
    }

    transitions: Transition {
        ColorAnimation {
            duration: 200 // ms
        }
    }
}


