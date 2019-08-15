import QtQuick 2.0

Rectangle{
    id: vButton;

    color: "transparent";

    //------------------------------------------------------------//

    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage: "";
    property var sTextText: "";
    property var nTextSize: 12;

    property var nIndex: 0;

    //定义一个信号，这个信号用于返回某些参数
    signal back(var nIndex);


    Image {
        id: vButtonImage;

        anchors.fill: parent;
        source: sNormalImage;
    }

    Text
    {
        id: vButtonText;

        x: 0;
        y: 0;
        width: parent.width;
        height: parent.height;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        wrapMode: Text.WordWrap;
        color: "#000000";/*color: "black";*/
        font.family: "楷体";
        font.pixelSize: nTextSize;
        font.letterSpacing: 1;
        font.bold: false;
        text: sTextText;

    }

    MouseArea{
        id: vbuttonMouse;
        anchors.fill: parent;

        acceptedButtons: Qt.LeftButton;
        hoverEnabled: true;
        onPressed:
        {
            //当前鼠标按钮，将当前按钮的状态设置为按下状态
            vButton.state === "pressed" ? vButton.state = "hover" : vButton.state = "pressed";
        }
        onReleased:
        {
            //鼠标按下释放掉了，返回一个信号，告诉我的上层父亲，我被按下了，需要执行相应操作
            back(nIndex);
        }

        onEntered:
        {
            if(vButton.state === "normal")
            {
                vButton.state = "hover";
            }

            /* state === "normal" ? state = "hover" : state = "pressed"; */
        }
        onExited:
        {
            if(vButton.state === "hover")
            {
                vButton.state = "normal";
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
                //表示当该button的state变为normal时，target指目标即vButtonImage这个ID的对象，
                //他的source属性将赋值为sNormalImage；同比类推下面的
                target: vButtonImage;
                source: sNormalImage;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                target: vButtonImage;
                source: sPressedImage;
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
