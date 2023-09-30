import QtQuick 2.9
import QtQuick.Window 2.2



Window {
    id: window
    visible: true
    width: 1500
    height: 750
    title: qsTr("Karak Game")

    Image{
        source: "/images/karak.png"
        anchors.fill: parent
    }

    SetUpInfo {
        id: rules
        visible: false
    }

    Rectangle{
        id: levels
        width: 200
        height: 300
        visible: false
        anchors.left: rules.right
        anchors.bottom: parent.bottom
        anchors {
            leftMargin: 150
            bottomMargin: 100
        }
        color: "transparent"

        Text {
            id: chooseLevel
            text: "Choose level:"
            color: "darkGrey"
            font {
                pixelSize: 40
                weight: Font.Bold
            }
        }


        LevelBtn{
            id: hard
            anchors.right: parent.right
            anchors.top: easy.bottom
            title: "Hard"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mapa.visible = true;
                    levels.visible = false;
                    rules.visible = false;
                    generator.levelChanged();
                }
            }
        }

        LevelBtn{
            id: easy
            anchors.top: chooseLevel.bottom
            anchors.right: parent.right

            title: "Easy"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mapa.visible = true;
                    levels.visible = false;
                    rules.visible = false;
                    title:  generator.level
                    generator.levelChanged();
                }
            }
        }

        HelpBtn {
            visible: false
            id: easyHelp
            title: "?"
            anchors {
                left: easy.right
                top: easy.top
                leftMargin: 15
            }
            MouseArea {
                anchors.fill: parent
                onClicked: { helpDialogEasy.visible = !helpDialogEasy.visible }
            }

            HelpDialogEasy {
                id: helpDialogEasy
                anchors{
                    left: easyHelp.right
                    bottom: parent.bottom
                }

            }
        }


        HelpBtn {
            visible: false;
            id: hardHelp
            title: "?"
            anchors {
                left: hard.right
                top: hard.top
                leftMargin: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {helpDialogHard.visible = !helpDialogHard.visible}
            }

            HelpDialogHard {
                id: helpDialogHard
                anchors{
                    left: hardHelp.right
                    bottom: parent.bottom
                }

            }
        }

    }

    StartButton {
        id: first
        MouseArea {
            anchors.fill: parent
            onClicked: {
                rules.visible = true;
                levels.visible = true;
                first.visible = false;
                easyHelp.visible = true;
                hardHelp.visible = true;
                menu.visible = true;
            }
        }
    }

    Mapa{
        visible: false
        id: mapa
        anchors{
            top: parent.top
            left: parent.left
            leftMargin: 50
        }
    }

    GameEnd {
        id: endBanner
        gameText: "You Lost!"
        visible: false
        //visible: generator.gameOver
    }

    Menu {
        id: menu
        visible: false
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
            leftMargin: 10
            topMargin: 10
            rightMargin: 10
        }
    }
    Rectangle{
        id: lostRectangle
        width: 1500
        height: 750
        color: "black"
        anchors.fill: parent

        visible: hero.lost


        Text{
            id:lost
            text: "YOU LOST!";
            color: "darkRed"
            font{
                pixelSize: 100
            }
            anchors{
                centerIn: parent
            }


        }
    }

}
