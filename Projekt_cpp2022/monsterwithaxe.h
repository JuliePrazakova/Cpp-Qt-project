#ifndef MONSTERWITHAXE_H
#define MONSTERWITHAXE_H

#include "monsterfactory.h"
class MonsterWithAxe : public MonsterFactory
{
    //Q_OBJECT
    Q_PROPERTY(int lifesMonsterWithAxe READ getLifesMonsterWithAxe NOTIFY lifesChangedMonsterWithAxe)
    Q_PROPERTY(int powerMonsterWithAxe READ getPowerMonsterWithAxe NOTIFY powerChangedMonsterWithAxe)

public:
   //explicit MonsterWithAxe(QObject *parent = nullptr);

    int getLifesMonsterWithAxe() const;
    Q_INVOKABLE void updateLifesMonsterWithAxe();

    int getPowerMonsterWithAxe() const;
    Q_INVOKABLE void updatePowerMonsterWithAxe();

    MonsterWithAxe();

signals:
    void lifesChangedMonsterWithAxe();
    void powerChangedMonsterWithAxe();
};

#endif // MONSTERWITHAXE_H
