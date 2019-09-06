var context;
var draw;

var width;
var height;//平铺间隔

var flag = 0;

var kx;
var ky;
function setContext(_context, _draw){
    context = _context;
    draw = _draw;
}

function drawStar(X,Y,N,K,w,h){
    context.save();
    //console.log(w);
    context.translate(w,h);

    for(var i=0; i<N;i++){
        context.beginPath();
        context.moveTo(X,Y);
        context.lineTo(kx,ky);
        context.moveTo(X,Y);
        context.lineTo(kx,-ky);
        context.stroke();
        context.rotate(Math.PI*2/N);
    }
    context.restore();
}

function drawRosette(X,Y,N,G,K,w,h){
    context.save();
    context.translate(w,h);
    console.log(X+"************************");
    var ax = -Y/(Math.tan(G*Math.PI/N));


    for(var i=0; i<N;i++){
        context.beginPath();
        context.moveTo(ax,Y);
        context.lineTo(X,Y);
        context.lineTo(kx,ky);
        context.moveTo(ax,-Y);
        context.lineTo(X,-Y);
        context.lineTo(kx,-ky);
        context.stroke();
        context.rotate(Math.PI*2/N);
    }
    context.restore();
    //searchBorder(cx,cy,N);
}

function aidStar(X,Y,N,K){
        clearCanvas();

    var a1 = K*Math.PI/N;
    var a2 = (Math.PI - Math.PI*2/N)/2;

    var cx = X*Math.tan(a2)/(Math.tan(a2)-Math.tan(a1));
    var cy = cx*Math.tan(a1);
    kx = cx;
    ky = cy;
    searchBorder(cx,cy,N);
    var n = 3000/width;
    var m = 2000/height;

    for(var i=0; i< m;i++){
        for(var j=0;j<n;j++){
            drawStar(X,Y,N,K,(0.5+j)*width,(0.5+i)*height);
        }
     }
}


function aidRosette(X,Y,N,G,K){
        clearCanvas();

    var a1 = K*Math.PI/N;
    var a2 = (Math.PI - Math.PI*2/N)/2;
    var cx = (Y-X*Math.tan(a2))/(Math.tan(a1)-Math.tan(a2));
    var cy = (Math.tan(a2)*(cx-X)) + Y;

    kx = cx;
    ky = cy;
    searchBorder(cx,cy,N);
    var n = 3000/width;
    var m = 2000/height;

    for(var i=0; i< m;i++){
        for(var j=0;j<n;j++){
            drawRosette(X,Y,N,G,K,(0.5+j)*width,(0.5+i)*height);
        }
    }
    flag = 1;
}

function searchBorder(x,y,n){
    var xmax=x, xmin=x, ymin =y,ymax =y;
    for(var i=1; i<n;i++){
        var ax = x*Math.cos(-2*Math.PI/n)-y*Math.sin(2*Math.PI/n);
        var ay = x*Math.sin(2*Math.PI/n)+y*Math.cos(2*Math.PI/n);
        x = ax;
        y = ay;
        if(x>xmax) xmax = x;
        if(x<xmin) xmin = x;
        if(y>ymax) ymax = y;
        if(y<ymin) ymin = y;
    }
    width = xmax - xmin;
    height = ymax - ymin;
}

function clearCanvas(){
    console.log("input")
    context.clearRect(0,0,draw.width,draw.height);
}


















