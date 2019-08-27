//存放图片左上角顶点坐标和路径
var graphics = [];
//
var canvas;

var context;

function setContext(context_, mapdraw) {
    canvas = mapdraw;
    context = context_;
}

//图形定义
function Graphic(x,y,path){
    this.x = x;
    this.y = y;
    this.path = path;
    this.isSelected = false;
}

//添加图片
function addGraphic(x,y,path){
    var graphicpath = path;

    var graphic = new Graphic(x,y,graphicpath);
    graphics.push(graphic);
    drawGraphics();
    console.log(graphics.length)
}
//重置
function clearCanvas(){
    graphics = [];
    drawGraphics();
}

function drawGraphics(){
    context.clearRect(0, 0, canvas.width, canvas.height);
    console.log("draw start");
    for(var i = 0; i<graphics.length; i++){
        var graphic = graphics[i];

        //绘制图片
        context.drawImage(graphic.path,graphic.x,graphic.y);
        if(graphic.isSelected){
            context.lineWidth = 5;
        }else{
            context.lineWidth = 1;
        }
    }
}

var previousSelected;
var offsetX;
var offsetY;

function canvasClick(mouseX, mouseY){
    var clickX = mouseX;
    var clickY = mouseY;

    //查找被单击的图片

    for(var i=graphics.length-1; i>=0;i--){
        var graphic = graphics[i];
        if(clickX-graphic.x>=0&&clickX-graphic.x<=166&&clickY-graphic.y>=0&&clickY-graphic.y<=151)
        {
            if(previousSelected !=null){
                previousSelected.isSelected = false;
            }

            previousSelected = graphic;
            graphic.isSelected = true;

            offsetX = clickX - graphic.x;
            offsetY = clickY - graphic.y;

            isDragging = true;

            drawGraphics();
            console.log(graphic.path)
            return;
        }
    }
}

var isDragging = false;

function stopDragging() {
    isDragging = false;
}

function dragGraphic(mouseX, mouseY){
    if(isDragging){
        if(previousSelected!==null){
            var x=mouseX;
            var y=mouseY;

            previousSelected.x = x - offsetX;
            previousSelected.y = y - offsetY;

            drawGraphics();
        }
    }
}

































