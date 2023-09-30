import QtQuick 2.15

Rectangle{
    color: "red"
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
/*
  tohle nam teda zajistilo aby pri stisknuti tlacitek se menila cisla x a y co hrdina drzi v sobe.
  Napadlo me ze pri vytvareni jednotlivych policek v beckendu tak by kazde policko drzelo svoji souradnici x a y
  Pokud by se x a y shodovali tak by se pole odkrylo
  a zaroven by policlo drzelo 4 bool hodnoty kteryma by menila viditelnost sipek
  dal by melo policko bool hodnotu jestli se vyskytuje nepritel a podle toho by zacal boj
  */
