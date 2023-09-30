import QtQuick 2.15

Rectangle {
    id: info
    property string title: "
    When a player chooses to enter an undiscovered zone as one of their actions, the player selects a dungeon tile from one of the piles, flips it over, and connects it to the tile they are currently on.
    Then they move their hero onto the new tile. The new tile must have a route that connects to the previous tile, but all other routes can form dead ends. A dungeon tile can be any one of the following
"

    color: "transparent"
    width : 600
    height: 300
    anchors{
        bottom: parent.bottom
        bottomMargin: 100
        left: parent.left
        leftMargin: 100
    }

    Text {
        id: headingInfo
        text: "Rules of Karak:"
        color: "darkGrey"
        font {
            pixelSize: 40
            weight: Font.Bold
        }
    }


    Text {
        text: info.title
        wrapMode: Text.Wrap
        color: "darkGray"
        font.pixelSize: 20
        anchors.fill: parent
        anchors {
            rightMargin: 50
            topMargin: 40
            leftMargin: 50
            bottomMargin: 50
        }
    }
}
