import QtQuick 2.0

Rectangle{
    id: islamicButton;
    color: "transparent";

    property var backgroundImage: "";
    property var txt: "";

    Image {
        id: background;
        source: backgroundImage;
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
}
