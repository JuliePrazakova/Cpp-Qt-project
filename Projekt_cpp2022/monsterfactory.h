#ifndef MONSTERFACTORY_H
#define MONSTERFACTORY_H

#include "itemfactory.h"


class MonsterFactory : public QObject
{
    Q_OBJECT

private:
    std::vector<ItemFactory*> m_item;
    std::vector<ItemFactory*> getItem();

    void printItem();
    std::string getName();
    void printPower();



public:
    explicit MonsterFactory(QObject *parent = nullptr);

    MonsterFactory(std::string name, int power, int life); //Mozna pak i level, aby se mu meninla sila podle levelu??
    int m_power;
    std::string m_name;
    int m_life;
    int getPower();
    int getLife();

signals:

};

#endif // MONSTERFACTORY_H
