import QtQuick 2.0

Rectangle{
    id: rButton
    color: "transparent";
    border.width: 0;
    border.color: "white";
    property var backgroundImag: "";
    property var sHoverImage: "";
    property var txt: "";
    property var nIndex: 0;
    property var selcetIn: 0;
    property var sPressedImage: "";


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

        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        color: "#ffffff";/*color: "white";*/
        font.family: "simplex";
        font.pixelSize: 20;
        font.bold: true;
        text: txt;

    }

    MouseArea{
        id: buttonMouse;
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;
        hoverEnabled: true;

        onReleased:
        {
            rButton.state = "normal";
            selcect(selcetIn);
        }
        onEntered:
        {
            if(rButton.state==="normal")
            rButton.state = "hover";
            /* state === "normal" ? state = "hover" : state = "pressed"; */
        }
        onExited:
        {
            if(rButton.state === "hover")
            {
                rButton.state = "normal";
            }
        }
        onClicked: {

            if(nIndex===5&&subWindow1.visible===false&&subWindow2.visible===false){
                    subWindow1.visible=true;
                }
            if(nIndex===6&&subWindow2.visible===false&&subWindow1.visible===false){
                    subWindow2.visible=true;
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
        State {
            name: "pressed"
            PropertyChanges {
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
