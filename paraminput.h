#ifndef PARAMINPUT_H
#define PARAMINPUT_H

#include <QObject>

class ParamInput:public QObject
{
    Q_OBJECT
    Q_PROPERTY(double x READ x)
    Q_PROPERTY(double y READ y)
    Q_PROPERTY(double n READ n)
    Q_PROPERTY(double g READ g)
    Q_PROPERTY(double k READ k)
    Q_PROPERTY(double flag READ flag)
public:
    ParamInput();
    ~ParamInput();

    Q_INVOKABLE void set(int _n, int _g,int _k, int _x, int _y, int _flag);

public:
    double n;
    double g;
    double k;
    double x;
    double y;
    double flag;
};

#endif // PARAMINPUT_H
