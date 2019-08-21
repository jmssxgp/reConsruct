import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: main_W;

    visible: true;

    flags: Qt.CursorShape |  Qt.WindowSystemMenuHint |Qt.FramelessWindowHint |  Qt.WindowMinimizeButtonHint | Qt.Window;
    width: 1920;
    height: 1080;
    title: qsTr("交互重构");
    MainInterface{
        anchors.fill: parent;

        visible: true;
    }

    Window{
        id: subWindow1;
        visible: false;
        width: 690;
        height: 370;
        flags: Qt.CursorShape |  Qt.WindowSystemMenuHint |Qt.FramelessWindowHint
        SubWin1{
            visible: true;
            anchors.fill: parent;
        }

    }

    Window{
        id: subWindow2;
        visible: false;
        width: 690;
        height: 370;
        flags: Qt.CursorShape |  Qt.WindowSystemMenuHint |Qt.FramelessWindowHint
        SubWin2{
            visible: true;
            anchors.fill: parent;
        }
    }
}
