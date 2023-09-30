import QtQuick 2.9
import QtQuick.Window 2.2



Rectangle {

    width: 461
   height: 461

    anchors{
        bottom:parent.bottom
    }
    Grid {
        anchors.centerIn: parent
        columns: 3
        rows: 3
        Repeater {
            //nejdulezitejsi radek bez ktereho to nezobrazi mapu
            model: map.fields

            Tile {
                tileIndex: index
            }
        }
    }
    Image {
        id: postava
        source: "/images/bojovnik.png"
        width: 160
        height: 235
        x:1055
        y:200
    }

    Rectangle{
        id: postavicka  // graficky se to dodela pozdeji
        width:15
        height: 15
        color: "red"
        x:-350
        y:100
    }

    Image{
     id: vpravo
    source: "/images/sipka.png"
    width: 80
    height: 80
    x:160
    y:80
    MouseArea{
        anchors.fill: parent
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //posun na frontendu
                postavicka.x=postavicka.x+152

                //backend ulozi data o postave
                hero.changeX(1);

                //komunikace s backendem = zobraz pole
                map.revealField(tileIndex);

            }
        }

    }

    }
    Image{
        id: vlevo
        source: "/images/sipka.png"
        width: 80
        height: 80
        rotation: 180
        y:80
       MouseArea{
           anchors.fill: parent
           onClicked: {
                postavicka.x=postavicka.x-152
               hero.changeX(-1);
           }
       }

    }
    Image{
         id: dolu
         source: "/images/sipka.png"
         width: 80
         height: 80
         x:80
         y:80
         rotation:90
         MouseArea{
             anchors.fill: parent
             onClicked: {
                postavicka.y=postavicka.y+152
                 hero.changeY(1);
             }
         }

    }
    Image{
        id: nahoru
        source: "/images/sipka.png"
        width: 80
        height: 80
        x:80
        rotation:270
        MouseArea{
            anchors.fill: parent
            onClicked: {
                postavicka.y=postavicka.y-152
                hero.changeY(-1);
            }
        }
    }
}
