#include "patternprovider.h"

PatternProvider::PatternProvider(QObject *parent):QObject(parent)
{
    pen.setCapStyle(Qt::RoundCap);
    pen.setJoinStyle(Qt::RoundJoin);
    pen.setStyle(Qt::SolidLine);
    pen.setColor(Qt::black);
    pen.setWidth(2);
}

PatternProvider::~PatternProvider(){

}

void PatternProvider::aidRosette(int X, int Y, int N, int G, int K){
    globalImage.fill(Qt::white);
    double a1 = K*1.0*PI/N;
    double a2 = (PI - PI*2/N)/2;

    double cx = (Y-X*tan(a2))/(tan(a1)-tan(a2));
    double cy = (tan(a2)*(cx-X)) + Y;
    kx = cx;
    ky = cy;

    searchBorder(cx,cy,N);

    int n = 3000/width;
    int m = 2000/height;
    for(int i=0; i<m; i++){
        for(int j=0;j<n;j++){
            drawRosette(X,Y,N,G,K,(0.5+j)*width, (0.5+i)*height);
        }
    }
    //globalImage.save("F:/test/1.png");
}

void PatternProvider::aidStar(int X, int Y, int N, int K){
    globalImage.fill(Qt::white);
    double a1 = K*1.0*PI/N;
    double a2 = (PI - PI*2/N)/2;

    double cx = X*tan(a2)/(tan(a2)-tan(a1));
    double cy = cx*tan(a1);
    kx = cx;
    ky = cy;

    searchBorder(cx,cy,N);

    int n = 3000/width;
    int m = 2000/height;
    for(int i=0; i<m; i++){
        for(int j=0;j<n;j++){
            drawStar(X,Y,N,(0.5+j)*width, (0.5+i)*height);
        }
    }
    //globalImage.save("F:/test/1.png");
}

void PatternProvider::drawRosette(int X, int Y, int N, int G, int K, double w, double h){
    QPainter painter;
    painter.begin(&globalImage);
    painter.setRenderHint(QPainter::Antialiasing, true);//反走样，抗锯齿
    painter.setPen(pen);

    painter.save();
    painter.translate(w,h);

    double ax = -Y/(tan(G*PI/N));
    for(int i=0;i<N;i++){
        painter.drawLine(ax,Y,X,Y);
        painter.drawLine(X,Y,kx,ky);
        painter.drawLine(ax,-Y,X,-Y);
        painter.drawLine(X,-Y,kx,-ky);
        painter.rotate(360.0/N);
    }
    painter.restore();
    painter.end();
}

void PatternProvider::drawStar(int X, int Y, int N, double w, double h){
    QPainter painter;
    painter.begin(&globalImage);
    painter.setRenderHint(QPainter::Antialiasing, true);
    painter.setPen(pen);

    painter.save();
    painter.translate(w,h);

    for(int i=0; i<N; i++){
        painter.drawLine(X,Y,kx,ky);
        painter.drawLine(X,Y,kx,-ky);
        painter.rotate(360.0/N);
    }
    painter.restore();
    painter.end();
}

void PatternProvider::clear(){
    globalImage.fill(Qt::white);
}

void PatternProvider::searchBorder(double x, double y, int N){
    double xmax = x, xmin = x, ymax = y, ymin =y;
    for(int i=0; i<N;i++){
        double ax = x*cos(-2.0*PI/N)-y*sin(2.0*PI/N);
        double ay = x*sin(2.0*PI/N)+y*cos(2.0*PI/N);
        x=ax;
        y=ay;
        if(x>xmax) xmax=x;
        if(x<xmin) xmin=x;
        if(y>ymax) ymax=y;
        if(y<ymin) ymin=y;
    }
    width = xmax-xmin;
    height = ymax-ymin;
}

void PatternProvider::save(QString path){
    globalImage.save(path);
}
