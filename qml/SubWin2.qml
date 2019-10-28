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

        Column{
            width: 427;
            height: 25;
            anchors.top: parent.top;
            anchors.topMargin: 30;
            anchors.left: parent.left;
            anchors.leftMargin: 140;

            z: 0.2;
            spacing: 25;
            ParamInput{
                width: parent.width;
                height: 17;

                name: "N";
            }
            ParamInput{
                width: parent.width;
                height: 17;

                name: "K";
            }
            ParamInput{
                width: parent.width;
                height: 17;

                name: "G";
            }
            ParamInput{
                width: parent.width;
                height: 17;

                name: "X";
            }
            ParamInput{
                width: parent.width;
                height: 17;

                name: "Y";
            }
        }


        /**参数滑动**********************************************************/
        Slider{
            id:nGrooveAndHandle;
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 36;
            anchors.left: parent.left;
            anchors.leftMargin: 180;
            width:300;
            height: 17;
            minimumValue: 6
            maximumValue: 20;
            stepSize: 2;
            value: 0;
            onValueChanged:
            {
                nname.text =  value;
            }
            style: SliderStyle{
                groove:Rectangle{
                    implicitHeight: 8;
                    implicitWidth:300;
                    color: "gray";
                    radius: 4;
                }
                handle: Rectangle{
                    anchors.centerIn: parent;
                    color: control.pressed?"white":"lightgray";
                    width: 14;
                    height: 14;
                    radius: 12;
                }
            }
        }

        Slider{
            id:kGrooveAndHandle;
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 78;
            anchors.left: parent.left;
            anchors.leftMargin: 180;
            width:300;
            height: 17;
            minimumValue: 0
            maximumValue: 5;
            stepSize: 1;
            value: 0;
            onValueChanged:
            {
                kname.text =  value;
            }
            style: SliderStyle{
                groove:Rectangle{
                    implicitHeight: 8;
                    implicitWidth:300;
                    color: "gray";
                    radius: 4;
                }
                handle: Rectangle{
                    anchors.centerIn: parent;
                    color: control.pressed?"white":"lightgray";
                    width: 14;
                    height: 14;
                    radius: 12;
                }
            }
        }

        Slider{
            id:gGrooveAndHandle;
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 120;
            anchors.left: parent.left;
            anchors.leftMargin: 180;
            width:300;
            height: 17;
            minimumValue: 0;
            maximumValue: 10;
            stepSize: 1;
            value: 0;
            onValueChanged:
            {
                gname.text =  value;
            }
            style: SliderStyle{
                groove:Rectangle{
                    implicitHeight: 8;
                    implicitWidth:300;
                    color: "gray";
                    radius: 4;
                }
                handle: Rectangle{
                    anchors.centerIn: parent;
                    color: control.pressed?"white":"lightgray";
                    width: 14;
                    height: 14;
                    radius: 12;
                }
            }
        }

        Slider{
            id:xGrooveAndHandle;
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 162;
            anchors.left: parent.left;
            anchors.leftMargin: 180;
            width:300;
            height: 17;
            minimumValue: nGrooveAndHandle.value*10;
            maximumValue: nGrooveAndHandle.value*20+200;
            stepSize: 1;
            value: 0;
            onValueChanged:
            {
                xname.text =  value;
            }
            style: SliderStyle{
                groove:Rectangle{
                    implicitHeight: 8;
                    implicitWidth:300;
                    color: "gray";
                    radius: 4;
                }
                handle: Rectangle{
                    anchors.centerIn: parent;
                    color: control.pressed?"white":"lightgray";
                    width: 14;
                    height: 14;
                    radius: 12;
                }
            }
        }

        Slider{
            id:yGrooveAndHandle;
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 204;
            anchors.left: parent.left;
            anchors.leftMargin: 180;
            width:300;
            height: 17;
            minimumValue: 20
            maximumValue: nGrooveAndHandle.value*20;
            stepSize: 1;
            value: 0;
            onValueChanged:
            {
                yname.text =  value;
            }
            style: SliderStyle{
                groove:Rectangle{
                    implicitHeight: 8;
                    implicitWidth:300;
                    color: "gray";
                    radius: 4;
                }
                handle: Rectangle{
                    anchors.centerIn: parent;
                    color: control.pressed?"white":"lightgray";
                    width: 14;
                    height: 14;
                    radius: 12;
                }
            }
        }
        Text {
            id: nname
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 36;
            anchors.left: parent.left;
            anchors.leftMargin: 500;
            font.pixelSize: 22
            font.letterSpacing: 1;
            text: "0";
        }

        Text {
            id: kname
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 78;
            anchors.left: parent.left;
            anchors.leftMargin: 500;
            font.pixelSize: 22
            font.letterSpacing: 1;
            text: "0";
        }
        Text {
            id: gname
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 120;
            anchors.left: parent.left;
            anchors.leftMargin: 500;
            font.pixelSize: 22
            font.letterSpacing: 1;
            text: "0";
        }

        Text {
            id: xname
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 162;
            anchors.left: parent.left;
            anchors.leftMargin: 500;
            font.pixelSize: 22
            font.letterSpacing: 1;
            text: "0";
        }

        Text {
            id: yname
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            z:0.2;
            anchors.top: parent.top;
            anchors.topMargin: 204;
            anchors.left: parent.left;
            anchors.leftMargin: 500;
            font.pixelSize: 22
            font.letterSpacing: 1;
            text: "0";
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
            anchors.topMargin: 233;

            backgroundImg: "image/islamic star/确认.png";
            cIndex: 1;
            onConf: {
                sX = xGrooveAndHandle.value;
                sY = yGrooveAndHandle.value;
                sN = nGrooveAndHandle.value;
                sG = gGrooveAndHandle.value;
                sK = kGrooveAndHandle.value;
                tran(0);
            }
        }
    }
}
