import QtQuick 2.0
import QtQuick.Window 2.0

Rectangle{
    id: titleButton;
    color: "transparent";
    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage: "";
    property var sTextText: "";
    property var nTextSize: 12;

    property var nIndex: 0;

    signal back(var nIndex);

    //------------------------------------------------------------//

    //button image
    Image
    {
        id: titleButtonImage;
        /*
        x: 0;
        y: 0;
        width: parent.width;
        height: parent.height;
        */
        anchors.fill: parent;
        source: sNormalImage;
    }


    Text
    {
        id: titleButtonText;

        x: 0;
        y: 0;
        width: parent.width;
        height: parent.height;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        wrapMode: Text.WordWrap;
        color: "#000000";/*color: "black";*/
        font.family: "微软雅黑";
        font.pixelSize: nTextSize;
        font.letterSpacing: 1;
        font.bold: true;
        text: sTextText;

    }


    MouseArea
    {
        id: titleButtonMouseArea;

        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MidButton;
        hoverEnabled: true;
        onPressed:
        {
            if(mouse.button === Qt.RightButton)
            {
                console.log("Mouse Right");
            }
            else if(mouse.button === Qt.LeftButton)
            {
                console.log("Mouse Left");
            }
            else if(mouse.button === Qt.MidButton)
            {
                console.log("Mouse Mid");
            }

            titleButton.state = "pressed";
        }
        onReleased:
        {
            titleButton.state = "normal";
            back(nIndex);
        }

        onEntered:
        {
            if(titleButton.state === "normal")
            {
                titleButton.state = "hover";
            }

            /* state === "normal" ? state = "hover" : state = "pressed"; */
        }
        onExited:
        {
            if(titleButton.state === "hover")
            {
                titleButton.state = "normal";
            }

            /* state === "hover" ? state = "normal" : state = "pressed"; */
        }
        onWheel:
        {

        }

        onClicked:
        {
            if(nIndex == 0)
                main_w = Window.Minimized;
            if(nIndex == 1)
            {

                main_w.visibility === Window.Windowed ?
                            main_w.visibility = Window.Maximized :vWindow.visibility = Window.Windowed;

            }

            if(nIndex == 2)
                Qt.quit();
        }
    }


    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: titleButtonImage;
                source: sNormalImage;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                target: titleButtonImage;
                source: sPressedImage;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: titleButtonImage;
                source: sHoverImage;
            }
        }
    ]

}
