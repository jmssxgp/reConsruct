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

QStringList PatternProvider::path(double r){
    QString dir = "F:/master/4.QT/reConsruct/patternEmbedd";
    QStringList filters;
    QDir qdir;
    QFileInfoList list;
    QStringList res;
    filters<<"*.jpg"<<"*.png";
    qdir.setNameFilters(filters);
    qdir.setFilter(QDir::Files|QDir::Hidden|QDir::NoSymLinks);
    qdir.setPath(dir);

    list = qdir.entryInfoList();
    int num = list.size();
    for(int i=0; i<num;i++){
        QFileInfo fileInfo = list.at(i);
        QImage img(fileInfo.filePath());
        if(img.width()<2*r&&img.height()<2*r-3&&img.width()+80>2*r){
            res.append(fileInfo.filePath());
        }
    }
    qDebug()<<res.size();
    return res;
}


void PatternProvider::patternEmbedding(double X, double Y, double G, double N){
    double r= 0;
    if(flag == 1){
        double ax = -Y/(tan(G*PI/N));
        double ay = Y;
        r = sqrt(ax*ax+ay*ay);
    }else{
        r = sqrt(X*X+Y*Y);
    }

    QStringList res = path(r);
    if(res.size()==0)return;
    int index = rand()%(res.size());
    QString image_name = res[index];
    QImage img(image_name);
    QPainter painter;
    painter.begin(&globalImage);
    painter.setRenderHint(QPainter::Antialiasing, true);//反走样，抗锯齿
    int n = 3000/width;
    int m = 2000/height;
    for(int i=0; i<=m; i++){
        for(int j=0;j<=n;j++){
            painter.drawImage((0.5+j)*width-img.width()/2,(0.5+i)*height-img.height()/2,
                              img,0,0,img.width(),img.height(),Qt::AutoColor);
        }
    }
}

void PatternProvider::aidRosette(double X, double Y, double N, double G, double K){
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
    for(int i=0; i<=m; i++){
        for(int j=0;j<=n;j++){
            drawRosette(X,Y,N,G,K,(0.5+j)*width, (0.5+i)*height);
        }
    }
    flag = 1;
    //globalImage.save("F:/test/1.png");
}

void PatternProvider::aidStar(double X, double Y, double N, double K){
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
    for(int i=0; i<=m; i++){
        for(int j=0;j<=n;j++){
            drawStar(X,Y,N,(0.5+j)*width, (0.5+i)*height);
        }
    }
    //globalImage.save("F:/test/1.png");
    flag = 2;
}

void PatternProvider::drawRosette(double X, double Y, double N, double G, double K, double w, double h){
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

void PatternProvider::drawStar(double X, double Y, double N, double w, double h){
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

void PatternProvider::searchBorder(double x, double y, double N){
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
