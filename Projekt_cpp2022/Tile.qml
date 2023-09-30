import QtQuick 2.0

Rectangle {
    property int tileIndex: 0

    id: mineTile
    width: 150
    height: 150
    color: "black"

    //obecna trida Tile obsahuje vsechny mozne tily = 9 dilku mapy + 1 obrazek skryte mapy
    //funguje to stejne jako cviko s bombama


    //SKRYTA MAPA
    Image {
        width: 150
        height: 150

        source: "/images/drak.png"
        anchors.fill: parent

        //jestlize neni nic odkryte zobrazi se tohle
        visible: map.fields[tileIndex].isRevealed === false
    }
    Image{
        width: 150
        height: 150
        source: "/images/zatacka.png"
        rotation: 180
        visible: map.fields[tileIndex].imageId === 7
    }

    //ODKRYTE CASTI MAPY
    Image {
        y:304
        width: 150
        height: 150
        id: tileImage
        source: "/images/zatackaPrisera.png"
        anchors.fill: parent

        //jestli je to pole co obsahuje ID 1 a zaroven je odkryte zobrazi se obrazek "zatacka"
        visible: map.fields[tileIndex].imageId === 0 && map.fields[tileIndex].isRevealed === true
    }
    Image {

        width: 150
        height: 150
        source: "/images/rozcesti.png"
        rotation: 180
        visible: map.fields[tileIndex].imageId === 3 && map.fields[tileIndex].isRevealed === true
    }

    Image {

        width: 150
        height: 150
        source: "/images/zatackaPrisera.png"
        rotation: 270
        visible: map.fields[tileIndex].imageId === 6 && map.fields[tileIndex].isRevealed === true
    }


    Image {
        width: 150
        height: 150

        source: "/images/rovne.png"

        visible: map.fields[tileIndex].imageId === 8 && map.fields[tileIndex].isRevealed === true
    }

    Image {
        width: 150
        height: 150
        source: "/images/rozcesti.png"
        rotation: 270
        visible: map.fields[tileIndex].imageId === 4 && map.fields[tileIndex].isRevealed === true
    }

    Image {
        width: 150
        height: 150
        source: "/images/zatackaPrisera.png"
        rotation: 90
        visible: map.fields[tileIndex].imageId === 2 && map.fields[tileIndex].isRevealed === true
    }


    Image {
        width: 150
        height: 150
        source: "/images/rozcestiPrisera.png"
        visible: map.fields[tileIndex].imageId === 5 && map.fields[tileIndex].isRevealed === true

    }

    Image {
        width: 150
        height: 150
        rotation: 90
        source: "/images/rovne.png"
        visible: map.fields[tileIndex].imageId === 1 && map.fields[tileIndex].isRevealed === true
    }

}
