import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: sub_1;
    color: "transparent";


    Rectangle{
        id: sub_1_top;
        width: 690;
        height: 63;
        anchors.top: parent.top;

        Image {
            z: 0.1;
            id: sub_1_top_image;
            source: "image/islamic star/矩形 466.png";
            anchors.fill: parent;
        }

        Text {
            z:0.2
            id: sub_1_top_text;
            text: qsTr("生成islamic star");
            anchors.centerIn: parent;
            font.family: "simplex";
            font.bold: true;
            font.pixelSize: 22;
            color: "#ffffff";
        }
    }

    Rectangle{
        id: sub_1_bottom;
        width: 690;
        height: 307;
        anchors.top: parent.top;
        anchors.topMargin: 63;

        Image {
            z:0.1;
            id: sub_1_bottom_image;
            source: "image/islamic star/矩形 469.png";
            anchors.fill: parent;
        }

        Row{
            width: 427;
            height: 25;
            anchors.top: parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 140;

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
            id: sub_1_param_N;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 165;

            validator: IntValidator{bottom: 1; top: 20}//输入内容限制
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
            id: sub_1_param_K;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 275;

            validator: IntValidator{bottom: 1; top: 20}//输入内容限制
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
            id: sub_1_param_X;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 385;

            validator: IntValidator{bottom: 1; top: 20}//输入内容限制
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
            id: sub_1_param_Y;
            z:0.2;
            anchors.top:parent.top;
            anchors.topMargin: 76;
            anchors.left: parent.left;
            anchors.leftMargin: 495;

            validator: IntValidator{bottom: 1; top: 20}//输入内容限制
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
            id: sub_1_confirm;
            width: 202;
            height: 44;
            z:0.2;

            anchors.left: parent.left;
            anchors.leftMargin: 244;
            anchors.top: parent.top;
            anchors.topMargin: 203;

            backgroundImg: "image/islamic star/确认.png";
            cIndex: 0;
        }
    }
}
