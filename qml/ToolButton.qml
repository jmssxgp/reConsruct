import QtQuick 2.0

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
            //鼠标按下释放掉了，返回一个信号，告诉我的上层父亲，我被按下了，需要执行相应操作
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
}
