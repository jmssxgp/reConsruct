#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "pathmodel.h"
#include "colorimageprovider.cpp"
#include "patternprovider.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<PatternProvider>("com.test.PatternProvider",1,0,"PatternProvider");
    qmlRegisterType<PathModel>("com.test.PathModel", 1,0,"PathModel");

    QQmlApplicationEngine engine;
    engine.addImageProvider(QLatin1String("islamic"), new ColorImageProvider);
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
    //return 0;
}
