#ifndef GAME_H
#define GAME_H

#include <QObject>
#include "map.h"

class Game : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int level READ getLevel NOTIFY levelChanged)

private:
    //std::string m_mapFileName;
    int m_level;
    Map* m_map;


public:
    Game(int level);

    explicit Game(QObject *parent = nullptr);

    Q_INVOKABLE void startGame();
    Q_INVOKABLE int getLevel();

signals:
    void levelChanged();
};

#endif // GAME_H
