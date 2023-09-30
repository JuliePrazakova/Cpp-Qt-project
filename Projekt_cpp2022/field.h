#ifndef FIELDDATA_H
#define FIELDDATA_H

#include <QObject>
#include "monster.h"
#include "itemfactory.h"

class Field : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isRevealed READ isRevealed NOTIFY isRevealedChanged) //relealovaci funkce
    Q_PROPERTY(int imageId READ getImageId NOTIFY imageIdChanged) //podle imageId pozna frontend, ktery obrazek tam dat

    Q_PROPERTY(int left READ getLeft NOTIFY leftChanged) //podle left pozna leva sipka, jestli ma byt deaktivovana
    Q_PROPERTY(int right READ getRight NOTIFY rightChanged) //prava
    Q_PROPERTY(int up READ getUp NOTIFY upChanged) //horni
    Q_PROPERTY(int down READ getDown NOTIFY downChanged) //spodni

    Q_PROPERTY(bool isMonster READ isThereMonster NOTIFY monsterChanged);
    Q_PROPERTY(int lifesMonster READ getMonsterLifes NOTIFY monsterLifesChanged);
    Q_PROPERTY(int powerMonster READ getMonsterPower CONSTANT);
    Q_PROPERTY(Monster* monster READ getMonster CONSTANT);
    Q_PROPERTY(QString getMonsterImage READ getMonsterImage CONSTANT);


private:
    bool m_isRevealed = false;
    int m_imageId;
    int m_left;
    int m_right;
    int m_up;
    int m_down;
    Monster* m_monster;// = nullptr;

public:
    explicit Field(QObject *parent = nullptr);
    Field(const int imageId, const int left, const int right, const int up, const int down);
    int getImageId() const;
    int getLeft() const;
    int getRight() const;
    int getUp() const;
    int getDown() const;
    bool isRevealed() const;
    void reveal();
    bool isThereMonster() const;
    //void setLifes(int newLifes);

    void createMonster(Monster * newMonster);
    Monster* getMonster() const;
    int getMonsterPower();
    QString getMonsterImage();

    int getMonsterLifes() const;
    Q_INVOKABLE void updateMonsterLifes();


signals:
    void monsterChanged();
    void isRevealedChanged(); //pro oznameni revealnuti do frontendu
    void imageIdChanged(); //pro poslani Id do frontendu, mozna tu byt nemusi tbh
    void leftChanged(); //poslani informace o deaktivaci leve sipky do frontendu
    void rightChanged();
    void upChanged();
    void downChanged();
    void monsterLifesChanged();
};

#endif // FIELDDATA_H
