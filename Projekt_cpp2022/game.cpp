#include "game.h"

Game::Game(QObject *parent)
    : QObject{parent}
{

}

Game::Game(int level): QObject() {
    m_level = level;
}
int Game::getLevel(){
    return m_level;
}
void Game::startGame(){
    m_level++;
    emit levelChanged();
}


