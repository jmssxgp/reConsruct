import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: sub_2;
    color: "transparent";

    property var sX;
    property var sY;
    property var sN;
    property var sK;
    property var sG;
    signal tran(var c);
    Rectangle{
        id: sub_2_top;
        width: 690;
        height: 63;
        anchors.top: parent.top;

        Image {
            z: 0.1;
            id: sub_2_top_image;
            source: "image/islamic star/矩形 466.png";
            anchors.fill: parent;
        }

        Text {
            z:0.2
            id: sub_2_top_text;
            text: qsTr("生成islamic rosette");
            anchors.centerIn: parent;
            font.family: "simplex";
            font.bold: true;
            font.pixelSize: 22;
            color: "#ffffff";
        }
    }

    Rectangle{
        id: sub_2_bottom;
        width: 690;
        height: 307;
        anchors.top: parent.top;
        anchors.topMargin: 63;

        Image {
            z:0.1;
            id: sub_2_bottom_image;
            source: "image/islamic star/矩形 469.png";
            anchors.fill: parent;
        }

        Row{
            width: 427;
            height: 25;
            anchors.top: parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 110;

            z: 0.2;
            spacing: 65;

            ParamInput{
                width: 47;
                height: parent.height;

                name: "N";
            }
            ParamInput{
                width: 47;
                height: parent.height;

                name: "K";
            }
            ParamInput{
                width: 47;
                height: parent.height;

                name: "G";
            }
            ParamInput{
                width: 47;
                height: parent.height;

                name: "X";
            }
            ParamInput{
                width: 47;
                height: parent.height;

                name: "Y";
            }
        }
        /**参数输入**********************************************************/
        TextField{
            id: sub_2_param_N;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 135;

            validator: IntValidator{bottom: 5; top: 20}//输入内容限制
            font: {
                font.pixelSize=20;
                font.family="simplex";
            }

            style: TextFieldStyle{
                textColor: "black";
                background: Rectangle{
                    implicitHeight: 25;
                    implicitWidth: 30;
                    color: "#ffffff";
                    radius: 3;
                }
            }

        }
        TextField{
            id: sub_2_param_K;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 245;

            validator: IntValidator{bottom: 0; top: 4}//输入内容限制
            font: {
                font.pixelSize=20;
                font.family="simplex";
            }

            style: TextFieldStyle{
                textColor: "black";
                background: Rectangle{
                    implicitHeight: 25;
                    implicitWidth: 30;
                    color: "#ffffff";
                    radius: 3;
                }
            }

        }
        TextField{
            id: sub_2_param_G;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 355;

            validator: IntValidator{bottom: 0; top: 3}//输入内容限制
            font: {
                font.pixelSize=20;
                font.family="simplex";
            }

            style: TextFieldStyle{
                textColor: "black";
                background: Rectangle{
                    implicitHeight: 25;
                    implicitWidth: 30;
                    color: "#ffffff";
                    radius: 3;
                }
            }

        }
        TextField{
            id: sub_2_param_X;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 467;

            validator: IntValidator{bottom: 40; top: 1000}//输入内容限制
            font: {
                font.pixelSize=20;
                font.family="simplex";
            }

            style: TextFieldStyle{
                textColor: "black";
                background: Rectangle{
                    implicitHeight: 25;
                    implicitWidth: 30;
                    color: "#ffffff";
                    radius: 3;
                }
            }
        }
        TextField{
            id: sub_2_param_Y;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 578;

            validator: IntValidator{bottom: 40; top: 200}//输入内容限制
            font: {
                font.pixelSize=20;
                font.family="simplex";
            }

            style: TextFieldStyle{
                textColor: "black";
                background: Rectangle{
                    implicitHeight: 25;
                    implicitWidth: 30;
                    color: "#ffffff";
                    radius: 3;
                }
            }
        }

//*********************确定按钮********************************************************/
        ConfirmButton{
            id: sub_2_confirm;
            width: 202;
            height: 44;
            z:0.2;

            anchors.left: parent.left;
            anchors.leftMargin: 244;
            anchors.top: parent.top;
            anchors.topMargin: 203;

            backgroundImg: "image/islamic star/确认.png";
            cIndex: 1;
            onConf: {
                console.log(sub_2_param_K.text)
                if(sub_2_param_X.text>=40)
                sX = sub_2_param_X.text
                else{
                    sX =60;
                }

                sY =sub_2_param_Y.text
                if(sub_2_param_N.text>=5)
                    sN =sub_2_param_N.text
                else{
                    sN = 6;
                }
                sG = sub_2_param_G.text;
                sK =sub_2_param_K.text
                tran(0);
            }
        }
    }
}
