import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle{
    id: imageSelect;
    color: "transparent";
    property int listwidth;
    property int listheight;
    property int imageheight;
    property int imagewidth;

    clip: true;

    function addElement(ele){
        listmode.append(ele);
    }

    function clearList(){
        listmode.clear();
    }

    ListModel{
        id: listmode;
    }

    Component.onCompleted: {
        for (var i=0; i<10; i++)
            addElement({"path":""})  //此处遍历相应文件夹，添加文件夹中的所有图片路径
    }

    ListView{
        id: listview;

        width: listwidth;
        height: listheight;

        model: listmode;

        delegate: Rectangle{
            color: ListView.isCurrentItem? "#ffffff":"transparent";
            border.color: "white";
            height: imageheight;
            width: imagewidth;

            Image {
                id: imagelist;
                source: path;
                anchors.fill: parent;
            }

            MouseArea{
                anchors.fill: parent;
                onClicked: listview.currentIndex = index;
            }
        }
    }
}
