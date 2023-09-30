#include "itemlife.h"

int ItemLife::getLife(){
    return m_life;
}

ItemLife::ItemLife(){}
ItemLife::ItemLife(std::string name, int life) : ItemFactory(name){
    m_life = life;
}

