import QtQuick 2.15


//kod ze cviceni s bombama, neni potreba nic vic dovede udelat grid sam
Rectangle{
    // mapa lehka, prekryvajici se obrazky, zde se bude delat zmena stavu ze se bude menit videlnost cest a tim prekrujou obrazky draka
    width: parent
    height: 500
    anchors {
        bottom: parent.bottom
    }

    //Grid od pole = vypisuje policka Tile.qml
    Grid {
        anchors {
            bottom: parent.bottom
            bottomMargin: 100
        }
        columns: 3
        rows: 3
        Repeater {
            //nejdulezitejsi radek bez ktereho to nezobrazi mapu
            model: map.fields

            Tile {
                tileIndex: index
            }
        }
        //obrazek postavy = zatim jen cerveny ctverec
        Rectangle{
            id: postavicka  // graficky se to dodela pozdeji
            property int index: hero.index
            width:15
            height: 15
            x:68 + 150 * (hero.index - 3 * Math.floor(hero.index / 3) )
            y:68 + 150 * Math.floor(hero.index / 3)
            color: "red"
        }
    }
    Rectangle{
        id: bojovnikRectangle
        width: 500
        height: 300
        color: "transparent"

        x:900
        y:300

        //BOJOVNIK
        Image {
            id: postava
            source: "/images/bojovnik.png"
            width: 160
            height: 235
            anchors {
                bottom: parent.bottom
                left: parent.left
            }
        }

        //vypsani zivotu
        Rectangle{
            id: livesRectangle
            width: 150
            height: 50
            color: "transparent"
            anchors {
                top: postava.bottom
            }

            Image{
                id:zivotyHero
                source: "/images/icon_heart.png"
                width : 30
                height: 30
                anchors {
                    left: parent.left
                }

            }
            Text {
                id: lives
                text: qsTr("Zivoty: ") && hero.lifes
                color: "white"
                font {
                    pixelSize: 20
                }
                anchors{
                    left: parent.left
                    leftMargin: 35
                }
            }
        }

        Rectangle{
            id: powerRectangle
            width: 150
            height: 50
            color: "transparent"
            anchors {
                top: livesRectangle.bottom
            }

            Image{
                id:powerHero
                source: "/images/storm.png"
                width : 30
                height: 30
                anchors {
                    left: parent.left
                }

            }
            Text {
                id: power
                text: qsTr("Sila: ") && hero.power
                color: "white"
                font {
                    pixelSize: 20
                }
                anchors{
                    left: parent.left
                    leftMargin: 35
                }
            }
        }

        Text{
            id: herotext
            text: "Your hero"
            color: "white"
            font{
                pixelSize: 25
            }
            anchors{
                bottom: postava.top
                left: postava.left
                bottomMargin: 10
            }
        }

        // MONSTER
        Image {
            id: monster
            source: map.fields[hero.index].getMonsterImage
            width: 160
            height: 235
            anchors {
                bottom: parent.bottom
                left: postava.right
                leftMargin: 50
            }
            visible: map.fields[hero.index].isMonster  || map.fields[8].hasKeyDragon === true
        }

        //vypsani zivotu
        Rectangle{
            id: livesRectangleMonster
            width: 150
            height: 50
            color: "transparent"
            anchors {
                left: monster.left
                top: monster.bottom
            }
            visible: map.fields[hero.index].isMonster


            Image{
                id:zivotyMonster
                source: "/images/icon_heart.png"
                width : 30
                height: 30
                anchors {
                    left: parent.left
                }
                //visible: map.fields[hero.index].isMonster

            }

            Text {
                id: livesMonster
                text: qsTr("Zivoty: ") && map.fields[hero.index].lifesMonster
                color: "white"
                font {
                    pixelSize: 20
                }
                anchors{
                    left: parent.left
                    leftMargin: 35
                }
                //visible: map.fields[hero.index].isMonster
            }
        }
        Text{
            id: enemytext
            text: "Your enemy"
            color: "white"
            font{
                pixelSize: 25
            }
            anchors{
                bottom: monster.top
                left: monster.left
                bottomMargin: 10
            }
            visible: map.fields[hero.index].isMonster
        }


        // vypsani sily
        Rectangle{
            id: powerRectangleMonster
            width: 150
            height: 50
            color: "transparent"
            anchors{
                top: livesRectangleMonster.bottom
                left: livesRectangleMonster.left
            }
            //visible: map.fields[hero.index].isMonster


            Image{
                id:powerMonsterAxe
                source: "/images/storm.png"
                width : 30
                height: 30
                anchors {
                    left: parent.left
                }
                visible: map.fields[hero.index].isMonster

            }

            Text{
                id: powerMonster1
                text:qsTr("Power: ") && map.fields[hero.index].powerMonster
                color: "white"
                font {
                    pixelSize: 20
                }
                anchors{
                    left: parent.left
                    leftMargin: 35
                }
                visible: map.fields[hero.index].isMonster
            }
        }


        //DRAK - BOSS

        /*       Image {
            id: drak
            //source: "/images/Dragon.png"
            width: 160
            height: 235
            anchors {
                bottom: postava.bottom
                left: postava.right
                leftMargin: 50
            }
            visible:false; //pri kliknuti na klic
        }

        //vypsani zivotu
        Rectangle{
            id: livesRectangleDrak
            width: 150
            height: 50
            color: "transparent"
            anchors {
                left: drak.left
                top: drak.bottom
            }
            visible:false; //pri kliknuti na klic


            Image{
                id:zivotyDrak
                source: "/images/icon_heart.png"
                width : 30
                height: 30
                anchors {
                    left: parent.left
                }
                visible:false; //pri kliknuti na klic

            }

            Text {
                id: livesDrak
                text: qsTr("Zivoty: ") && map.fields[hero.index].lifesMonster
                color: "white"
                font {
                    pixelSize: 20
                }
                anchors{
                    left: parent.left
                    leftMargin: 35
                }
                visible:false; //pri kliknuti na klic
            }
        }
        Text{
            id: draktext
            text: "Dragon Boss"
            color: "white"
            font{
                pixelSize: 25
            }
            anchors{
                bottom: drak.top
                left: drak.left
                bottomMargin: 10
            }
            visible:false; //pri kliknuti na klic
        }


        // vypsani sily
        Rectangle{
            id: powerRectangleDrak
            width: 150
            height: 50
            color: "transparent"
            anchors{
                top: livesRectangleDrak.bottom
                left: livesRectangleDrak.left
            }
            visible:false; //pri kliknuti na klic


            Image{
                id:powerDrak
                source: "/images/storm.png"
                width : 30
                height: 30
                anchors {
                    left: parent.left
                }
                visible:false; //pri kliknuti na klic

            }

            Text{
                id: powerDrak1
                text:qsTr("Power: ") && map.fields[hero.index].powerMonster
                color: "white"
                font {
                    pixelSize: 20
                }
                anchors{
                    left: parent.left
                    leftMargin: 35
                }
                visible:false; //pri kliknuti na klic
            }
        }*/




        Rectangle{
            id: inventoryRectangle
            width: 100
            height: 235
            color: "transparent"
            anchors{
                right: parent.right
                top: monster.top
            }
            border.color: "black";
            border.width: 1;


            Repeater {
                model: hero.pocket

                Image {
                    id: item
                    source: itemfactory.getItemImage
                    width: 50
                    height: 50
                    anchors {
                        top: parent.top
                        topMargin: 10
                    }
                    visible: true
                }
          /*      Image{
                    id:potion
                    source: "/images/potion.png"
                    width : 50
                    height: 50
                    anchors {
                        top: parent.top
                        topMargin: 10
                    }
                    visible:true

                    MouseArea{
                        anchors.fill: potion
                        onClicked: {
                            hero.updateLifes
                        }
                    }

                }


                Image{
                    id:axe
                    source: "/images/axe.png"
                    width : 50
                    height: 50
                    anchors {
                        top: potion.bottom
                        topMargin: 10
                    }
                    visible: true

                    MouseArea{
                        anchors.fill: axe
                        onClicked: {
                            hero.updatePower
                        }
                    }

                }

                Image{
                    id:key
                    source: "/images/key.png"
                    width : 50
                    height: 50
                    anchors {
                        bottom: parent.bottom
                        topMargin: 10
                    }
                    visible:true

                }*/



            }


            /*
            Image{
                id:potion
                source: "/images/potion.png"
                width : 50
                height: 50
                anchors {
                    top: parent.top
                    topMargin: 10
                }

                visible: hero.pocket

                MouseArea{
                    anchors.fill: potion
                    onClicked: {
                        hero.updateLifes
                    }
                }

            }

            Image{
                id:axe
                source: "/images/axe.png"
                width : 50
                height: 50
                anchors {
                    top: potion.bottom
                    topMargin: 10
                }
                visible: hero.pocket

                MouseArea{
                    anchors.fill: axe
                    onClicked: {
                        hero.updatePower
                    }
                }




            }

            Image{
                id:key
                source: "/images/key.png"
                width : 50
                height: 50
                anchors {
                    top: axe.bottom
                    topMargin: 10
                }
                visible:hero.pocket

                MouseArea{
                    anchors.fill: key
                    onClicked: {

                    }
                }


            }
*/

        }

        Text{
            id:inventoryText
            text: "Inventory"
            color: "white"
            font{
                pixelSize: 25
            }
            anchors{
                bottom: inventoryRectangle.top
                left: inventoryRectangle.left
                bottomMargin: 10
            }
        }
    }
    Rectangle{
        id: bojRectangle
        width: 252
        height: 150
        color: "transparent"
        anchors{
            bottom: nahoru.top
            left: vlevo.left
            rightMargin: 10
            bottomMargin: 80
        }

        visible: map.fields[hero.index].isMonster  || map.fields[hero.index].imageId !== 8

        Text{
            id: bojtext
            text: "Na cestě se ti objevil kostlivec!
Uteč, nebo hoď kostkou a bojuj!
Pokud kostlivce zabiješ, můžeš získat
pár předmětů, a možná i klíč  "
            color: "white"
            font{
                pixelSize: 17
            }
            anchors{
                top: parent.top
                leftMargin: 5
                rightMargin: 5
                bottomMargin: 5
                topMargin: 5

            }
            visible: map.fields[hero.index].isMonster
        }
    }

    Rectangle{
        id:hodKostkou
        width: 200
        color: "white"
        height: 50
        anchors{
            top: bojRectangle.bottom
            topMargin: 5
            left: bojRectangle.left
        }
        visible: map.fields[hero.index].isMonster


        MouseArea{
            anchors.fill: parent
            onClicked: {
                hero.fight(map.fields[hero.index].monster);
                hodCislo1.visible = true
                hodCislo2.visible = true
                kostky.visible = true
                bojRectangle.visible = false;

            }

        }

        Text{
            id:hodit
            text: "HODIT";
            color: "black"
            font{
                pixelSize: 30
            }
            anchors{
                centerIn: parent
            }
            visible: map.fields[hero.index].isMonster

        }

        Image{
            id: kostky;
            source: "/images/dices.png"
            width : 60
            height: 60
            anchors{
                left: hodKostkou.left
                bottom: hodKostkou.top
                bottomMargin: 30
            }
            visible: false;
        }


        Text{
            id:hodCislo1
            text: hero.dice1
            color: "white"
            font{
                pixelSize: 30;
            }
            anchors{
                bottom: kostky.bottom
                left: kostky.right
                leftMargin: 5
            }
            visible: false;
        }

        Text{
            id:hodCislo2
            text: " + " + hero.dice2
            color: "white"
            font{
                pixelSize: 30;
            }
            anchors{
                top: hodCislo1.top
                left: hodCislo1.right
            }
            visible: false;
        }



    }



    //SIPKY AKTIVNI
    Image{
        id: vpravo
        source: "/images/sipka.png"
        width: 80
        height: 80
        visible: map.fields[postavicka.index].right === 1
        x: 760
        y:580
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //backend ulozi data o postave
                hero.updateIndex(1);

                //komunikace s backendem = zobraz pole
                map.revealField(postavicka.index);

            }
        }
    }
    Image{
        id: vlevo
        source: "/images/sipka.png"
        width: 80
        height: 80
        rotation: 180
        visible: map.fields[postavicka.index].left === 1
        y:580
        x:600
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //backend ulozi data o postave
                hero.updateIndex(-1);

                //komunikace s backendem = zobraz pole
                map.revealField(postavicka.index);


            }
        }

    }
    Image{
        id: dolu
        source: "/images/sipka.png"
        width: 80
        height: 80
        visible: map.fields[postavicka.index].down === 1
        x:680
        y:580
        rotation:90
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //backend ulozi data o postave
                hero.updateIndex(3);

                //komunikace s backendem = zobraz pole
                map.revealField(postavicka.index);

            }
        }

    }
    Image{
        id: nahoru
        source: "/images/sipka.png"
        width: 80
        height: 80
        //x:80
        x: 680
        y: 500
        rotation:270
        visible: map.fields[postavicka.index].up === 1
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //backend ulozi data o postave
                hero.updateIndex(-3);

                //komunikace s backendem = zobraz pole
                map.revealField(postavicka.index);

            }
        }
    }

    //SIPKY DEAKTIVOVANE
    Image{
        source: "/images/sipka.png"
        opacity: 0.5
        width: 80
        height: 80
        x: 760
        y:580
    }
    Image{
        source: "/images/sipka.png"
        opacity: 0.5
        width: 80
        height: 80
        rotation: 180
        y:580
        x:600
    }
    Image{
        source: "/images/sipka.png"
        opacity: 0.5
        width: 80
        height: 80
        x:680
        y:580
        rotation:90
    }
    Image{
        source: "/images/sipka.png"
        opacity: 0.5
        width: 80
        height: 80
        x: 680
        y: 500
        rotation:270
    }


}




