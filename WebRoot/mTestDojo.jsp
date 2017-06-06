<!doctype html>
<html lang="en">
<%@ page contentType="text/html;charset=utf-8"%>
<head>
	<meta charset="UTF-8">
	<title>TestDojo</title>
	<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
	<link rel="stylesheet" href="style/jquery.mobile-1.4.5.min.css" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.mobile-1.4.5.min.js"></script>
	<style type="text/css">
		.logo
		{
			text-align:center;margin-top:1px;
			background: linear-gradient(greenyellow,white);
		}
		.ui-btn{font-size:13px;!important;}
		*{ margin: 0; padding: 0; text-decoration: none;}
		body { padding: 20px;}
		#container
		{
			width: 300px; height: 100px;overflow: hidden;
			position: relative;margin: 0 auto;
		}
		#list { width: 1800px; height: 100px; position: absolute; }
		#list img { float: left;}
		#buttons
		{
			position: absolute; height: 10px; width: 70px;
			z-index: 2; bottom: 2px; right:2px
		}
		#buttons span
		{
			cursor: pointer; float: left; border: 1px solid #fff;
			width: 10px; height: 8px;
			border-radius: 50%; background: #333; margin-right: 5px;
		}
		/*cursor: pointer;光标呈现为指示链接的指针（一只手）*/
		#buttons .on {  background: green;}
	</style>
	<script type="text/javascript">
		$(function () {
			var container = $('#container');
			var list = $('#list');
			var buttons = $('#buttons span');
			var index = 1;
			var len = 4;
			var interval = 3000;
			var timer;

			function animate (offset) {
				
				var left = parseInt(list.css('left')) + offset;
//				jQuery自定义动画animate(params,speed,callback);
//				(参数：  ①params：一个包含样式属性及值的映射，比如{property1 : "value1",property2 : "value2",........}；
//							提供一个以+= 或 -=开始的值，那么目标值就是以这个属性的当前值加上或者减去给定的数字来计算的
// 						 ②speed：速度参数，可选参数；
//						 ③callback：在动画完成时执行的函数，可选；
				offset = '+=' + offset;
				
				list.animate({'left': offset},1000, function () {
					if(left > -300){
						list.css('left', -300 * len);
					}
					if(left < (-300 * len)) {
						list.css('left', -300);
					}
				});
			}
//			siblings() 获得匹配集合中每个元素的同胞
			function showButton() {
				buttons.eq(index-1).addClass('on').siblings().removeClass('on');
			}
			function play() {
				timer = setTimeout(function () {
					//判断元素是否处于动画状态
					if (list.is(':animated')) {
						return;
					}
					if (index == 4) {
						index = 1;
					}
					else {
						index += 1;
					}
					animate(-300);
					showButton();
					play();
				}, interval);
			}
			function stop() {
				clearTimeout(timer);
			}
//			单击原点切换图片  buttons.each遍历
			buttons.each(function () {
//				绑定事件
				$(this).bind('click', function () {
					if (list.is(':animated') || $(this).attr('class')=='on') {
						return;
					}
					var myIndex = parseInt($(this).attr('index'));
					var offset = 300 * (myIndex - index);

					animate(offset);
					index = myIndex;
					showButton();
				})
			});
			container.hover(stop, play);
			play();
		});
	</script>
	<script type="text/javascript">
		//更换样式表，需要在页面加载的时候执行一次。
		//在浏览器尺寸变化的时候，也要执行。
		gaibian();	//一上来，就执行一次gaibian函数，保证页面默认情况就显示合理的样式表。
		window.onresize = gaibian;

		function gaibian(){
			var kuandu = document.documentElement.clientWidth; //浏览器的宽度
			if(kuandu>850)
			{
				window.open('index.jsp','_self');
			}
		}
	</script>
</head>
<body>
	<div data-role="page" id="sy">
		<div data-role="header">
			<div class="logo">
				<img src="images/mlogo.png">
			</div>
		</div>
		<div data-role="content">
			<div id="container">
				<div id="list" style="left: -300px;">
					<img src="images/m-img4.png" alt="1"/>
					<img src="images/m-img1.png" alt="1"/>
					<img src="images/m-img2.png" alt="2"/>
					<img src="images/m-img3.png" alt="3"/>
					<img src="images/m-img4.png" alt="4"/>
					<img src="images/m-img1.png" alt="4"/>
				</div>
				<div id="buttons">
					<span index="1" class="on"></span>
					<span index="2"></span>
					<span index="3"></span>
					<span index="4"></span>
				</div>
			</div>
			<ul data-role="listview" data-inset="true" data-filter="true">
				<li data-role="list-divider">等价类</li>
					<li><a href="findServlet?tableName=equivalence&title=等价类划分测试定义&answer=0" >定义</a></li>
					<li><a href="findServlet?tableName=equivalence&title=划分等价类&answer=0">划分等价类</a></li>
					<li><a href="findServlet?tableName=equivalence&title=划分等价类的标准&answer=0" >划分等价类的标准</a></li>
					<li><a href="findServlet?tableName=equivalence&title=划分等价类的方法、原则&answer=0" >划分等价类的方法、原则</a></li>
					<li><a href="findServlet?tableName=equivalence&title=设计测试用例&answer=0">设计测试用例</a></li>
					<li><a href="findServlet?tableName=equivalence&title=等价类的特点&answer=0" >等价类的特点</a></li>
				<li data-role="list-divider">边界值</li>
					<li><a href="findServlet?tableName=border&title=边界值测试定义&answer=0" >定义</a></li>
					<li><a href="findServlet?tableName=border&title=边界值测试与等价划分的区别&answer=0" >与等价划分的区别</a></li>
					<li><a href="findServlet?tableName=border&title=边界值分析方法的考虑&answer=0" >方法的考虑</a></li>
					<li><a href="findServlet?tableName=border&title=选择测试用例的原则&answer=0" >测试用例的原则</a></li>
				<li data-role="list-divider">因果图</li>
					<li><a href="findServlet?tableName=cause&title=因果图测试定义&answer=0">定义</a></li>
					<li><a href="findServlet?tableName=cause&title=因果图测试作用&answer=0">作用</a></li>
					<li><a href="study-yg-3.jsp" >基本步骤</a></li>
					<li><a href="study-yg-4.jsp" >基本符号</a></li>
			</ul>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="content">
				<div data-role="navbar">
					<ul>
						<li><a href="#sy" data-role="button">首页</a></li>
						<li><a href="#djl" data-role="button">等价类</a></li>
						<li><a href="#bjz" data-role="button">边界值</a></li>
						<li><a href="#ygt" data-role="button">因果图</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div data-role="page" id="djl">
		<div data-role="header">
			<div class="logo">
				<img src="images/mlogo.png">
			</div>
		</div>
		<div data-role="content">
			<h3 style="text-align:center"></h3>
			<p></p>
			<ul data-role="listview" data-inset="true" data-filter="true">
				<li data-role="list-divider">基础知识</li>
				<li><a onclick="djlc(0)">定义</a></li>
				<li><a onclick="djlc(1)">划分等价类</a></li>
				<li><a onclick="djlc(2)" >划分等价类的标准</a></li>
				<li><a href="findServlet?tableName=equivalence&title=划分等价类的方法、原则&answer=0" >划分等价类的方法、原则</a></li>
				<li><a href="findServlet?tableName=equivalence&title=设计测试用例&answer=0">设计测试用例</a></li>
				<li><a href="findServlet?tableName=equivalence&title=等价类的特点&answer=0" >等价类的特点</a></li>
				<li data-role="list-divider">实战演习</li>
				<li><a href="findServlet?tableName=equivalence&title=题目1&answer=题目1答案">题目1</a></li>
				<li><a href="findServlet?tableName=equivalence&title=题目2&answer=题目2答案">题目2</a></li>
				<li><a href="findServlet?tableName=equivalence&title=题目3&answer=题目3答案" >题目3</a></li>
				<li><a href="findServlet?tableName=equivalence&title=题目4&answer=题目4答案" >题目4</a></li>
			</ul>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="content">
				<div data-role="navbar">
					<ul>
						<li><a href="#sy" data-role="button">首页</a></li>
						<li><a href="#djl" data-role="button">等价类</a></li>
						<li><a href="#bjz" data-role="button">边界值</a></li>
						<li><a href="#ygt" data-role="button">因果图</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div data-role="page" id="bjz">
		<div data-role="header">
			<div class="logo">
				<img src="images/mlogo.png">
			</div>
		</div>
		<div data-role="content">
			<h3 style="txt-align:center"></h3>
			<p></p>
			<ul data-role="listview" data-inset="true" data-filter="true">
				<li data-role="list-divider">基础知识</li>
				<li><a onclick="djlc(1)" >定义</a></li>
				<li><a href="findServlet?tableName=border&title=边界值测试与等价划分的区别&answer=0" >与等价划分的区别</a></li>
				<li><a href="findServlet?tableName=border&title=边界值分析方法的考虑&answer=0" >方法的考虑</a></li>
				<li><a href="findServlet?tableName=border&title=选择测试用例的原则&answer=0" >测试用例的原则</a></li>
				<li data-role="list-divider">实战演习</li>
				<li><a href="findServlet?tableName=border&title=题目1&answer=题目1答案" >题目1</a></li>
				<li><a href="findServlet?tableName=border&title=题目2&answer=题目2答案" >题目2</a></li>
				<li><a href="findServlet?tableName=border&title=题目3&answer=题目3答案" >题目3</a></li>
				<li><a href="findServlet?tableName=border&title=题目4&answer=题目4答案" >题目4</a></li>
			</ul>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="content">
				<div data-role="navbar">
					<ul>
						<li><a href="#sy" data-role="button">首页</a></li>
						<li><a href="#djl" data-role="button">等价类</a></li>
						<li><a href="#bjz" data-role="button">边界值</a></li>
						<li><a href="#ygt" data-role="button">因果图</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div data-role="page" id="ygt">
		<div data-role="header">
			<div class="logo">
				<img src="images/mlogo.png">
			</div>
		</div>
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-filter="true">
				<li data-role="list-divider">基础知识</li>
				<li><a href="findServlet?tableName=cause&title=因果图测试定义&answer=0">定义</a></li>
				<li><a href="findServlet?tableName=cause&title=因果图测试作用&answer=0">作用</a></li>
				<li><a href="study-yg-3.jsp" >基本步骤</a></li>
				<li><a href="study-yg-4.jsp" >基本符号</a></li>
				<li data-role="list-divider">实战演习</li>
				<li><a href="exercise-yg-t1.html" >题目1</a></li>
				<li><a href="exercise-yg-t2.jsp" >题目2</a></li>
				<li><a href="exercise-yg-t3.jsp" >题目3</a></li>
				<li><a href="exercise-yg-t4.jsp" >题目4</a></li>
				<li><a href="exercise-yg-t5.jsp" >题目5</a></li>
			</ul>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="content">
				<div data-role="navbar">
					<ul>
						<li><a href="#sy" data-role="button">首页</a></li>
						<li><a href="#djl" data-role="button">等价类</a></li>
						<li><a href="#bjz" data-role="button">边界值</a></li>
						<li><a href="#ygt" data-role="button">因果图</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/mcontents.js"></script>
</body>
</html>