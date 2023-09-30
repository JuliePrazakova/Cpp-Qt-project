#include "monster.h"
//#include "field.h"

int Monster::getPower(){
    return m_power;
}

int Monster::getLife() const{

    return m_life;

}

ItemFactory* Monster::getItem(){
    return m_item;
}

Monster::Monster(std::string name, int power, int life){
    m_name = name;
    m_power = power;
    m_life = life;
}

Monster::Monster(std::string name, int power, int life, ItemFactory* item)
{
    m_name = name;
    m_power = power;
    m_life = life;
    m_item = item;
}

void Monster::updateMonsterLifes(){
    m_life--;
    emit lifesChangedMonster();
}



void Monster::setLifes(int newLifes) {
    m_life = newLifes;
    emit lifesChangedMonster();
}
