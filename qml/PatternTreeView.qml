import QtQuick 2.0
import QtQuick.Controls 1.4

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
            //纹样类型
            objmodel.get(0).subNode.append({"name":"几何","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"植物","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"动物","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"图腾","level":1,"path":"","subNode":[]});
            objmodel.get(0).subNode.append({"name":"自然","level":1,"path":"","subNode":[]});
            //植物
            objmodel.get(0).subNode.get(1).subNode.append({"name":"花","level":2,"path":"","subNode":[],"leaf": true});
            objmodel.get(0).subNode.get(1).subNode.append({"name":"树","level":2,"path":"","subNode":[],"leaf": true});

            //动物
            objmodel.get(0).subNode.get(2).subNode.append({"name":"鸟","level":2,"path":"","subNode":[],"leaf": true});

            //自然
            objmodel.get(0).subNode.get(4).subNode.append({"name":"水","level":2,"path":"F:/master/test/3","subNode":[],"leaf": true});

            //植物-花
            objmodel.get(0).subNode.get(1).subNode.get(0).subNode.append({"name":"荷花","level":3,"path":"F:/master/test/2","subNode":[],"leaf": "true"});
            objmodel.get(0).subNode.get(1).subNode.get(0).subNode.append({"name":"百合花","level":3,"path":"F:/master/test/1","subNode":[],"leaf": "true"});
            //植物-树
            objmodel.get(0).subNode.get(1).subNode.get(1).subNode.append({"name":"柳树","level":3,"path":"F:/master/test/4","subNode":[],"leaf": "true"});
            //动物-鸟
            objmodel.get(0).subNode.get(2).subNode.get(0).subNode.append({"name":"百灵鸟","level":3,"path":"","subNode":[],"leaf": "true"});
            objmodel.get(0).subNode.get(2).subNode.get(0).subNode.append({"name":"凤凰","level":3,"path":"","subNode":[],"leaf": "true"});
        }
    }

    ExclusiveGroup{id: control;}

    Component{
        id: objDelegate;

        Column{
            id: objcolumn;

            MouseArea{
                width: objRow.implicitWidth;
                height: objRow.implicitHeight;
                anchors.left: parent.left;
                 //初始状态为收起列表
                Component.onCompleted: {
                    for(var i=1;i<parent.children.length-1;++i){
                        parent.children[i].visible=false;
                    }
                }

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
                        width: 100;
                        height: 40;
                        path:model.path;
                        txtSize: 20;
                        txtColor: model.leaf!=="true"?"#ffffff":"#A6A6A6";
                        leaf:model.leaf;
                        exclusivegroup: control;
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
