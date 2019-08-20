import QtQuick 2.0

Rectangle{
    id: vBarButton;
    color: "transparent";

    property var backgroundImage: "";
    property var foregroundImageRight: "";
    property var foregroundImageLeft: "";
    property var txt: "";
    Image {
        id: vbuttonBack;
        source: backgroundImage;
        anchors.fill: parent;
    }

    Image {
        id: vbuttonForeR;
        source: foregroundImageRight;
        anchors.top: parent.top;
        anchors.topMargin: 22;
        anchors.right: parent.right;
        anchors.rightMargin: 135;
    }

    Image {
        id: vbuttonForeL;
        source: foregroundImageLeft;
        anchors.top: parent.top;
        anchors.topMargin: 20;
        anchors.left: parent.left;
        anchors.leftMargin: 35;
    }


    Text {
        id: vBarButtonText;
        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.topMargin: 17;
        anchors.leftMargin: 134;
        text: txt;
        font.bold: true;
        font.family: "simplex";
        font.pixelSize: 25;
        color: "#ffffff";
    }
}
