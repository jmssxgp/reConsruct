import QtQuick 2.0

Item {
    width: 600;
    height: 600;


    ListModel{
        id: objmodel;
        Component.onCompleted: {
            objmodel.append({"name":"纹样类型","level":0,"path":"","subNode":[]});
            objmodel.append({"name":"纹样来源","level":0,"path":"","subNode":[]});
            objmodel.append({"name":"技法工艺","level":0,"path":"","subNode":[]});
            objmodel.append({"name":"提取载体","level":0,"path":"","subNode":[]});
            objmodel.append({"name":"纹样意义","level":0,"path":"","subNode":[]});
            objmodel.append({"name":"材质类型","level":0,"path":"","subNode":[]});
            objmodel.append({"name":"民族","level":0,"path":"","subNode":[]});
            objmodel.append({"name":"时间","level":0,"path":"","subNode":[]});
            objmodel.append({"name":"地域","level":0,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"几何","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"植物","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"动物","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"图腾","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"自然","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.get(1).subNode.append({"name":"花","level":2,"path":"","subNode":[]});
            objmodel.get(0).subNode.get(2).subNode.append({"name":"鸟","level":2,"path":"","subNode":[]});
            objmodel.get(0).subNode.get(1).subNode.get(0).subNode.append({"name":"玫瑰花","level":3,"path":"F:/master/test/2","subNode":[]});
            objmodel.get(0).subNode.get(1).subNode.get(0).subNode.append({"name":"百合花","level":3,"path":"F:/master/test/1","subNode":[]});
            objmodel.get(0).subNode.get(2).subNode.get(0).subNode.append({"name":"百灵鸟","level":3,"path":"","subNode":[]});
            objmodel.get(0).subNode.get(2).subNode.get(0).subNode.append({"name":"凤凰","level":3,"path":"","subNode":[]});
        }
    }

    Component{
        id: objDelegate;
        Column{
            id: objcolumn;
            MouseArea{
                width: objRow.implicitWidth;
                height: objRow.implicitHeight;
                onClicked: {
                    console.log("点击");
                    for(var i=1;i<parent.children.length-1;++i){
                        parent.children[i].visible=!parent.children[i].visible;
                    }
                }
                Row{
                    id:objRow;
                    Item {
                        height: 1;
                        width: model.level*20;
                    }

                    PatternTree{
                        id: tree;
                        txt:(objcolumn.children.length>2?objcolumn.children[1].visible?qsTr("-  ") : qsTr("+  ") : qsTr("   ")) + model.name;
                        width: 60;
                        height: 40;
                        path:model.path;
                        txtColor: objcolumn.children.length>2?"#A6A6A6":"#ffffff";
                    }

                }
            }
            Repeater{
                model: subNode;
                delegate: objDelegate;
            }


        }
    }
    ListView{
        anchors.fill: parent;
        model: objmodel;
        delegate: objDelegate;
    }
}
