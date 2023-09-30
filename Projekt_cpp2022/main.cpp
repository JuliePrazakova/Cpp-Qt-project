#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "game.h"
#include"hero.h"
#include"map.h"

//#include "monster.h"
//#include"itemlife.h"
//#include"itempower.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext(); //vytvoreni QQML context, to se nastavi v enginu

    Game* generator = new Game();
    context->setContextProperty("generator", generator);

    Hero* hero = new Hero();
    context->setContextProperty("hero",hero); // diky vytvorenemu contextu muzeme pridavat instance trid do qt tak aby to QML naslo
    // vytvareni Hrdiny je zbytecne protoze Game instanci hrdiny vytvori ale pisu to sem abyste pochopili princip..
    // "hero" -> takhle se to bude jmenovat v QML pri volani metod v onClicked, hero -> jmeno instance vytvorene tady v mainu
    // diky tomu se propoji frontend s beckendem a frontend zna metody co jsou v beckendu

    //delani "generatoru" pro tridu mapa
    Map* map = new Map();
    context->setContextProperty("map",map);

    map->generate();

    ItemFactory* itemfactory = new ItemFactory();
    context->setContextProperty("itemfactory", itemfactory);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
