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
#include <QDir>
#include <math.h>
#include <cstdlib>
#include <externalvar.h>

#define PI 3.1415926

class PatternProvider:public QObject
{
    Q_OBJECT
public:
    PatternProvider(QObject *parent=0);
    ~PatternProvider();
public:
    void drawStar(double X,double Y, double N, double w, double h);
    void drawRosette(double X,double Y, double N, double G, double K, double w, double h);
    Q_INVOKABLE void aidStar(double X, double Y, double N, double K);
    Q_INVOKABLE void aidRosette(double X, double Y, double N, double G, double K);
    void searchBorder(double x, double y, double N);
    Q_INVOKABLE void clear();
    Q_INVOKABLE void save(QString path);
    Q_INVOKABLE void patternEmbedding(double X, double Y, double G, double N);
    QStringList path(double r);
private:
    double width;
    double height;
    double kx;
    double ky;
    QPen pen;
    int flag;
};

#endif // PATTERNPROVIDER_H
