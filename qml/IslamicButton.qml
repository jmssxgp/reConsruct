import QtQuick 2.0
import com.test.PathModel 1.0
import QtQuick.Controls 1.4

Rectangle{
    id: islamicButton;
    color: "transparent";
    property var backgroundImage: "";
    property var txt: "";
    property var cIndex: 0;

    property var l;
    property var path;
    property var n;

    Image {
        id: background;
        source: backgroundImage;
        width: 170;
        height: 165;
        anchors.top: parent.top;
    }

    Text {
        id: islamicTitle;
        text: txt;
        font.family: "simplex";
        font.pixelSize: 20;
        font.bold: true;
        color: "#ffffff";
        anchors.bottom: parent.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
    }

    PathModel{
        id:path_for_islamic;
    }

    Component.onCompleted: {
        l = path_for_islamic.getNames(path);
        n = path_for_islamic.getNum();
        console.log(n)
        timer_for_star.start();
        timer_for_rosette.start();
    }


    MouseArea{
        anchors.fill: parent;
        onClicked: {
            if(cIndex===0){

                drawPattern.sx = 70;
                drawPattern.sy = 0;
                drawPattern.sn = 8;
                drawPattern.sk = 2;
                drawPattern.flag = 0;
                drawPattern.requestPaint();
            }
            if(cIndex===1){
                drawPattern.sx = 120;
                drawPattern.sy = 40;
                drawPattern.sn = 8;
                drawPattern.sk = 1;
                drawPattern.sg = 2;
                drawPattern.flag = 1;
                drawPattern.requestPaint();
            }
            }

//            if(cIndex===0&&subWindow1.visible===false&&subWindow2.visible===false){
//                subWindow1.visible=true;
//            }
//            if(cIndex===1&&subWindow2.visible===false&&subWindow1.visible===false){
//                subWindow2.visible=true;
//            }

    }
}
