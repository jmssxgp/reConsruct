import QtQuick 2.0
import QtQuick.Dialogs 1.2

Rectangle {

    id: menu_Button;

    color: "#474747";

    property var sPressedImage: "";
    property var sBottomImage: "";
    property var sLeftImage: "";
    property var sRightImage: "";
    property var sTextText: "";
    property var nTextSize: 12;
    property var nIndex: 0;




    signal menuButtonIndexBack(var nIndex);


    Image
    {
        id: bottomImage;
        anchors.fill: parent;
        source: sBottomImage;
    }

    Image {
        id: pressedImage;
        visible: false;
        anchors.fill: parent;
        source: sPressedImage;
    }

    Image
    {
        id: leftImage;
        anchors.top: parent.top;
        anchors.topMargin: 20;
        anchors.left: parent.left;
        anchors.leftMargin: 36;
        source: sLeftImage;
    }

    Image {
        id: rightImage;
        anchors.top: parent.top;
        anchors.topMargin: 22;
        anchors.left: parent.left;
        anchors.leftMargin: 230;
        source: sRightImage;
    }


    Text {
        id: menuButtonText;

        width: parent.width;
        height: parent.height;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        wrapMode: Text.WordWrap;
        color: "#ffffff";
        font.family: "simplex";
        font.pixelSize: 25;
        font.letterSpacing: 1;
//        font.bold: true;
        text: sTextText;
    }

    MouseArea
    {
        id: menuButtonMouseArea;

        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton ;
        onPressed:
        {
            menu_Button.state = "pressed";
            menuAllMouseArea.visible = true;
            if(nIndex == 0)
            {

                rect_MenuFile.visible = true;
                rect_MenuEdit.visible = false;
            }
            if(nIndex == 1)
            {
                rect_MenuEdit.visible = true;
                rect_MenuFile.visible = false;
            }
            if(nIndex==6)
            {
                firstInterface.visible=true;
                secondInterface.visible=false;
            }
           if(nIndex==7)
            {
               firstInterface.visible=false;
               secondInterface.visible=true;
            }



        }
        onReleased:
        {
            menuButtonIndexBack(nIndex);
            console.log("release->menuButton");
//            if(nInde>1)
//            {
//                rect_MenuFile.visible = false;
//                rect_MenuEdit = false;
//            }
             console.log(nIndex);
        }

        onClicked:
        {
            if(nIndex==2)
            {
//                fileDialog.selectExisting = false;

                fileDialog.open();
            }
            if(nIndex==3)
            {
                Qt.quit();
            }
        }

    }

    FileDialog {
        id: fileDialog;
        folder: shortcuts.desktop;
        nameFilters: ["Text files (*.txt)", "HTML files (*.html, *.htm)"]
        onAccepted: {
            if (fileDialog.selectExisting)
                document.fileUrl = fileUrl;
            else
                document.saveAs(fileUrl, selectedNameFilter);
        }
    }

//    states: [
//        State {
//            name: "normal";
//            PropertyChanges {
//                target: menuButtonImage;
//                source: sNormalImage;
//            }
//        },
//        State {
//            name: "pressed";
//            PropertyChanges {
//                target: menuButtonImage;
//                source: sPressedImage;
//            }
//        }
//    ]


}
