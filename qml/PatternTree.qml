import QtQuick 2.0

Rectangle{
    id: patterntree;
    color: "transparent";

    property var l;
    property int n: 0;
    property var path: "";
    property var txt: "";
    property var txtColor;

    Text {
        id: cla
        text: txt;
        font.bold: true;
        font.pixelSize: 20;
        font.family: "simplex";
        color: txtColor;
    }

    MouseArea{
        width: 45;
        height: 40;
        anchors.right: parent.right;
        anchors.top: parent.top;
        acceptedButtons: Qt.LeftButton;
        //传回path路径，需要为canvas加载文件夹中所有文件，为model01加载所有的图片到listview,使用pathmodel获取文件名
        onClicked: {
            if(path!=""){//叶子节点
                model01.clear();//清除之前内容

                l = pathmodel.getNames(path); //文件名list
                n = pathmodel.getNum(); //文件数量

                /**为listview（modelid: model01)加载图片***************************************************************/
                for(var i = 0; i< n; i++){
                    model01.append({"ima":"file:///"+l[i]});
                }

                /**为canvas加载所有图片*******************************************/
                for(var i = 0; i< n; i++){
                    draw.loadImage("file:///"+l[i]);
                    console.log("load")
                }
            }

        }

    }
}
