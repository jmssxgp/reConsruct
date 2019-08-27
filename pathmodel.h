#ifndef PATHMODEL_H
#define PATHMODEL_H


#include <QString>
#include <QDir>
#include <QObject>

class PathModel: public QObject
{
    Q_OBJECT

public:
    explicit PathModel(QObject *parent = 0);
    ~PathModel();
    Q_INVOKABLE int getNum();
    Q_INVOKABLE QStringList getNames(QString dirpath);
    Q_INVOKABLE QStringList getWithoutPath();

public:
    int n;
    QStringList r;
};

#endif // PATHMODEL_H
