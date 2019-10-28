import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: main_W;

    visible: true;

    flags: Qt.Window|Qt.FramelessWindowHint;
    width: 1919;
    height: 1080;
    title: qsTr("交互重构");
    property var n;

    function selectInterface(selectIn)
    {
        vMain.visible = false;
        vSecond.visible = false;
        switch (selectIn){
        case 0 :
            vMain.visible = true;
            vMain.timer_util(true);
            break;
        case 1 :
            vSecond.visible = true;
            vMain.timer_util(false);
            break
        }
    }




    MainInterface{
        id: vMain
        anchors.fill: parent;
        visible: true;
    }

    SecondInterface{
        id: vSecond
        anchors.fill: parent;

        visible: false;
    }



}
