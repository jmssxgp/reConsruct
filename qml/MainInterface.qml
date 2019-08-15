import QtQuick 2.0

Rectangle{
    id: vMainIterface;
    color: "transparent";
/**
  菜单栏****************************************************************************
  */
    Rectangle{
        id: menubar;
        color: "transparent"             //"#d6d6d7";
        width: 1920;
        height: 30;
        anchors.top: parent.top;

        Row{
            id: menubarButton;

            width: parent.width;
            height: parent.height;

            spacing: 10;
            anchors.left: parent.left;
            anchors.top: parent.top;

            Button{
                id: file;

                width: 80;
                height: parent.height;
                sPressedImage: "image/ButtonOn.png";
                sNormalImage: "image/Button.png";
                sHoverImage: "image/Button.png";
                sTextText: "文件";
                nTextSize: 17;
                state: "nomal"
            }

            Button{
                id: help;

                width: 80;
                height: parent.height;
                sPressedImage: "image/ButtonOn.png";
                sNormalImage: "image/Button.png";
                sHoverImage: "image/Button.png";
                sTextText: "帮助";
                nTextSize: 17;
                state: "nomal"
            }

        }
    }
/**
  模式切换******************************************************************
  */
    Rectangle{
        id: vPattern;
        color: "transparent";
        width: 60;
        height: 1000;
        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.topMargin: 60;

        Column{
            id: vPatternButton;
            width: parent.width;
            height: parent.height;
            spacing: 0;
            anchors.top: parent.top;

            Button{
                id: pattern1;

                width: parent.width;
                height: 150;
                sPressedImage: "";
                sNormalImage: "";
                sHoverImage: "";
                sTextText: "模\n式\n1";
                nTextSize: 17;
                state: "nomal"
            }

            Button{
                id: pattern2;

                width: parent.width;
                height: 150;
                sPressedImage: "";
                sNormalImage: "";
                sHoverImage: "";
                sTextText: "模\n式\n2";
                nTextSize: 17;
                state: "nomal"
            }
        }
    }

/**
  选择具体类型********************************************************************
  */
    Rectangle{
        id: vGraphic;
        color: "transparent";
        width: 60;
        height: 1000;
        anchors.left: parent.left;
        anchors.leftMargin: 100;
        anchors.top: parent.top;
        anchors.topMargin: 60;

        Column{
            id: vGraphicButton;
            width: parent.width;
            height: parent.height;
            spacing: 0;
            anchors.top: parent.top;

            Button{
                id: graphic1;

                width: parent.width;
                height: 150;
                sPressedImage: "";
                sNormalImage: "";
                sHoverImage: "";
                sTextText: "Islamic star";
                nTextSize: 17;
                state: "nomal"
            }

            Button{
                id: graphic2;

                width: parent.width;
                height: 150;
                sPressedImage: "";
                sNormalImage: "";
                sHoverImage: "";
                sTextText: "Islamic rosette";
                nTextSize: 17;
                state: "nomal"
            }
        }
    }

    /**
      重构按钮****************************************************************************
      */

    Rectangle{
        id: vReconstruct;
        color: "transparent";
        width: 60;
        height: 1000;
        anchors.right: parent.right;
        anchors.rightMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 60;

        Column{
            id: vReconstructButton;
            width: parent.width;
            height: parent.height;
            spacing: 0;
            anchors.top: parent.top;

            Button{
                id: reconstruct1;

                width: parent.width;
                height: 150;
                sPressedImage: "";
                sNormalImage: "";
                sHoverImage: "";
                sTextText: "重构按钮";
                nTextSize: 17;
                state: "nomal"
            }

            Button{
                id: reconstruct2;

                width: parent.width;
                height: 150;
                sPressedImage: "";
                sNormalImage: "";
                sHoverImage: "";
                sTextText: "重构按钮";
                nTextSize: 17;
                state: "nomal"
            }

            Button{
                id: reconstruct3;

                width: parent.width;
                height: 150;
                sPressedImage: "";
                sNormalImage: "";
                sHoverImage: "";
                sTextText: "重构按钮";
                nTextSize: 17;
                state: "nomal"
            }
        }
    }
}
