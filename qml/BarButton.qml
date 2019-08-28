import QtQuick 2.0
import QtQuick.Dialogs 1.2


Rectangle{
    id: vBarButton;
    color: "transparent";

    property var backgroundImage: "";
    property var foregroundImageRight: "";
    property var foregroundImageLeft: "";
    property var txt: "";
    property var nIndex: 0;
    property var size: 25;
    property var distance: 0;
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
        anchors.rightMargin: distance;
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


    MouseArea{
        id:buttonMouse;
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;

        onPressed: {
            menuAllMouseArea.visible=true;
            if(nIndex===0){
                rect_MenuFile.visible=true;
                rect_MenuEdit.visible=false;
            }
            if(nIndex===1){
                rect_MenuFile.visible=false;
                rect_MenuEdit.visible=true;
            }
        }

        onReleased: {
            if(nIndex>1){
                rect_MenuFile.visible=false;
                rect_MenuEdit.visible=false;
            }
        }

        onClicked: {

            if(nIndex===2){
                fileDialog.open();
            }

            if(nIndex===3){
                Qt.quit();
            }
        }
        FileDialog{
            id: fileDialog;
            folder: shortcuts.desktop;
            selectExisting: false;

            nameFilters: ["Image files (*.jpg)", "HTML files (*.html, *.htm)"]
            onAccepted: {
                console.log(fileUrl)
            }
        }
    }
}
