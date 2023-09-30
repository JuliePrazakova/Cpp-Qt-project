#ifndef HERO_H
#define HERO_H

#include <QObject>
#include <QVector>
#include <vector>
#include <QVariant>
#include "itemfactory.h"
//#include "itemlife.h"
//#include "itempower.h"
#include "monster.h"
//#include "field.h"

class Hero : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int lifes READ getLifes NOTIFY lifesChanged)
    Q_PROPERTY(int index READ getIndex NOTIFY indexChanged)
    Q_PROPERTY(int power READ getPower NOTIFY powerChanged)
    Q_PROPERTY(QVariant pocket READ getItems NOTIFY pocketChanged)
    Q_PROPERTY(bool hasKey READ hasKeyDragon NOTIFY keyChanged)
    Q_PROPERTY(bool lost READ Lost NOTIFY lostChanged)
    Q_PROPERTY(int dice1 READ getRoll1 NOTIFY diceChanged)
    Q_PROPERTY(int dice2 READ getRoll2 NOTIFY diceChanged2)



private:
    int m_power;
    int m_lifes;
    std::vector<ItemFactory *> m_pocket;
    int m_index;
    //int m_maxPocetPredmetu;

public:
    explicit Hero(QObject *parent = nullptr);

    bool Lost();
    int getRoll1();
    int getRoll2();

    void setLifes(int newLifes);
    //void addLife(ItemLife* Item);

    int getPower();
    void setPower(int newPower);
    //void addPower(ItemPower* Item);

    bool rollDice();

    Q_INVOKABLE void fight(Monster* Monster);

    int getLifes() const;
    Q_INVOKABLE void updateLifes(int index);

    int getIndex() const;
    Q_INVOKABLE void updateIndex(int oKolik);

    int getPower() const;
    Q_INVOKABLE void updatePower(int index);

    void addItem(ItemFactory* item);
    Q_INVOKABLE QVariant getItems() const;

    Q_INVOKABLE bool hasKeyDragon() const;

signals:
    void lifesChanged();
    void indexChanged();
    void powerChanged();
    void pocketChanged();
    void keyChanged();
    void lostChanged();
    void diceChanged();
    void diceChanged2();


};
#endif //HERO_H
