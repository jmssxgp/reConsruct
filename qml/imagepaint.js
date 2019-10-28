//存放图片左上角顶点坐标和路径
var graphics = [];
//
var now = -1;

var canvas;

var context;

var backcolor = "#ffffff";

var backimg = "";

function setContext(context_, mapdraw) {
    canvas = mapdraw;
    context = context_;
}

//图形定义
function Graphic(x,y,path,w,h){
    this.x = x;
    this.y = y;
    this.path = path;
    this.w = w;
    this.h = h;
    this.width = w;
    this.height = h;
    this.scal = 0;
    this.isSelected = false;
}

function Queue(){
    var preserve = [];

    this.push = function(element){   //队列中仅保存最近的十个操作
        if(now!==preserve.length-1){
            while(preserve.length>now+1){
                preserve.pop();
            }
        }

        if(preserve.length<10){
            preserve.push(element);
        }else{
            preserve.shift();
            preserve.push(element);
        }
        now = preserve.length-1;
        for(var i=0; i<preserve.length;i++){
            console.log(preserve[i]);
        }
    }

    this.removeFromPos = function(index){ //返回某个操作后，又进行了新操作，删除过去的后续操作
        for(var i=0;i<10-index;i++){
            preserve.pop();
        }
    }

    this.getByIndex = function(index){
        return preserve[index];
    }

    this.length = function(){
        return preserve.length;
    }

}

var queue = new Queue();

function back_one_step(){


    if(now>0){
        console.log("now:"+now);
        now--;
        graphics = queue.getByIndex(now);

        drawGraphics();
    }
}

function forward_one_step(){
    if(now<queue.length()-1){
        now++;
        graphics = queue.getByIndex(now);
        drawGraphics();
    }
}




//添加图片
function addGraphic(x,y,path,w,h){
    var graphicpath = path;

    var graphic = new Graphic(x,y,graphicpath,w,h);
    //图片数组添加图片属性
    graphics.push(graphic);
    //操作数组添加当前操作

    var temp = [];
    for(var i=0; i<graphics.length;i++){
        var obj = JSON.parse(JSON.stringify(graphics[i]));
        temp.push(obj);
    }
    queue.push(temp);

    drawGraphics();
    console.log(graphics.length)
}
//重置
function clearCanvas(){
    graphics = [];

    //操作数组添加当前操作
    var temp = [];
    queue.push(temp);

    backimg = "";
    backcolor = "#ffffff";
    drawGraphics();
}

function drawGraphics(){
    //context.clearRect(0, 0, canvas.width, canvas.height);
    context.fillStyle = backcolor;
    context.fillRect(0,0,canvas.width, canvas.height);
    //console.log("draw start");

    if(backimg!=""){
        canvas.loadImage(backimg);
        context.drawImage(backimg,0,0,canvas.width,canvas.height);
    }

    for(var i = 0; i<graphics.length; i++){
        var graphic = graphics[i];

        //绘制图片
        context.drawImage(graphic.path,graphic.x,graphic.y,graphic.w,graphic.h);
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
        if(clickX-graphic.x>=0&&clickX-graphic.x<=graphic.w&&clickY-graphic.y>=0&&clickY-graphic.y<=graphic.h)
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
            //console.log(graphic.path)
            return;
        }
    }
}

function enlarge(){
    //console.log(graphics.length+"77777777777777777777777777777777777777")
    for(var i = graphics.length-1; i>=0;i--){
        console.log(graphics[i].isSelected)
        if(graphics[i].isSelected){

            if(graphics[i].scal<0.8){
                console.log("dadadadadadadadaaadadada")
                console.log(graphics[i].path)
                graphics[i].scal +=0.1;

                graphics[i].x =graphics[i].x-(0.1*graphics[i].width)*0.5;
                graphics[i].y =graphics[i].y-(graphics[i].height*0.1)*0.5;
                graphics[i].w =graphics[i].width*(1+graphics[i].scal);
                graphics[i].h =graphics[i].height*(1+graphics[i].scal);
                break;
            }
        }
    }
    //操作数组添加当前操作
    var temp = [];
    for(var i=0; i<graphics.length;i++){
        var obj = JSON.parse(JSON.stringify(graphics[i]));
        temp.push(obj);
    }
    queue.push(temp);
    drawGraphics();
}

function reduce(){
    for(var i = graphics.length-1; i>=0;i--){
        if(graphics[i].isSelected){

            if(graphics[i].scal>-0.5){
                console.log("dadadadadadadadaaadadada")
                console.log(graphics[i].path)
                graphics[i].scal -=0.1;

                graphics[i].x =graphics[i].x+(0.1*graphics[i].width)*0.5;
                graphics[i].y =graphics[i].y+(graphics[i].height*0.1)*0.5;
                graphics[i].w =graphics[i].width*(1+graphics[i].scal);
                graphics[i].h =graphics[i].height*(1+graphics[i].scal);
                break;
            }
        }
    }
    //操作数组添加当前操作
    var temp = [];
    for(var i=0; i<graphics.length;i++){
        var obj = JSON.parse(JSON.stringify(graphics[i]));
        temp.push(obj);
    }
    queue.push(temp);
    drawGraphics();
}

function resize(){
    for(var i = graphics.length-1; i>=0;i--){
        if(graphics[i].isSelected){
            graphics[i].scal=0;
            graphics[i].w = graphics[i].width;
            graphics[i].h = graphics[i].height;
        }
    }
    //操作数组添加当前操作
    var temp = [];
    for(var i=0; i<graphics.length;i++){
        var obj = JSON.parse(JSON.stringify(graphics[i]));
        temp.push(obj);
    }
    queue.push(temp);
    drawGraphics();
}

function background(color){
    backcolor = color;
    drawGraphics();
}

function back(img){
    backimg = img;
    drawGraphics();
}

var isDragging = false;

function stopDragging() {
    //操作数组添加当前操作
    var temp = [];
    for(var i=0; i<graphics.length;i++){
        var obj = JSON.parse(JSON.stringify(graphics[i]));
        temp.push(obj);
    }

    queue.push(temp);
    console.log(graphics[0].x);
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

































