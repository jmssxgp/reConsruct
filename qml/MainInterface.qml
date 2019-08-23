import QtQuick 2.0
import QtQuick.Window 2.0
Rectangle{
    id: vMain;
    color: "transparent";
    /**顶栏*************************************************************************
      */
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
            text: qsTr("交互几何重构")
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
                nIndex: 0;
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
            anchors.rightMargin: 120;

            height: parent.height;
            width: parent.width - 120;


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
            }

            BarButton{
                id: help;

                width: 350;
                height: parent.height;
                backgroundImage: "image/pattern1/2帮助栏.png";
                foregroundImageLeft: "image/pattern1/矩形 475.png";
                foregroundImageRight: "image/pattern1/帮助-1.png"
                txt: "帮助";
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
                sHoverImage: "image/pattern2/模式2.png"
                txt: "语\n义\n重\n构";
                state: "normal";
                onSelcect: {
                    main_W.selectInterface(1);
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
                backgroundImage: "image/pattern1/Islanmic star.png";
                txt:"islamic star";
                cIndex: 0;

            }

            IslamicButton{
                id: graphic2;

                width: parent.width;
                height: 190;
                backgroundImage: "image/pattern1/Islanmic rosette-1.png";
                txt:"islamic rosette";
                cIndex: 1;
            }
        }
    }
    /**生成结果显示**********************************************************************/
    Rectangle{
        id: imageShow;
        color: "transparent";

        width: 976;
        height: 565;
        anchors.left: parent.left;
        anchors.leftMargin: 474;
        anchors.top: parent.top;
        anchors.topMargin: 236;

        Image {
            id: imageGenerate;
            source: "image/pattern1/Islanmic rosette.png";   //应设置为变量
            anchors.fill: parent;
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

            Button{
                id: reButton1;
                width: 140;
                height: 98;
                backgroundImag: "image/pattern1/重构按钮1.png";
                txt: "重构按钮1";
                nIndex: -1;
            }
            Button{
                id: reButton2;
                width: 140;
                height: 98;
                backgroundImag: "image/pattern1/重构按钮2.png";
                txt: "重构按钮2";
                nIndex: -1;
            }
            Button{
                id: reButton3;
                width: 140;
                height: 98;
                backgroundImag: "image/pattern1/重构按钮3.png";
                txt: "重构按钮3";
                nIndex: -1;
            }
            Button{
                id: reButton4;
                width: 140;
                height: 98;
                backgroundImag: "image/pattern1/重构按钮4.png";
                txt: "重构按钮4";
                nIndex: -1;
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
            }
            ToolButton{
                id:tool2;
                width: 36;
                height: 36;
                backgroundImage: "image/pattern1/放大-未选中.png";
                pressedImage: "image/pattern1/放大-点击.png";
                hoverImage: "image/pattern1/放大-点击.png";
                state: "normal";
            }
            ToolButton{
                id:tool3;
                width: 36;
                height: 36;
                backgroundImage: "image/pattern1/缩小-未选中.png";
                pressedImage: "image/pattern1/缩小-点击.png"
                hoverImage: "image/pattern1/缩小-点击.png";
                state: "normal";
            }
            ToolButton{
                id:tool4;
                width: 36;
                height: 36;
                backgroundImage: "image/pattern1/重置-未选中.png";
                pressedImage: "image/pattern1/重置-点击.png";
                hoverImage: "image/pattern1/重置-点击.png";
                state: "normal";
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

}
