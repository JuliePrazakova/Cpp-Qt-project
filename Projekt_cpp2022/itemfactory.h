#ifndef ITEMFACTORY_H
#define ITEMFACTORY_H

#include <QObject>

class ItemFactory : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString getItemImage READ getItemImage CONSTANT);
public:
    int m_bonusLife;
    int m_bonusPower;

    std::string m_name;

    explicit ItemFactory(QObject *parent = nullptr);

    ItemFactory(std::string name);

    std::string getName();

    QString getItemImage();


signals:

};

#endif // ITEMFACTORY_H
