import QtQuick 2.0
import QtQuick.Window 2.0
Rectangle{
    id: vButton;

    color: "transparent";

    //------------------------------------------------------------//

    property var backgroundImag: "";
    property var sNormalImage: "";
    property var sPressedImage: "";
    property var sHoverImage: "";
    property var txt: "";
    property var nIndex: 0;

    signal back(var nIndex);

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
            back(nIndex);
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
        }
    }

//    MouseArea{
//        id: vbuttonMouse;
//        anchors.fill: parent;

//        acceptedButtons: Qt.LeftButton;
//        hoverEnabled: true;
//        onPressed:
//        {
//            //当前鼠标按钮，将当前按钮的状态设置为按下状态
//            vButton.state === "pressed" ? vButton.state = "hover" : vButton.state = "pressed";
//        }
//        onReleased:
//        {
//            //鼠标按下释放掉了，返回一个信号，告诉我的上层父亲，我被按下了，需要执行相应操作
//            back(nIndex);
//        }

//        onEntered:
//        {
//            if(vButton.state === "normal")
//            {
//                vButton.state = "hover";
//            }

//            /* state === "normal" ? state = "hover" : state = "pressed"; */
//        }
//        onExited:
//        {
//            if(vButton.state === "hover")
//            {
//                vButton.state = "normal";
//            }

//            /* state === "hover" ? state = "normal" : state = "pressed"; */
//        }
//    }
    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                //target: titleButtonImage;
                //source: sNormalImage;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                //target: titleButtonImage;
                //source: sPressedImage;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                //target: titleButtonImage;
                //source: sHoverImage;
            }
        }
    ]

}
