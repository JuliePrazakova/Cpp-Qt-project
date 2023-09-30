#include "monsterfactory.h"


MonsterFactory::MonsterFactory(QObject *parent)
    : QObject{parent}
{

}

MonsterFactory::MonsterFactory(std::string name, int power, int life){
    m_name = name;
    m_power = power;
    m_life = life;
}
int MonsterFactory::getPower(){
    return m_power;
}
std::vector<ItemFactory*> getItem();

void MonsterFactory::printPower(){

}
void MonsterFactory::printItem(){

}
std::string MonsterFactory::getName(){
    return m_name;
}
int MonsterFactory::getLife(){
    return m_life;
}
