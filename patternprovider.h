#ifndef PATTERNPROVIDER_H
#define PATTERNPROVIDER_H

#include <QQuickPaintedItem>
#include <QPainterPath>
#include <QPainter>
#include <QPointF>
#include <QImage>
#include <QPen>
#include <QBrush>
#include <QColor>
#include <QDebug>
#include <QString>
#include <math.h>
#include <externalvar.h>
#define PI 3.1415926

class PatternProvider:public QObject
{
    Q_OBJECT
public:
    PatternProvider(QObject *parent=0);
    ~PatternProvider();
public:
    void drawStar(int X,int Y, int N, double w, double h);
    void drawRosette(int X,int Y, int N, int G, int K, double w, double h);
    Q_INVOKABLE void aidStar(int X, int Y, int N, int K);
    Q_INVOKABLE void aidRosette(int X, int Y, int N, int G, int K);
    void searchBorder(double x, double y, int N);
    Q_INVOKABLE void clear();
    Q_INVOKABLE void save(QString path);
private:
    int width;
    int height;
    int kx;
    int ky;
    QPen pen;
};

#endif // PATTERNPROVIDER_H
