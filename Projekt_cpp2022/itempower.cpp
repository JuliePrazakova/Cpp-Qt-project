#include "itempower.h"

int ItemPower::getPower(){
    return m_power;
}

ItemPower::ItemPower(){}
ItemPower::ItemPower(std::string name, int power) : ItemFactory(name){
    m_power = power;
}

