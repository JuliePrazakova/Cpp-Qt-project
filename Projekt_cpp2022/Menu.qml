import QtQuick 2.0

Rectangle {
    height: 60
    color: "transparent"
    anchors{
        top: parent.top
        topMargin: 20
        left: parent.left
        leftMargin: 20
    }
    Image {
        id: restart
        source: "/images/restart_icon2.png"
        anchors{
            left: parent.left
        }

        MouseArea {
            anchors.fill: parent
            onClicked: submenuRestart.visible = !submenuRestart.visible
        }
    }

    Column {
        id: submenuRestart
        anchors {
            top: restart.bottom
            left: restart.left
        }
        visible: false

        ButtonMenu {
            title: "Restart game"
            color: "transparent"
            MouseArea {
                anchors.fill: parent
                //onClicked: console.log("TODO: Reset the grid")
            }
        }

        ButtonMenu {
            title: "Cancel"
            color: "transparent"
            MouseArea {
                anchors.fill:parent
                onClicked: submenuRestart.visible = false
            }
        }

    }


    Image {
        id: infoGame
        source: "/images/info_icon2.png"
        anchors{
            left: restart.right
        }

        MouseArea {
            anchors.fill: parent
            onClicked: submenuInfo.visible = !submenuInfo.visible

        }
        Rectangle {
            id: submenuInfo
            property string title: "Pomocí šipek se pohybuj po mapě a porážej příšery, které ti přijdou do cesty. Jakmile dostaneš klíč, zamiř ke dvěřím a poraž Bosse"
            color: "transparent"
            width : 400
            height: 200
            anchors {
                top: infoGame.bottom
                left: infoGame.left
            }
            visible: false

            Text {
                text: submenuInfo.title
                wrapMode: Text.Wrap
                color: "white"
                font.pixelSize: 20
                anchors.fill: parent
                anchors {
                    rightMargin: 5
                    topMargin: 5
                    leftMargin: 5
                    bottomMargin: 5
                }
            }

        }
    }

    //Dodelat ukončení hry
    Image {
        id: esc
        source: "/images/close_icon2.png"
        anchors{
            right: parent.right
        }

        MouseArea {
            anchors.fill: parent
            onClicked: submenuEsc.visible = !submenuEsc.visible

        }
        Column {
            id: submenuEsc
            anchors {
                top: esc.bottom
                right: esc.right
            }
            visible: false

            ButtonMenu {
                title: "Quit"
                color: "transparent"
                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.quit()
                }
            }

            ButtonMenu {
                title: "Save"
                color: "transparent"
                MouseArea {
                    anchors.fill: parent
                    // napojit na soubor
                }
            }

            ButtonMenu {
                title: "Cancel"
                color: "transparent"
                MouseArea {
                    anchors.fill:parent
                    onClicked: submenuEsc.visible = false
                }
            }

        }
    }

}



