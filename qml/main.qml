import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    id: vWindow;

    width: 1920 ;//这个设定了当前Window的界面大小为桌面大小。
    height: 1080;
    title: qsTr("交互重构");


    MainInterface{
        anchors.fill: parent;

        visible: true;
    }
}
