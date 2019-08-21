import QtQuick 2.0

Rectangle{
    id: input;
    property var name: "";
    color: "transparent";

    Text {
        id: paramName;
        height: parent.height;
        text: name;
        font.pixelSize: 22;
        color: "#ffffff";
        font.family: "simplex";
        font.bold: true;
        anchors.left: parent.left;
    }

}
