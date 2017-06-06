var width=1500;//画布的宽
var height=300;//画布的高
var RADIUS=4;//圆的半径
var SRADIUS=1;//小圆的半径
var MARGIN_TOP=60;//第一个数字距离画布顶部距离
var MARGIN_LEFT=250;//第一个数字距离画布左部距离
//小球数组和小球颜色
var balls=[];
const colors = ["#33B5E5","#0099CC","#AA66CC","#9933CC","#99CC00","#669900","#FFBB33","#FF8800","#FF4444","#CC0000"];
//设置之前的时间和当前时间变量
var curTime = 0;
var previousTime=new Date();
var previousHours=previousTime.getHours();
var previousMinutes=previousTime.getMinutes();
var previousSeconds=previousTime.getSeconds();
window.onload=function()
{	
	//获得画布元素，定义画布上下文环境，定义画布大小
	var canvas=document.getElementById('canvas');
	var context=canvas.getContext("2d");
	
	canvas.width=width;
	canvas.height=height;
	//setInterval每过50毫秒执行一次function
	setInterval(function(){render(context)},50);

}

function render(cxt)
{	
	//绘制前先刷新
	cxt.clearRect(0,0,cxt.canvas.width,cxt.canvas.height);
	//获得当前时间
	var curTime=new Date();
	var curHours=curTime.getHours();
	var curMinutes=curTime.getMinutes();
	var curSeconds=curTime.getSeconds();

	//将时间拆分成一个个数字,并把数字的第一个格子的位置传给drawing绘制	
	//一个圆的直径为2*RADIUS  为每个圆左右两边多空出一点位置则为2*（RADIUS+1）
	//一行是7个格子一个圆占一个格子一个数字就是14*（RADIUS+1）冒号为8*（RADIUS+1）
	//每个数字之间多留1像素空位就是15*（RADIUS+1）冒号为9*（RADIUS+1）
	//传入小时十位数起始位置和要绘制的数字、context
	drawingB(MARGIN_LEFT,MARGIN_TOP,parseInt(curHours/10),cxt);
	//传入小时个位数起始位置和要绘制的数字、context
    drawingB(MARGIN_LEFT+15*(RADIUS+1),MARGIN_TOP,parseInt(curHours%10),cxt);   	    
	//冒号的digit下标为10
	drawingB(MARGIN_LEFT+30*(RADIUS+1),MARGIN_TOP,10,cxt);
	
	drawingB(MARGIN_LEFT+39*(RADIUS+1),MARGIN_TOP,parseInt(curMinutes/10),cxt);
	drawingB(MARGIN_LEFT+54*(RADIUS+1),MARGIN_TOP,parseInt(curMinutes%10),cxt);
	drawingB(MARGIN_LEFT+69*(RADIUS+1),MARGIN_TOP,10,cxt);
	
	drawingB(MARGIN_LEFT+78*(RADIUS+1),MARGIN_TOP,parseInt(curSeconds/10),cxt);
	drawingB(MARGIN_LEFT+93*(RADIUS+1),MARGIN_TOP,parseInt(curSeconds%10),cxt);
	
	//绘制日期
	var year=curTime.getFullYear();
	drawingS(MARGIN_LEFT+300*(SRADIUS+1),MARGIN_TOP+57,parseInt(year/1000),cxt);
	drawingS(MARGIN_LEFT+315*(SRADIUS+1),MARGIN_TOP+57,parseInt((year/100)%10),cxt);
	drawingS(MARGIN_LEFT+330*(SRADIUS+1),MARGIN_TOP+57,parseInt((year/10)%100),cxt);
	drawingS(MARGIN_LEFT+345*(SRADIUS+1),MARGIN_TOP+57,parseInt(year%10),cxt);

	//.号的digit下标为11
	drawingS(MARGIN_LEFT+360*(SRADIUS+1),MARGIN_TOP+57,11,cxt);
	
	var month=previousTime.getMonth()+1;
	drawingS(MARGIN_LEFT+369*(SRADIUS+1),MARGIN_TOP+57,parseInt(month/10),cxt);
	drawingS(MARGIN_LEFT+384*(SRADIUS+1),MARGIN_TOP+57,parseInt(month%10),cxt);
	
	drawingS(MARGIN_LEFT+399*(SRADIUS+1),MARGIN_TOP+57,11,cxt);
	var date=previousTime.getDate();
	drawingS(MARGIN_LEFT+408*(SRADIUS+1),MARGIN_TOP+57,parseInt(date/10),cxt);
	drawingS(MARGIN_LEFT+423*(SRADIUS+1),MARGIN_TOP+57,parseInt(date%10),cxt);

	//判断是否数字有变动，有变动则在原先的数字上加小球
	if(curSeconds!=previousSeconds)
	{
		if( parseInt(curHours/10) != parseInt(previousHours/10) ){
            addBalls( MARGIN_LEFT + 0 , MARGIN_TOP , parseInt(curHours/10) );
        }
        if( parseInt(curHours%10) != parseInt(previousHours%10) ){
            addBalls( MARGIN_LEFT + 15*(RADIUS+1) , MARGIN_TOP , parseInt(curHours/10) );
        }

        if( parseInt(curMinutes/10) != parseInt(previousMinutes/10) ){
            addBalls( MARGIN_LEFT + 39*(RADIUS+1) , MARGIN_TOP , parseInt(curMinutes/10) );
        }
        if( parseInt(curMinutes%10) != parseInt(previousMinutes%10) ){
            addBalls( MARGIN_LEFT + 54*(RADIUS+1) , MARGIN_TOP , parseInt(curMinutes%10) );
        }

        if( parseInt(curSeconds/10) != parseInt(previousSeconds/10) ){
            addBalls( MARGIN_LEFT + 78*(RADIUS+1) , MARGIN_TOP , parseInt(curSeconds/10) );
        }
        if( parseInt(curSeconds%10) != parseInt(previousSeconds%10) ){
            addBalls( MARGIN_LEFT + 93*(RADIUS+1) , MARGIN_TOP , parseInt(curSeconds%10) );
        }
		//将当前时间赋值给之前时间
		previousHours=curHours;
		previousMinutes=curMinutes;
		previousSeconds=curSeconds;
	}	
	//更新小球数组
 	updateBalls();
	//画出小球
	for( var i = 0 ; i < balls.length ; i ++ )
	{	//小球颜色
        cxt.fillStyle=balls[i].color;
		//绘制路径开始
        cxt.beginPath();
		//绘制圆context.arc(centerx,centery,radius,startingAngle,endingAngle,anticlockwise);逆时针绘制
        cxt.arc( balls[i].x , balls[i].y , RADIUS , 0 , 2*Math.PI , true );
		//绘制路径结束
        cxt.closePath();
		//填充小球颜色
        cxt.fill();
    }
}
//定义数字上的彩色动态小球
function addBalls( x , y , num )
{	//在点阵上I为行，J为列，在digit[num][i][j]上为1则定义彩色动态小球
    for( var i = 0  ; i < digit[num].length ; i ++ )
        for( var j = 0  ; j < digit[num][i].length ; j ++ )
            if( digit[num][i][j] == 1 )
			{
                var aBall = {
                    x:x+j*2*(RADIUS+1)+(RADIUS+1),
                    y:y+i*2*(RADIUS+1)+(RADIUS+1),
					//小球的加速度为0.5+（0~1）
                    g:0.5+Math.random(),
					//小球在X轴上的速度为-1的（0~1000）次方*4 则是-4或者+4
                    vx:Math.pow( -1 , Math.ceil( Math.random()*1000 ) ) * 4,
					//小球在Y轴上的速度 负数会有一个上抛的效果
                    vy:-2,
					//小球的颜色为colors数组中0~colors.length-1的随机色
                    color: colors[ Math.floor( Math.random()*colors.length ) ]
                }
				//将小球放入balls数组里
                balls.push(aBall);
            }
			
}
//存在的彩色小球运动变化
function updateBalls()
{
    for( var i = 0 ; i < balls.length ; i ++ )
	{	
		//加速度后X Y轴的位子
        balls[i].x += balls[i].vx;
        balls[i].y += balls[i].vy;
		//Y轴的速度受重力影响
        balls[i].vy += balls[i].g;
		//碰撞检测
        if( balls[i].y >= height-RADIUS ){
            balls[i].y =height-RADIUS;
			//当小球碰到底部使它弹跳起来，并加一个摩擦系数
            balls[i].vy = - balls[i].vy*0.75;
        }
    }
	//计算还有多少个彩色动态小球在屏幕内
    var cnt = 0
	//彩色动态小球在屏幕内则把彩色动态小球放入balls数组 否则不放入
    for( var i = 0 ; i < balls.length ; i ++ )
        if( balls[i].x + RADIUS > 0 && balls[i].x -RADIUS < width )
            balls[cnt++] = balls[i]
	//数组原先长度大于在屏幕内的彩色动态小球数量，则释放内存
    while( balls.length > cnt ){
        balls.pop();
    }
	
}
//绘制一个大数字
function drawingB(x,y,num,cxt)
{	
	//填充颜色
	cxt.fillStyle="#66CCFF";	
	//在点阵上I为行，J为列，在digit[num][i][j]上为1则绘制一个球
	for(var i=0;i<digit[num].length;i++)
		for(var j=0;j<digit[num][i].length;j++)
			if(digit[num][i][j]==1)
			{
				//绘制路径开始
				cxt.beginPath();
//绘制圆context.arc(centerx,centery,radius,startingAngle,endingAngle,[anticlockwise=false]);默认第五个参数为false为顺时针
				cxt.arc(x+j*2*(RADIUS+1)+(RADIUS+1),y+i*2*(RADIUS+1)+(RADIUS+1),RADIUS,0,2*Math.PI);
				//绘制路径结束
				cxt.closePath();	
				//填充
				cxt.fill();			
			}
}
//绘制一个小数字
function drawingS(x,y,num,cxt)
{	
	//填充颜色
	cxt.fillStyle="#66CCFF";	
	//在点阵上I为行，J为列，在digit[num][i][j]上为1则绘制一个球
	for(var i=0;i<digit[num].length;i++)
		for(var j=0;j<digit[num][i].length;j++)
			if(digit[num][i][j]==1)
			{
				//绘制路径开始
				cxt.beginPath();
//绘制圆context.arc(centerx,centery,radius,startingAngle,endingAngle,[anticlockwise=false]);默认第五个参数为false为顺时针
				cxt.arc(x+j*2*(SRADIUS+1)+(SRADIUS+1),y+i*2*(SRADIUS+1)+(SRADIUS+1),SRADIUS,0,2*Math.PI);
				//绘制路径结束
				cxt.closePath();	
				//填充
				cxt.fill();			
			}
}
