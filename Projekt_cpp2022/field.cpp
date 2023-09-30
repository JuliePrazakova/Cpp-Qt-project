#include "field.h"


Field::Field(QObject *parent) : QObject(parent)
{

}

Field::Field(const int imageId, const int left, const int right, const int up, const int down): QObject() {
    m_imageId = imageId;
    m_left = left;
    m_right = right;
    m_up = up;
    m_down = down;
    m_monster = nullptr;
}

Monster* Field::getMonster() const {
    return m_monster;
}

int Field::getImageId() const {
    return m_imageId;
}

int Field::getLeft() const{
    return m_left;
}
int Field::getRight() const{
    return m_right;
}
int Field::getUp() const{
    return m_up;
}
int Field::getDown() const{
    return m_down;
}

bool Field::isRevealed() const {
    return m_isRevealed;
}

void Field::reveal() {
    m_isRevealed = true;
    emit isRevealedChanged();
}


bool Field::isThereMonster() const {
    if (m_monster != nullptr)
        return true;
    else
        return false;
}

void Field::createMonster(Monster * newMonster){
    m_monster = newMonster;
}

int Field::getMonsterLifes() const{
    if (m_monster == nullptr) {
        return 0;
    }

    return m_monster->getLife();


}

void Field::updateMonsterLifes(){
    //int lifes = getMonsterLifes();
    //lifes --;
    emit monsterLifesChanged();
}

//void Field::setLifes(int newLifes){
  // Monster::getLife() = newLifes;
    //emit monsterLifesChanged();
//}


int Field::getMonsterPower(){
    if (m_monster == nullptr) {
        return 0;
    }

    return m_monster->getPower();
}

QString Field::getMonsterImage(){
    QString image;

    if (getImageId() == 6 or getImageId() == 5){
        image = "../images/MonsterWithAxe.PNG";
    } else if (getImageId() == 2 or getImageId() == 0){
        image = "../images/MonsterWithSword.PNG";
    } else if(getImageId() == 8){
        image = "../images/Dragon.PNG";
    }
    return image;
}


