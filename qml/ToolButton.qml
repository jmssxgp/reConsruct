import QtQuick 2.0
import "imagepaint.js" as Painter
import QtQuick.Dialogs 1.2

Rectangle{
    id:toolbutton;
    color:"transparent";

    property var backgroundImage: "";
    property var pressedImage: "";
    property var hoverImage: "";
    property var nIndex: 0;

    signal back(var nIndex);

    Image {
        id: tool;
        source: backgroundImage;
        anchors.fill: parent;
    }

    MouseArea{
        acceptedButtons: Qt.LeftButton;

        anchors.fill: parent;

        hoverEnabled: true;
        onPressed:
        {
            //当前鼠标按钮，将当前按钮的状态设置为按下状态
            toolbutton.state === "pressed" ? toolbutton.state = "hover" : toolbutton.state = "pressed";
        }
        onReleased:
        {
            back(nIndex);
            toolbutton.state="normal";
        }

        onEntered:
        {
            if(toolbutton.state === "normal")
            {
                toolbutton.state = "hover";

            }

            /* state === "normal" ? state = "hover" : state = "pressed"; */
        }
        onExited:
        {
            if(toolbutton.state === "hover")
            {
                toolbutton.state = "normal";
            }

            /* state === "hover" ? state = "normal" : state = "pressed"; */
        }
        onClicked: {
            if(nIndex==0){
                filesave.open();
            }

        }

    }

    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: tool;
                source: backgroundImage;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                target: tool;
                source: pressedImage;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: tool;
                source: hoverImage;
            }
        }
    ]

    //保存画布内容********************************************
    FileDialog{
        id: filesave;
        selectExisting: false;
        folder: shortcuts.desktop;
        nameFilters: ["image files(*.jpg)"];
        onAccepted: {
            if(fileUrl!==""){
                draw.save(fileUrl.toString().substring(8,fileUrl.length));

            }
        }

    }

}
