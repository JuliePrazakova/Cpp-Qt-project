#ifndef MONSTER_H
#define MONSTER_H

#include <QObject>
#include "itemfactory.h"

class Monster : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int lifesMonster READ getLife NOTIFY lifesChangedMonster)


private:
    std::string m_name;
    int m_power;
    //int m_life;
    ItemFactory* m_item;

public:
    int m_life;
    explicit Monster(QObject *parent = nullptr);

    Monster(std::string name, int power, int life, ItemFactory* item);
    Monster(std::string name, int power, int life);
    int getPower();
    //int getLife();
    ItemFactory* getItem();
    void setLifes(int newLifes);

    int getLife() const;
    Q_INVOKABLE void updateMonsterLifes();

signals:
    void lifesChangedMonster();
};

#endif // MONSTER_H
