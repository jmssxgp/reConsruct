import QtQuick 2.0

Rectangle{
    id: imageSelect;
    color: "transparent";
    property int listwidth;
    property int listheight;
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

    ListView{
        id: listview;

        width: listwidth;
        height: listheight;

        model: listmode;

        delegate: ;
    }
}
