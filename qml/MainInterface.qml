import QtQuick 2.0
import QtQuick.Window 2.0
import com.test.PathModel 1.0
import "drawPattern.js" as Pattern

Rectangle{
    id: vMain;
    color: "transparent";
    /**顶栏*************************************************************************
      */

    property var islamic_star_image_name: "";
    property var islamic_rosette_image_name: "";

    Rectangle{
        id: topHurdle;
        color: "transparent";
        width: parent.width;
        height: 86;
        anchors.top: parent.top;

        Image {
            id: topBaskground;
            source: "image/topHurdle.png";
            anchors.fill: parent;
        }

        Text {
            id: title1
            text: qsTr("交互几何纹样重构")
            anchors.centerIn: parent;
            anchors.topMargin: 18;


            font.family: "simplex";
            font.pixelSize: 30;
            color: "#ffffff";
            font.bold: true;
        }


        Row{
            id: titleButtonRow;

            anchors.right: parent.right;
            anchors.rightMargin: 41;
            anchors.top: parent.top;
            anchors.topMargin: 26;
            height: 30;

            spacing: 71;

            Button{
                id: min;
                width: 30;
                height: 3;
                anchors.verticalCenter: parent.verticalCenter;
                backgroundImag: "image/pattern1/最小化-未选中.png"
                sHoverImage: "image/pattern1/最小化.png"
                state: "normal";
                nIndex: 10;
            }
            Button{
                id: max;
                width: 30;
                height: 30;
                backgroundImag: "image/pattern1/放大-半屏-未选中.png"
                sHoverImage: "image/pattern1/放大-半屏.png";
                state: "normal";
                nIndex: 1;
            }
            Button{
                id: exit;
                width: 24;
                height: 24;
                backgroundImag: "image/pattern1/关闭-未选中-1.png"
                sHoverImage: "image/pattern1/关闭-1.png"
                state: "normal";
                nIndex: 2;
            }
        }

        MouseArea
        {
            anchors.right: parent.right;
            anchors.rightMargin: 400;

            height: parent.height;
            width: parent.width - 400;


            acceptedButtons: Qt.LeftButton //只处理鼠标左键
            property point clickPos: "0,0"
            onPressed:
            {
                //接收鼠标按下事件
                clickPos  = Qt.point(mouse.x,mouse.y)
            }
            onPositionChanged:
            {
                //鼠标按下后改变位置
                //鼠标偏移量
                var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

                //如果mainwindow继承自QWidget,用setPos
                main_W.setX(main_W.x+delta.x)
                main_W.setY(main_W.y+delta.y)
            }

            onDoubleClicked:
            {
                main_W.visibility === Window.Windowed ?
                main_W.visibility = Window.Maximized :main_W.visibility = Window.Windowed;
            }


       }
    }

    /** 底*************************************************************************
      */
    Rectangle{
        width: parent.width;
        height: 932;
        anchors.top: parent.top;
        anchors.topMargin: 148;

        Image {
            id: vMainBack;
            source: "image/pattern1/底.png";
            anchors.fill: parent;
        }
        Image {
            id: vMainBack2;
            source: "image/pattern1/矩形 482.png";
            width: 1810;
            height: 807;
            anchors.top: parent.top;
            anchors.topMargin: 16;
            anchors.left: parent.left;
            anchors.leftMargin: 83;
        }
    }


/**
  模式切换******************************************************************
  */
    Rectangle{
        id: vPattern;
        color: "black";
        width: 80;
        height: 807;
        anchors.left: parent.left;
        anchors.leftMargin: 21;
        anchors.top: parent.top;
        anchors.topMargin: 164;

        Column{
            id: vPatternButton;
            width: parent.width;
            height: parent.height;
            spacing: 0;
            anchors.top: parent.top;

            Button{
                id: pattern1;

                width: parent.width;
                height: 200;
                nIndex: 3;
                backgroundImag: "image/pattern1/模式1.png";
                sHoverImage: "image/pattern1/模式1.png";
                txt: "几\n何\n重\n构";
                state: "normal";
                onSelcect: {
                    main_W.selectInterface(0);
                }
            }

            Button{
                id: pattern2;

                width: parent.width;
                height: 200;
                nIndex: 4;
                backgroundImag: "image/pattern1/模式2.png";
                sHoverImage: "image/pattern2/模式2.png";
                txt: "语\n义\n重\n构";
                state: "normal";
                onSelcect: {
                    main_W.selectInterface(1);
                    Pattern.setContext(drawPattern.getContext("2d"), drawPattern);

                    Pattern.clearCanvas();
                    drawPattern.flag=3;
                    drawPattern.requestPaint();
                }
            }
        }

        Image {
            id: vPatternelse;
            source: "image/pattern1/其他模式.png";
            anchors.top: parent.top;
            anchors.topMargin: 397;
        }
    }

/**
  选择具体类型********************************************************************
  */
    Rectangle{
        id: vGraphic;
        color: "transparent";
        width: 170;
        height: 400;
        anchors.left: parent.left;
        anchors.leftMargin: 162;
        anchors.top: parent.top;
        anchors.topMargin: 236;

        Column{
            id: vGraphicButton;
            width: parent.width;
            height: parent.height;
            spacing: 40;
            anchors.top: parent.top;

            IslamicButton{
                id: graphic1;

                width: parent.width;
                height: 190;
                backgroundImage: islamic_star_image_name;
                txt:"islamic star";
                path: "F:/master/新建文件夹 (2)";
                cIndex: 0;

            }

            IslamicButton{
                id: graphic2;

                width: parent.width;
                height: 190;
                backgroundImage: islamic_rosette_image_name;
                txt:"islamic rosette";
                path:"F:/master/新建文件夹 (2)";
                cIndex: 1;
            }
        }
    }

    /*****************************定时器刷新展示图片****************************/

    Timer{
        id:timer_for_star;
        property var count: 0;
        interval: 1000;
        repeat: true;
        triggeredOnStart: true;

        onTriggered: {
            if(count<graphic1.n){
                islamic_star_image_name="file:///"+graphic1.l[count];
                count++;
            }else{
                count=0;
            }
        }
    }
    Timer{
        id:timer_for_rosette;
        property var count: 0;
        interval: 1000;
        repeat: true;
        triggeredOnStart: true;

        onTriggered: {
            if(count<graphic2.n){
                islamic_rosette_image_name="file:///"+graphic2.l[count];
                count++;
            }else{
                count=0;
            }
        }
    }

    /**生成结果显示**********************************************************************/
    Rectangle{
        id: imageShow;
        //color: "transparent";

        width: 977;
        height: 565;
        anchors.left: parent.left;
        anchors.leftMargin: 474;
        anchors.top: parent.top;
        anchors.topMargin: 236;
        clip: true;
        Canvas{
            id: drawPattern;
            width: 3000;
            height: 2000;
            scale: 1;
            x:-1011.5;
            y:-717.5;
            property var sx;
            property var sy;
            property var sn;
            property var sg;
            property var sk;
            property var flag; //判断传进来的参数用来绘制什么。
            onPaint: {
                if(flag === 0){
                    Pattern.setContext(drawPattern.getContext("2d"), drawPattern);
                    Pattern.aidStar(sx,sy,sn,sk);
                }else if(flag===1){
                    Pattern.setContext(drawPattern.getContext("2d"), drawPattern);
                    Pattern.aidRosette(sx,-sy,sn,sg,sk);

                }
            }

        }
        MouseArea{
            anchors.fill: parent;
            acceptedButtons: Qt.MidButton;
            onWheel: {
                var scale = (wheel.angleDelta.y/120)*0.05;
                //console.log(scale)
                if(drawPattern.scale + scale>0.5&&drawPattern.scale + scale<1.5)
                    drawPattern.scale += scale;
                console.log(drawPattern.scale)
            }
        }
    }

    Rectangle{
        id: reButton;
        color: "transparent";
        width: 140;
        height: 400;
        anchors.left: parent.left;
        anchors.leftMargin: 1752;
        anchors.top: parent.top;
        anchors.topMargin: 228;

        Column{
            id: reButtonc;
            width: parent.width;
            height: parent.height;
            spacing: 0;
            anchors.top: parent.top;

            ReButton{
                id: reButton1;
                width: 140;
                height: 98;
                backgroundImag: "image/pattern1/重构按钮1.png";
                txt: "自定义Star";
                nIndex: 5;
                state: "normal";
            }
            ReButton{
                id: reButton2;
                width: 140;
                height: 98;
                backgroundImag: "image/pattern1/重构按钮2.png";
                txt: "自定义Rosette";
                nIndex: 6;
                state: "normal";
            }
            ReButton{
                id: reButton3;
                width: 140;
                height: 98;
                backgroundImag: "image/pattern1/重构按钮3.png";
                txt: "图案嵌入";
                nIndex: -1;
                state:"normal";
            }
        }
    }

    /**
      工具按钮****************************************************************************
      */
    Rectangle{
        id: toolbutton;
        color: "transparent";
        width: 319;
        height: 37;
        anchors.left: parent.left;
        anchors.leftMargin: 803;
        anchors.top: parent.top;
        anchors.topMargin: 852;

        Row{
            id:toolbuttonr;
            width: parent.width;
            height: parent.height;
            anchors.left: parent.left;

            spacing: 37;

            ToolButton{
                id:tool1;
                width: 33;
                height: 37;
                backgroundImage: "image/pattern1/保存-未选中.png";
                pressedImage: "image/pattern1/保存-点击.png";
                hoverImage: "image/pattern1/保存-点击.png";
                state: "normal";
                nIndex: -1;
            }
            ToolButton{
                id:tool2;
                width: 36;
                height: 36;
                backgroundImage: "image/pattern1/放大-未选中.png";
                pressedImage: "image/pattern1/放大-点击.png";
                hoverImage: "image/pattern1/放大-点击.png";
                state: "normal";
                nIndex: -2;
            }
            ToolButton{
                id:tool3;
                width: 36;
                height: 36;
                backgroundImage: "image/pattern1/缩小-未选中.png";
                pressedImage: "image/pattern1/缩小-点击.png"
                hoverImage: "image/pattern1/缩小-点击.png";
                state: "normal";
                nIndex: -3
            }
            ToolButton{
                id:tool4;
                width: 36;
                height: 36;
                backgroundImage: "image/pattern1/重置-未选中.png";
                pressedImage: "image/pattern1/重置-点击.png";
                hoverImage: "image/pattern1/重置-点击.png";
                state: "normal";
                nIndex: -4;
                onBack: {
                    drawPattern.scale = 1;
                }
            }
            ToolButton{
                id:tool5;
                width: 30;
                height: 30;
                anchors.verticalCenter: parent.verticalCenter;
                backgroundImage: "image/pattern1/关闭-未选中.png";
                pressedImage: "image/pattern1/关闭-点击.png";
                hoverImage: "image/pattern1/关闭-点击.png";
                state: "normal";
                nIndex: 4;
                onBack: {
                    console.log("777777777777")
                    Pattern.setContext(drawPattern.getContext("2d"), drawPattern);

                    Pattern.clearCanvas();
                    drawPattern.flag=3;
                    drawPattern.requestPaint();
                }
            }
        }
    }

    /*********************状态栏******************************************/
    StatusBar{
        width: 1869;
        height: 50;
        anchors.left: parent.left;
        anchors.leftMargin: 21;
        anchors.top: parent.top;
        anchors.topMargin: 990;

        txt:"就绪";
        backgroundImg: "image/pattern1/状态栏.png";
    }

    /**
      菜单栏****************************************************************************
      */
        Rectangle{
            id: menubar;
            color: "#000000"             //"#d6d6d7";
            width: parent.width;
            height: 62;
            anchors.top: parent.top;
            anchors.topMargin: 86;

            Row{
                id: menubarButton;

                width: parent.width;
                height: parent.height;

                spacing: 1;
                anchors.left: parent.left;
                anchors.top: parent.top;

                BarButton{
                    id: file;

                    width: 350;
                    height: parent.height;
                    backgroundImage: "image/pattern1/1文件栏.png";
                    foregroundImageLeft: "image/pattern1/矩形 474.png";
                    foregroundImageRight: "image/pattern1/文件-1.png"
                    txt: "文件";
                    nIndex: 0;
                    distance: 135;
                }

                BarButton{
                    id: help;

                    width: 350;
                    height: parent.height;
                    backgroundImage: "image/pattern1/2帮助栏.png";
                    foregroundImageLeft: "image/pattern1/矩形 475.png";
                    foregroundImageRight: "image/pattern1/帮助-1.png"
                    txt: "帮助";
                    nIndex: 1;
                    distance: 135;
                }

            }

            Rectangle
            {
                id: rect_MenuFile;
                visible: false;
                anchors.left: parent.left;
                anchors.top: parent.top;
                anchors.topMargin: 62;
                width: 350;
                height: 62 * 2 ;
                color: "transparent";
                Column
                {
                    id: colum_File;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.top: parent.top;

                    BarButton
                    {
                        width: 350;
                        height: 62;
                        size: 20;
                        txt: "打开文件";
                        backgroundImage:"image/barmenu/帮助使用说明2.png";
                        foregroundImageLeft: "image/pattern1/矩形 475.png";
                        foregroundImageRight: "image/barmenu/打开图片-2.png";
                        state: "normal";
                        nIndex: 2;
                        distance: 90;
                    }
                    BarButton
                    {
                        width: 350;
                        height: 62;
                        size: 20;
                        txt: "退出程序";
                        backgroundImage:"image/barmenu/帮助使用说明2.png";
                        foregroundImageLeft: "image/pattern1/矩形 475.png";
                        foregroundImageRight: "image/barmenu/退出程序-2.png"
                        state: "normal";
                        nIndex: 3;
                        distance: 90;
                    }
                }
            }

            Rectangle
            {
                id: rect_MenuEdit;
                visible: false;
                anchors.left: parent.left;
                anchors.leftMargin: 350;
                anchors.top: parent.top;
                anchors.topMargin: 62;
                x:help.x;
                y:help.y+62;
                width: 350;
                height: 62 * 2 ;
                color: "transparent";

                Column
                {
                    id: colum_Help;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.top: parent.top;

                    BarButton
                    {
                        width: 350;
                        height: 62;
                        size: 20;
                        txt: "使用说明";
                        backgroundImage:"image/barmenu/帮助使用说明2.png";
                        foregroundImageLeft: "image/pattern1/矩形 475.png";
                        foregroundImageRight: "image/barmenu/使用说明-1.png"
                        state: "normal";
                        nIndex: 4;
                        distance: 90;
                    }
                    BarButton
                    {
                        width: 350;
                        height: 62;
                        size: 20;
                        txt: "关于我们";
                        backgroundImage:"image/barmenu/帮助使用说明2.png";
                        foregroundImageLeft: "image/pattern1/矩形 475.png";
                        foregroundImageRight: "image/barmenu/关于我们-2.png"
                        state: "normal";
                        nIndex: 5;
                        distance: 90;
                    }
                }
            }

            Image {
                id: velse
                source: "image/pattern1/3其他栏.png";
                anchors.left: parent.left;
                anchors.leftMargin: 702;
                anchors.top: parent.top;
            }
        }
        MouseArea
          {
              id:menuAllMouseArea;
              visible: false;
              z:-1;


              width: main_W.width;
              height: main_W.height;

              onClicked:
              {
                  console.log("visible");
                  rect_MenuFile.visible = false;
                  rect_MenuEdit.visible = false;
                  menuAllMouseArea.visible = false;
                  console.log("set success");
              }
          }

        /***子窗口**************************************************************/
    Rectangle{
        id: subWindow1;
        visible: false;
        width: 690;
        height: 370;
        x:615;
        y:355;
        SubWin1{
            visible: true;
            anchors.fill: parent;

            onTran: {
                drawPattern.sx = sX;
                drawPattern.flag = 0;
                drawPattern.sy = sY;
                drawPattern.sn = sN;
                drawPattern.sk = sK;
                drawPattern.requestPaint();
            }
        }

    }

    Rectangle{
        id: subWindow2;
        visible: false;
        width: 690;
        height: 370;
        x:615;
        y:355;
        SubWin2{
            visible: true;
            anchors.fill: parent;

            onTran: {
                drawPattern.sx = sX;
                drawPattern.flag = 1;
                drawPattern.sy = sY;
                drawPattern.sn = sN;
                drawPattern.sk = sK;
                drawPattern.sg = sG;
                drawPattern.requestPaint();
            }
        }
    }


    function timer_util(bool){
        if(bool){

            timer_for_rosette.start();
            timer_for_star.start();
        }else{
            timer_for_rosette.stop();
            timer_for_star.stop();
        }

    }
}













