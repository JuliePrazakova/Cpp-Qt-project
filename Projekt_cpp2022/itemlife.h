#ifndef ITEMLIFE_H
#define ITEMLIFE_H


#include "itemfactory.h"

class ItemLife : public ItemFactory
{
    Q_OBJECT
public:
    int m_life;

    ItemLife();
    ItemLife(std::string name, int life);

    int getLife();


};

#endif // ITEMLIFE_H
