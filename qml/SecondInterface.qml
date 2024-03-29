import QtQuick 2.0
import com.test.PathModel 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "imagepaint.js" as Painter

Rectangle{
    id: vSecondInterface;
    color: "transparent";
    property int n;
    property var l;
    property string s: ""
    property color canvascolor: "white";
    property var colorDlg;
    property var toolmansimage: ""

    Rectangle{
        id: topHurdle2;
        color: "transparent";
        width: parent.width;
        height: 86;
        anchors.top: parent.top;

        Image {
            id: topBaskground2;
            source: "image/topHurdle.png";
            anchors.fill: parent;
        }

        Text {
            id: title2
            text: qsTr("几何纹样风格化重构软件")
            anchors.centerIn: parent;
            anchors.topMargin: 18;


            font.family: "simplex";
            font.pixelSize: 30;
            color: "#ffffff";
            font.bold: true;
        }

        Row{
            id: titleButtonRow2;

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

            onClicked: {
                rect_MenuFile.visible = false;
                rect_MenuEdit.visible = false;
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
            id: v2MainBack;
            source: "image/pattern1/底.png";
            anchors.fill: parent;
        }
    }


/**
  模式切换******************************************************************
  */
    Rectangle{
        id: vPattern2;
        color: "black";
        width: 80;
        height: 807;
        anchors.left: parent.left;
        anchors.leftMargin: 21;
        anchors.top: parent.top;
        anchors.topMargin: 164;

        Column{
            id: vPatternButton2;
            width: parent.width;
            height: parent.height;
            spacing: 0;
            anchors.top: parent.top;

            Button{
                id: pattern1;

                width: parent.width;
                height: 200;
                nIndex: 3;
                backgroundImag: "image/pattern2/模式1.png";
                sHoverImage: "image/pattern1/模式1.png"
                txt: "几\n何\n重\n构";
                state: "normal";

                onSelcect: {
                    main_W.selectInterface(0);
                    model01.clear();
                    Painter.setContext(draw.getContext("2d"), draw);
                    draw.requestPaint();
                    Painter.clearCanvas();
                }
            }

            Button{
                id: pattern2;

                width: parent.width;
                height: 200;
                nIndex: 4;
                backgroundImag: "image/pattern2/模式2.png";
                sHoverImage: "image/pattern2/模式2.png";
                txt: "语\n义\n重\n构";

                state: "normal";
                onSelcect: {
                    main_W.selectInterface(1);
                }
            }
        }

        Image {
            id: vPatternelse2;
            source: "image/pattern1/其他模式.png";
            anchors.top: parent.top;
            anchors.topMargin: 397;
        }
    }

    /**中间内容*******************************************************************/
    Rectangle{
        id:secondInterface;
        visible: true;
        width: 1792;
        height: 807;
        anchors.left: parent.left;
        anchors.leftMargin: 99;
        anchors.top: parent.top;
        anchors.topMargin: 164;

        /***************第一个框***************/
        Rectangle{
            id: rec1;
            anchors.left: parent.left;
            anchors.top: parent.top;

            width: 435;
            height: 239;

            Image {
                id: bgImage1;
                anchors.fill: parent;
                source: "image/pattern2/背景.png";
            }
            Rectangle {
                id: bgcolor1;
                color: "transparent";
                anchors.top: parent.top;
                anchors.topMargin: 39;
                anchors.left: parent.left;
                anchors.leftMargin: 33;
                border.color: "#ffffff";
                width: 152;
                height: 66;

                Text {
                    id: text1;
                    font.family: "simplex";
                    font.pixelSize: 30;
                    color: "#ffffff";
                    anchors.centerIn: parent;
                    text: qsTr("背景颜色");
                }
                MouseArea{
                    anchors.fill: parent;
                    acceptedButtons: Qt.LeftButton;
                    onClicked: {
                        console.log(canvascolor);
                        vSecondInterface.selectColor(vSecondInterface.onCanvasColor);
                    }
                }
            }
            Rectangle {
                id: bgcolor2;
                color: "transparent";
                anchors.top: parent.top;
                anchors.topMargin: 128;
                anchors.left: parent.left;
                anchors.leftMargin: 33;
                border.color: "#ffffff";
                width: 152;
                height: 66;

                Text {
                    id: text2;
                    font.family: "simplex";
                    font.pixelSize: 30;
                    color: "#ffffff";
                    anchors.centerIn: parent;
                    text: qsTr("背景图片");
                }
                MouseArea{
                    anchors.fill: parent;
                    acceptedButtons: Qt.LeftButton;

                    onClicked: {
                        backimage.open();
                    }
                }

                FileDialog{
                    id: backimage;
                    selectExisting: true;
                    folder: shortcuts.desktop
                    nameFilters: ["图片文件(*.jpg)"];
                    onAccepted: {
                        console.log(fileUrl);
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.back(fileUrl);
                        Painter.drawGraphics();

                    }
                }
            }
        }







    /********************第二个框**************/
        Rectangle{
            id:rec2;
            anchors.left: parent.left;
            anchors.top: parent.top;
            anchors.topMargin: 238;
            color: "transparent"
            width: 435;
            height: 570;
            Image {
                id: viewBack01;
                source: "image/pattern2/纹理树.png";
                anchors.fill: parent;
            }
            //模型
            ListModel{
                id: model;
                ListElement{ima: "image/pattern2/纹理树.png"}
            }
            //视图
            ListView{
                id: view;
                clip: true;
                anchors.fill: parent;
                anchors.rightMargin: 33;
                model: model;
                spacing: 0
                delegate: Rectangle{
                    width: 435;
                    height: 1000;
                    color: "transparent";
                    PatternTreeView{
                        id: patterntreeview;
                        anchors.top: parent.top;
                        anchors.topMargin: 60;
                        anchors.left: parent.left;
                        anchors.leftMargin: 160;
                    }
                }
            }
            //代理******************************************************************************************************
//            Component{
//                id: delegate;

//            }
            //**********************************************************************************************************

            //滑动条
            Sliderbar{
                id:slider;
                visible: true;
                anchors.right: parent.right;
                anchors.top: parent.top;
                list: view;
                width: 33;
                height: 570;
                imageslider:"image/pattern2/拖动条1.png"
                imageback:"image/pattern2/拖动1.png"
            }

            Text {
                id: text3;
                anchors.left: parent.left;
                anchors.leftMargin: 43;
                anchors.top: parent.top;
                anchors.topMargin: 21;
                font.pixelSize: 30;
                color: "#ffffff";
                font.family: "simplex";
                text: qsTr("纹理树");
            }
         }






    /***************第三个框***************/
        Rectangle{
            id: rec3;
            anchors.left: parent.left;
            anchors.leftMargin: 434;
            anchors.top: parent.top;

            width: 1060;
            height: 808;

            Image {
                id: bgImage3;
                anchors.fill: parent;
                source: "image/pattern2/矩形 489.png";
            }
        }

        Image{
            id: toolman;
            source: toolmansimage;
            visible: false;
        }




     /***********************画布**************************************/
        Rectangle{
            id: imageShow;
            //color: "transparent";

            width: 615;
            height: 565;
            anchors.left: parent.left;
            anchors.leftMargin: 658;
            anchors.top: parent.top;
            anchors.topMargin: 72;


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

        }








    /**********************操作按钮******************/
        Rectangle{
            id: operater;
            color: "transparent";
            width:328;
            height: 37;
            anchors.top: parent.top;
            anchors.topMargin: 688;
            anchors.left: parent.left;
            anchors.leftMargin: 618;


            Row{
                anchors.top: parent.top;
                anchors.left: parent.left;
                width: parent.width;
                height: parent.height;
                spacing: 37;

                ToolButton{
                    id:tool1;
                    width: 33;
                    height: 37;
                    backgroundImage: "image/pattern1/保存-未选中.png";
                    pressedImage: "image/pattern1/保存-点击.png";
                    hoverImage: "image/pattern1/保存-点击.png";
                    state: "normal";
                    nIndex: 0;
                }
                ToolButton{
                    id:tool2;
                    width: 36;
                    height: 36;
                    backgroundImage: "image/pattern1/放大-未选中.png";
                    pressedImage: "image/pattern1/放大-点击.png";
                    hoverImage: "image/pattern1/放大-点击.png";
                    state: "normal";
                    nIndex: 1;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.enlarge();
                    }

                }
                ToolButton{
                    id:tool3;
                    width: 36;
                    height: 36;
                    backgroundImage: "image/pattern1/缩小-未选中.png";
                    pressedImage: "image/pattern1/缩小-点击.png"
                    hoverImage: "image/pattern1/缩小-点击.png";
                    state: "normal";
                    nIndex: 2;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.reduce();
                    }
                }

                ToolButton{
                    id:tool8;
                    width: 29;
                    height: 37;
                    anchors.verticalCenter: parent.verticalCenter;
                    backgroundImage: "image/tool/左旋转-未选中@2x.png";
                    pressedImage: "image/tool/左旋转@2x.png";
                    hoverImage: "image/tool/左旋转@2x.png";
                    state: "normal";
                    nIndex: 4;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.rotate_right();
                    }
                }

                ToolButton{
                    id:tool10;
                    width: 29;
                    height: 37;
                    anchors.verticalCenter: parent.verticalCenter;
                    backgroundImage: "image/tool/右旋转-未选中.png";
                    pressedImage: "image/tool/右旋转.png";
                    hoverImage: "image/tool/右旋转.png";
                    state: "normal";
                    nIndex: 4;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.rotate_left();
                    }
                }

                ToolButton{
                    id:tool9;
                    width: 27;
                    height: 34;
                    anchors.verticalCenter: parent.verticalCenter;
                    backgroundImage: "image/tool/置顶-未选中.png";
                    pressedImage: "image/tool/置顶.png";
                    hoverImage: "image/tool/置顶.png";
                    state: "normal";
                    nIndex: 4;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.image_up();
                    }
                }

                ToolButton{
                    id:tool11;
                    width: 27;
                    height: 34;
                    anchors.verticalCenter: parent.verticalCenter;
                    backgroundImage: "image/tool/置底-未选中.png";
                    pressedImage: "image/tool/置底.png";
                    hoverImage: "image/tool/置底.png";
                    state: "normal";
                    nIndex: 4;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.image_down();
                    }
                }

                ToolButton{
                    id:tool6;
                    width: 36;
                    height: 36;
                    backgroundImage: "image/tool/后退-未选中.png";
                    pressedImage: "image/tool/后退.png";
                    hoverImage: "image/tool/后退.png";
                    state: "normal";
                    nIndex: 3;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.back_one_step();
                    }

                }
                ToolButton{
                    id:tool7;
                    width: 36;
                    height: 36;
                    backgroundImage: "image/tool/前进-未选中.png";
                    pressedImage: "image/tool/前进.png";
                    hoverImage: "image/tool/前进.png";
                    state: "normal";
                    nIndex: 3;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.forward_one_step();
                    }

                }
                ToolButton{
                    id:tool4;
                    width: 42;
                    height: 36;
                    backgroundImage: "image/tool/重置-未选中.png";
                    pressedImage: "image/tool/重置.png";
                    hoverImage: "image/tool/重置.png";
                    state: "normal";
                    nIndex: 3;
                    onBack: {
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.resize();
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
                        Painter.setContext(draw.getContext("2d"), draw);
                        draw.requestPaint();
                        Painter.clearCanvas();
                    }
                }

            }



        }
    /*******************第四个框*********************/
        Rectangle{
            id: rec4;
            anchors.right: parent.right;
            anchors.top: parent.top;

            width: 300;
            height: 68;

            Image {
                id: bgImage4;
                anchors.fill: parent;
                source: "image/pattern2/纹理树-2.png";
            }
            Text {
                id: text4;
                font.family: "simplex";
                font.pixelSize: 30;
                color: "#ffffff";
                anchors.centerIn: parent;
                text: "纹理图案";
            }
        }
    /******************图案选择*****************************************************/

        Rectangle{
            id: rec5;
            anchors.right: parent.right;
            anchors.bottom:  parent.bottom;
            color: "transparent";
            width: 300;
            height: 741;
            Image {
                id: viewBack;
                source: "image/pattern2/纹理选框.png";
                anchors.fill: parent;
            }


            PathModel{
                id: pathmodel;
            }
            ListModel{
                id: model01;
            }

            ListView{
                id: view01;
                clip: true;
                anchors.fill: parent;
                anchors.top: parent.top;
                anchors.topMargin: 34;
                anchors.left: parent.left;
                anchors.leftMargin: 67;
                model: model01;


                delegate: Rectangle {
                    width: 166;
                    height: 151;
                    // 列表项
                    Image {
                        anchors.fill: parent;
                        source: ima;
                        sourceSize: Qt.size(800,600);
                    }
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {
                            view01.currentIndex = index;
                            console.log(index);
                            Painter.setContext(draw.getContext("2d"), draw);
                            draw.requestPaint();
                            l = pathmodel.getWithoutPath();
                            toolmansimage = "file:///"+ l[index];

                            Painter.addGraphic(0,0,toolmansimage,toolman.width,toolman.height);
                        }
                    }
                }

                spacing:22
            }

            // 代理
//            Rectangle {
//                id: delegate01

//                // 列表项
//                Image {
//                    width: 166;
//                    height: 151;
//                    source: ima;
//                }
//                MouseArea{
//                    anchors.fill: parent;
//                    onClicked: {
//                        view01.currentIndex = index;
//                        console.log(index);
//                    }
//                }
//            }

            //滚动条
            Sliderbar{
                id:slider01;
                visible:true;
                anchors.right: parent.right;
                anchors.top: parent.top;
                list:view01;
                width:31;
                height:739;
                imageslider:"image/pattern2/拖动条1.png"
                imageback:"image/pattern2/拖动1.png"
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
            id: menubar2;
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
                    id: file2;

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
                    id: help2;

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
                x:file2.x;
                y:file2.y+62;
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

                x:help2.x;
                y:help2.y+62;
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
                id: velse2
                source: "image/pattern1/3其他栏.png";
                anchors.left: parent.left;
                anchors.leftMargin: 702;
                anchors.top: parent.top;
            }
        }

        /****************************鼠标可以点击其他地方使菜单栏收起***********************************
          ************/
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
        
        //取色板**************************************************************************************
        colorDlg : Qt.createQmlObject('import QtQuick 2.2; import QtQuick.Dialogs 1.2;ColorDialog{}', vSecondInterface, "colorDlg");
        function selectColor(func){
            if(colorDlg != null){
                colorDlg.accepted.connect(func);
                colorDlg.visible = true;
            }
        }

        function onCanvasColor(){
            vSecondInterface.canvascolor = colorDlg.color;
            Painter.setContext(draw.getContext("2d"), draw);
            draw.requestPaint();
            Painter.background(canvascolor);
        }
}
