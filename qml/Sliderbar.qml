import QtQuick 2.0

import QtQuick 2.0

Item{
    id: root01
    property variant list:ListView{}
    property var imageback:""
    property var imageslider:""

    Rectangle {
        id: sliderbar
        width: parent.width
        height: parent.height
        color: "transparent"
        radius: 1
        anchors.right: parent.right

        Image{
            id:imaback;
            anchors.fill: parent;
            source:imageback;
        }

       /* MouseArea{
            id:mouseScrollbar
            anchors.fill: parent
            onClicked: {
                var pt = mouseY < button.height ? 0 : (mouseY < sliderbar.height - button.height ? mouseY : sliderbar.height - button.height)
                list.contentY = pt / (sliderbar.height - button.height) * (list.contentHeight - list.visibleArea.heightRatio * list.contentHeight)
            }
        }*/

        // 按钮
        Rectangle {
            id: button
            x: 0
            y: list.visibleArea.yPosition * sliderbar.height
            //y: list.contentY /(list.contentHeight - (list.visibleArea.heightRatio * list.contentHeight)) * (sliderbar.height - button.height)
            width: parent.width
            height: list.visibleArea.heightRatio * sliderbar.height;
            //height: list.visibleArea.heightRatio * sliderbar.height < (list.visibleArea.heightRatio * list.contentHeight)/5 ? (list.visibleArea.heightRatio * list.contentHeight)/5 : list.visibleArea.heightRatio * sliderbar.height;
            color: "transparent"
            radius: 1

            Image{
                id:imabutton;
                anchors.fill: parent;
                //x:parent.x;
                //y:parent.y;
                //width: parent.width;
                //height: parent.height;
                source:imageslider;
            }
            // 鼠标区域
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                drag.target: button
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: sliderbar.height - button.height
                // 拖动
                onMouseYChanged: {
                    var pt = button.y
                    //list.contentY = pt / sliderbar.height * list.contentHeight
                    list.contentY = pt / (sliderbar.height - button.height) * (list.contentHeight - list.visibleArea.heightRatio * list.contentHeight)
                }
            }
        }
    }
}


