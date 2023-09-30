#ifndef ITEMPOWER_H
#define ITEMPOWER_H

#include "itemfactory.h"

class ItemPower : public ItemFactory
{
    Q_OBJECT

public:
    int m_power;

    ItemPower();
    ItemPower(std::string name, int power);

    int getPower();


};


#endif // ITEMPOWER_H
