#include "map.h"
#include "itemlife.h"
#include "itempower.h"

Map::Map(QObject *parent): QObject(parent)
{
    //nasetovani mapy s 9 poli
    m_fields =
    {
        new Field(0, 0, 1, 0, 1), new Field(1, 1, 1, 0, 0), new Field(2, 1, 0, 0, 1),
        new Field(3, 0, 1, 1, 1), new Field(4, 1, 1, 0, 1), new Field(5, 1, 0, 1, 1),
        new Field(6, 0, 1, 1, 0), new Field(7, 1, 0, 1, 0), new Field(8, 0, 0, 1, 1)
    };
}

void Map::revealField(const int index) {

    m_fields.at(index)->reveal();

}

QVariant Map::getFields() const {
    return QVariant::fromValue(m_fields);
}


void Map::generate(){

    m_fields.at(6)->createMonster(new Monster("monsterwithaxe",15, 100, new ItemPower("Axe",20)));
    m_fields.at(2)->createMonster(new Monster("monsterwithaxe",15, 100, new ItemPower("Axe",20)));

    m_fields.at(0)->createMonster(new Monster("monsterwithsword",25,100, new ItemLife("Potion",20)));
    m_fields.at(5)->createMonster(new Monster("monsterwithkey",25,100, new ItemLife("Key", 0))); //new ItemFactory("klic")

    m_fields.at(8)->createMonster(new Monster("dragon",30,100, nullptr));

}






