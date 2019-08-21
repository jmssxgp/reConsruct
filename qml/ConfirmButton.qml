import QtQuick 2.0

Rectangle{
    id: confirm;
    color: "transparent";
    property var backgroundImg: "";
    property var cIndex: 0;

    Image {
        id: button_image
        source: backgroundImg;
        anchors.fill: parent;
    }

    Text {
        id: button_text;
        text: qsTr("确认");
        anchors.centerIn: parent;
        font.bold: true;
        font.pixelSize: 22;
        font.family: "simplex";
        color: "#ffffff";
    }

    MouseArea{
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;

        onClicked: {
            if(cIndex === 0){
                subWindow1.visible = false; //隐藏子窗口
            }
            if(cIndex === 1){
                subWindow2.visible = false;
            }
        }
    }
}
