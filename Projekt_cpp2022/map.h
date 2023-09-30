#ifndef MAP_H
#define MAP_H

#include <QObject>
#include "field.h"
#include <QVector>
#include <QString>
#include <QList>
#include <QVariant>
#include "hero.h"
#include "key.h"

class Map : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant fields READ getFields CONSTANT)


private:
    //  int m_mapSize; <- neni potreba, na zaklade levelu bude vzdy pevne dany rozmer mapy
    int m_level;
    QList <Field*> m_fields;
    // QString m_fileName; zatim neni potreba

    Hero* m_hero;


public:
    explicit Map(QObject *parent = nullptr);
    //void loadMapFromFile(std::string m_fileName);

    Map(Hero* hero);

    void generate();

    Q_INVOKABLE void revealField(const int index); // used to call CPP method from QML (and possibly return some data)
    QVariant getFields() const;





signals:

};

#endif // MAP_H
