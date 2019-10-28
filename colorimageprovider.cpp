#include <qquickimageprovider.h>
#include <QImage>
#include <QPainter>
#include "externalvar.h"

class ColorImageProvider: public QQuickImageProvider
{
public:
    ColorImageProvider():QQuickImageProvider(QQuickImageProvider::Pixmap){

    }

    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)override
    {
        int width = 100;
        int height = 100;

        if(size){
            *size = QSize(width, height);
        }

        QPixmap pixmap(requestedSize.width()>0?requestedSize.width():width,
                       requestedSize.height()>0?requestedSize.height():height);


        pixmap = QPixmap::fromImage(globalImage);
        return pixmap;
    }
};


