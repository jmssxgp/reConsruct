import QtQuick 2.0
import com.test.PathModel 1.0
import QtQuick.Controls 1.4

Rectangle{
    id: islamicButton;
    color: "transparent";
    property var backgroundImage: "";
    property var generateImage: "";
    property var sHoverImage: "";
    property var sPressedImage: "";
    property var txt: "";
    property var cIndex: 0;

    property var l;
    property var path;
    property var n;

    Image {
        id: background;
        source: backgroundImage;
        width: 170;
        height: 165;
        anchors.top: parent.top;
    }

    Rectangle{
        id:generate;
        width: 162;
        height: 30;
        color: "transparent";
        anchors.bottom: parent.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;

        Image {
            id: imageOfGenerate;
            anchors.fill: parent;
            source: generateImage;
        }

        Text{
            id: islamicTitle;
            text: txt;
            font.family: "simplex";
            font.pixelSize: 20;
            font.bold: true;
            color: "#ffffff";
            anchors.verticalCenter: parent.verticalCenter;
            anchors.horizontalCenter: parent.horizontalCenter;
        }

        MouseArea{
            anchors.fill: parent;
            hoverEnabled: true;
            onClicked: {
                if(cIndex===0){
                    patternProvider.aidStar(70,0,8,2);
                    drawPattern.source="image://islamic/hellox";
                }
                if(cIndex===1){
                    patternProvider.aidRosette(120,-40,8,2,1);
                    drawPattern.source="image://islamic/helloy";
                }
            }

            onPressAndHold: {
                islamicButton.state = "pressed";
            }
            onEntered: {
                islamicButton.state = "hover";

            }
            onReleased: {
                islamicButton.state = "normal";
            }
            onExited: {
                islamicButton.state = "normal";
            }
        }
    }


    PathModel{
        id:path_for_islamic;
    }

    Component.onCompleted: {
        l = path_for_islamic.getNames(path);
        n = path_for_islamic.getNum();
        console.log(n)
        timer_for_star.start();
        timer_for_rosette.start();
    }


    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: imageOfGenerate;
                source: generateImage;
            }
        },
        State {
            name: "pressed"
            PropertyChanges {
                target: imageOfGenerate;
                source: sPressedImage;

            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: imageOfGenerate;
                source: sHoverImage;
            }
        }
    ]
}
