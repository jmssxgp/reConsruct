import QtQuick 2.0

Rectangle{
    id: titlebar;
    color: "transparent";

    Image {
        id: titleBackground;
        source: "image/topHurdle.png";
        anchors.fill: parent;
    }

    Text{
        id: title;
        anchors.centerIn: parent;
        font.family: "simplex";
        font.bold: true;
        font.pixelSize: 30;
        color: "#ffffff";

        text: "交互几何重构";
    }

    Row{
        id: titleButtonRow;

        anchors.right: parent.right;
        anchors.rightMargin: 41;
        anchors.top: parent.top;
        anchors.topMargin: 26;
        height: 30;

        spacing: 8;

        TitleButton{
            id: min;
            width: 30;
            height: 30;
            sNormalImage: "image/pattern1/最小化.png";

            state: "normal";
            nIndex: 0;
        }
        TitleButton{
            id: max;
            width: 30;
            height: 30;
            sNormalImage: "image/pattern1/放大-半屏.png";

            state: "normal";
            nIndex: 1;
        }
        TitleButton{
            id: exit;
            width: 30;
            height: 30;
            sNormalImage: "image/pattern1/关闭.png";

            state: "normal";
            nIndex: 2;
        }
    }
}
