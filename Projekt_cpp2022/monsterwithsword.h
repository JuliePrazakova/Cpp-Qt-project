#ifndef MONSTERWITHSWORD_H
#define MONSTERWITHSWORD_H

#include <QObject>
#include "monsterfactory.h"

class MonsterWithSword : public MonsterFactory
{
    //Q_OBJECT
    Q_PROPERTY(int lifesMonsterWithSword READ getLifesMonsterWithSword NOTIFY lifesChangedMonsterWithSword)
    Q_PROPERTY(int powerMonsterWithSword READ getPowerMonsterWithSword NOTIFY powerChangedMonsterWithSword)

public:
   //explicit MonsterWithSword(QObject *parent = nullptr);

    int getLifesMonsterWithSword() const;
    Q_INVOKABLE void updateLifesMonsterWithAxe();

    int getPowerMonsterWithSword() const;
    Q_INVOKABLE void updatePowerMonsterWithAxe();

    MonsterWithSword();
signals:
    void lifesChangedMonsterWithAxe();
    void powerChangedMonsterWithAxe();
};
#endif // MONSTERWITHSWORD_H
