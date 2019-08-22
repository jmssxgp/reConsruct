import QtQuick 2.0
import QtQuick.Window 2.0
Rectangle{
    id: vButton;

    color: "transparent";

    //------------------------------------------------------------//

    property var backgroundImag: "";

    property var sHoverImage: "";
    property var txt: "";
    property var nIndex: 0;
    property var selcetIn: 0;

    signal back(var nIndex);
    signal selcect(var selcetIn);

    Image {
        id: vButtonImage;

        anchors.fill: parent;
        source: backgroundImag;
    }

    Text
    {
        id: vButtonText;

        width: 28;
        height: 112;
        anchors.top: parent.top;
        anchors.topMargin: 44;
        anchors.left: parent.left;
        anchors.leftMargin: 26;
        color: "#ffffff";/*color: "white";*/
        font.family: "simplex";
        font.pixelSize: 25;
        font.bold: true;
        text: txt;

    }

    MouseArea{
        id: buttonMouse;
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;

        onReleased:
        {
            vButton.state = "normal";
            selcect(selcetIn);
        }
        onEntered:
        {
            vButton.state = "hover";
            /* state === "normal" ? state = "hover" : state = "pressed"; */
        }
        onExited:
        {
            if(vButton.state === "hover")
            {
                vButton.state = "normal";
            }
        }
        onClicked: {
            if(nIndex===0){
                main_W.visibility =Window.Minimized;
            }
            if(nIndex === 1)
            {
                main_W.visibility === Window.Windowed ?
                            main_W.visibility = Window.Maximized :main_W.visibility = Window.Windowed;

            }

            if(nIndex === 2)
                Qt.quit();
            if(nIndex === 3){
                selcetIn = 0;
            }
            if(nIndex === 4){
                selcetIn = 1;
            }
        }
    }

    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: vButtonImage;
                source: backgroundImag;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: vButtonImage;
                source: sHoverImage;
            }
        }
    ]

}
