#include "itemfactory.h"

ItemFactory::ItemFactory(QObject *parent) : QObject{parent}{

}
std::string ItemFactory::getName(){
    return m_name;
}

ItemFactory::ItemFactory(std::string name){
    m_name = name;
}


QString ItemFactory::getItemImage(){
    QString image;

    if(getName() == "Potion"){
        image = "../images/potion.png";
    }else if(getName() == "Axe"){
        image = "../images/axe.png";
    }else if(getName() == "Key"){
        image = "../images/key.png";
    }
    return image;
}
