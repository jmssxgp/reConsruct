import QtQuick 2.0

Rectangle{
    id:toolbutton;
    color:"transparent";

    property var backgroundImage: "";

    Image {
        id: tool;
        source: backgroundImage;
        anchors.fill: parent;
    }
}
