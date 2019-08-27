#include "pathmodel.h"
PathModel::PathModel(QObject *parent):QObject(parent){

}

PathModel::~PathModel(){

}
int PathModel::getNum(){
    return n;
}
QStringList PathModel::getWithoutPath(){
    return r;
}
QStringList PathModel::getNames(QString dir){
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
    n = num;
    for(int i=0; i<num;i++){
        QFileInfo fileInfo = list.at(i);
        res.append(fileInfo.filePath());
    }
    r = res;
    return res;
}
