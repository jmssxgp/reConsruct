import QtQuick 2.0
import QtQuick.Controls 2.2
import "imagepaint.js" as Painter

Canvas{
    id: draw;
    anchors.fill: parent;

    onPaint: {
        Painter.setContext(draw.getContext("2d"), draw);
        Painter.drawGraphics();
    }


    MouseArea{
        id: mouseEvent;
        anchors.fill: parent;

        onPressed: {
            Painter.setContext(draw.getContext("2d"),draw);

            draw.requestPaint();

            Painter.canvasClick(mouseX, mouseY);
        }

        onReleased: {
            Painter.setContext(draw.getContext("2d"), draw);
            draw.requestPaint();
            Painter.stopDragging();
        }

        onPositionChanged: {
            Painter.setContext(draw.getContext("2d"), draw);
            draw.requestPaint();
            Painter.dragGraphic(mouseX, mouseY);
        }

    }

}
