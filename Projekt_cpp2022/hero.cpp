#include "hero.h"
#include <QDebug>
#include <iostream>
#include <random>
#include <stdlib.h>
//#include "itemlife.h"

Hero::Hero(QObject *parent): QObject{parent}, m_power(25), m_lifes(100), m_index(7) // tohle budou startovni pozice daneho hrdiny
{
    for (unsigned long long int var = 0; var < m_pocket.size(); ++var) {
        m_pocket.push_back(nullptr);
    }
}

int Hero::getIndex() const{
    return m_index;
}

void Hero::updateIndex(int oKolik){
    m_index += oKolik;
    emit indexChanged();
}

int Hero::getLifes() const{
    return m_lifes;
}

void Hero::updateLifes(int index){
    //m_lifes += Item->getLife();
    m_lifes += m_pocket.at(index)->m_bonusPower; //Prictou se zivoty + zivoty z itemu potion
    emit lifesChanged();
}

void Hero::updatePower(int index){
    //m_power += Item->getPower();
    m_power += m_pocket.at(index)->m_bonusPower; //pricte se sila z itemu sekera
    emit powerChanged();
}

int Hero::getPower(){
    return m_power;
}

void Hero::addItem(ItemFactory* item){

    m_pocket.push_back(item);
    std::cout << "Predmet pridan" << std::endl;
    std::cout << m_pocket.size() << std::endl;
    emit pocketChanged();
}

QVariant Hero::getItems() const {

    for (unsigned long long i = 0; i < m_pocket.size(); i++) {
        if (m_pocket.at(i) != nullptr){
            std::cout << "Pozice predmetu: " << i << std::endl;
        }

    }
    return QVariant::fromValue(m_pocket);
    //emit pocketChanged();
}


void Hero::setLifes(int newLifes) {
    m_lifes = newLifes;
    emit lifesChanged();
}

//void Hero::addLife(ItemLife* Item){
//  m_lifes += Item->getLife();
//}

int Hero::getRoll1(){
    int die1 = 0;
    die1 = rand() % 6 + 1;
    return die1;
}

int Hero::getRoll2(){
    int die2 = 0;
    die2 = rand() % 6 + 1;
    return die2;
}

bool Hero::rollDice(){

    int sum = getRoll1() + getRoll2();
    emit diceChanged();
    emit diceChanged2();
    if(sum >= 4) {
        return true;
    }
    return false;

    /*    int die1 = 0;
    int die2 = 0;

    die1 = rand() % 6 + 1;
    die2 = rand() % 6 + 1;
    int sum = die1 + die2;
    emit diceChanged();

    if(sum >= 10) {
        return true;
    }
    return false;*/
}


void Hero::fight(Monster* monster){
    if (monster != nullptr){


        if (monster->getLife() > 0 and getLifes() >0){
            if(rollDice()){

                monster->setLifes(monster ->getLife() - getPower());

            } else{
                setLifes(getLifes() - monster->getPower());

            }
            if (getLifes() <= 0){
                std::cout<< "Prohral jsi" <<std::endl;
                Lost();
                emit lostChanged();
            }
        }

        if(monster->getLife() <= 0){
            addItem(monster->getItem());
            //std::cout << monster->getItem() << std::endl;
            delete monster;
        }
    }

}

bool Hero::Lost(){
    bool prohra = false;
    if(getLifes() <= 0){
        prohra = true;
    }
    return prohra;
}


void Hero::setPower(int newPower){
    m_power = newPower;
}

//void Hero::addPower(ItemPower* Item){
//  m_power += Item->getPower();
//}

bool Hero::hasKeyDragon()const {
    bool result = false;

    for (unsigned int i = 0; i < m_pocket.size(); ++i) {
        if(m_pocket.at(i)->m_name == "klic")
            result = true;
    }
    return result;
}



