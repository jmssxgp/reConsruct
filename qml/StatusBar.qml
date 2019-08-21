import QtQuick 2.0

Rectangle{
    id: statusBar;
    color: "transparent";
    property var txt: "";
    property var backgroundImg: "";

    Image {
        id: statusBarImage;
        source: backgroundImg;
        anchors.fill: parent;
    }

    Text {
        id: statusBartext;
        text: txt;
        anchors.left: parent.left;
        anchors.leftMargin: 22;
        anchors.verticalCenter: parent.verticalCenter;
        color: "#ffffff";
        font.pixelSize: 20;
        font.bold: true;
        font.family: "simplex";
    }
}
