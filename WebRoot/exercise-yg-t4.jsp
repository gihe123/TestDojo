﻿<!doctype html>
<meta charset="utf-8">
<html lang="zh-CN">
<%@ page contentType="text/html;charset=utf-8"%>
<head>
	<title>测试训练者TestDojo</title>
	<link type="text/css" rel="stylesheet" href="style/public.css"/>
	<link type="text/css" rel="stylesheet" href="style/head.css" />
	<link type="text/css" rel="stylesheet" href="style/content.css"/>
	<link type="text/css" rel="stylesheet" href="style/foot.css"/>
</head>
<body>
<div class="head">
	<div class="head-top">
		<div class="head-w1000">
			<img class="top-star" src="images/top-star.png" alt="收藏" title="收藏"/>
			<a href= "javascript:window.external.AddFavorite
			('file:///../测试训练者TestDojo/index.html','测试训练者TestDojo')" class="a-font-black">
				加入收藏</a>
		</div>
	</div>
	<div class="head-logo w1000">
	<h1 class="welcome"><img class="logo" src="images/top-logo.png" alt="logo" title="logo"/>
		欢迎来到测试训练者TestDojo</h1>
	</div>
	<ul class="nav w1000">
		<li><a href="index.jsp" >首页</a></li>
		<li><a href="#"  >等价类划分测试</a>
			<ul class="nav-first-ul">
				<li><a href="#" >基础知识</a>
					<ul  class="nav-second-ul">
						<li><a href="findServlet?tableName=equivalence&title=等价类划分测试定义&answer=0" >定义</a></li>
						<li><a href="findServlet?tableName=equivalence&title=划分等价类&answer=0">划分等价类</a></li>
						<li><a href="findServlet?tableName=equivalence&title=划分等价类的标准&answer=0" >划分等价类的标准</a></li>
						<li><a href="findServlet?tableName=equivalence&title=划分等价类的方法、原则&answer=0" >划分等价类的方法、原则</a></li>
						<li><a href="findServlet?tableName=equivalence&title=设计测试用例&answer=0">设计测试用例</a></li>
						<li><a href="findServlet?tableName=equivalence&title=等价类的特点&answer=0" >等价类的特点</a></li>
					</ul>
				</li>
				<li><a href="#" >实战演习</a>
					<ul class="nav-second-ul">
						<li><a href="findServlet?tableName=equivalence&title=题目1&answer=题目1答案">题目1</a></li>
						<li><a href="findServlet?tableName=equivalence&title=题目2&answer=题目2答案">题目2</a></li>
						<li><a href="findServlet?tableName=equivalence&title=题目3&answer=题目3答案" >题目3</a></li>
						<li><a href="findServlet?tableName=equivalence&title=题目4&answer=题目4答案" >题目4</a></li>
					</ul>
				</li>
			</ul>
		</li><!--等价类划分测试结束-->
		<li><a href="#"  >边界值测试</a>
			<ul class="nav-first-ul">
				<li><a href="#" >基础知识</a>
					<ul class="nav-second-ul">
						<li><a href="findServlet?tableName=border&title=边界值测试定义&answer=0" >定义</a></li>
						<li><a href="findServlet?tableName=border&title=边界值测试与等价划分的区别&answer=0" >与等价划</br>分的区别</a></li>
						<li><a href="findServlet?tableName=border&title=边界值分析方法的考虑&answer=0" >方法的考虑</a></li>
						<li><a href="findServlet?tableName=border&title=选择测试用例的原则&answer=0" >测试用</br>例的原则</a></li>
					</ul>
				</li>
				<li><a href="#" >实战演习</a>
					<ul class="nav-second-ul">
						<li><a href="findServlet?tableName=border&title=题目1&answer=题目1答案" >题目1</a></li>
						<li><a href="findServlet?tableName=border&title=题目2&answer=题目2答案" >题目2</a></li>
						<li><a href="findServlet?tableName=border&title=题目3&answer=题目3答案" >题目3</a></li>
						<li><a href="findServlet?tableName=border&title=题目4&answer=题目4答案" >题目4</a></li>

					</ul>
				</li>
			</ul>
		</li><!--边界值测试结束-->
		<li><a href="#">因果图测试</a>
			<ul  class="nav-first-ul">
				<li><a href="#">基础知识</a>
					<ul class="nav-second-ul">
						<li><a href="findServlet?tableName=cause&title=因果图测试定义&answer=0">定义</a></li>
						<li><a href="findServlet?tableName=cause&title=因果图测试作用&answer=0">作用</a></li>
						<li><a href="study-yg-3.jsp" >基本步骤</a></li>
						<li><a href="study-yg-4.jsp" >基本符号</a></li>
					</ul>
				</li>
				<li><a href="#">实战演习</a>
					<ul class="nav-second-ul">
						<li><a href="exercise-yg-t1.html" >题目1</a></li>
						<li><a href="exercise-yg-t2.jsp" >题目2</a></li>
						<li><a href="exercise-yg-t3.jsp" >题目3</a></li>
						<li><a href="exercise-yg-t4.jsp" >题目4</a></li>
						<li><a href="exercise-yg-t5.jsp" >题目5</a></li>
					</ul>
				</li>
			</ul>
		</li><!--因果图测试结束-->
	</ul>
</div>
<main class="w1000">
	<div class="con">
	<h2 class="main-title">题目4</h2>
	<p class="main-content">
		<br>
		有一个处理单价为5角钱的饮料的自动售货机软件测试用例的设计。其规格说明如下：<br>
		若投入5角钱或1元钱的硬币，押下〖橙汁〗或〖啤酒〗的按钮，则相应的饮料就送出来。<br>
		若售货机没有零钱找，则一个显示〖零钱找完〗的红灯亮，这时在投入1元硬币并押下按钮后，饮料不送出来而且1元硬币也退出来；
		若有零钱找，则显示〖零钱找完〗的红灯灭，在送出饮料的同时退还5角硬币。
	</p>
	<a class="answer" href="exercise-yg-a4.jsp">参考答案</a>
	</div>
</main>
<div class="foot">
	<div class="blogroll">
		<span>友情链接：</span>
		<figure>
			<a href="http://www.ltesting.net/">
				<img src="images/lcgj.png"/>
				<figcaption><p>领测国际</p></figcaption></a>
		</figure>
		<figure>
			<a href="http://www.51testing.com/html/index.html">
				<img src="images/51test.png" />
				<figcaption><p>51testing</p></figcaption></a>
		</figure>
		<figure>
			<a href="http://www.zhaopin.com/">
				<img src="images/zlzp.png" />
				<figcaption><p>智联招聘</p></figcaption></a>
		</figure>
		<figure>
			<a href="http://fz.58.com/">
				<img src="images/58tc.png"/>
				<figcaption><p>58同城</p></figcaption></a>
		</figure>
		<figure>
			<a href="http://www.hxrc.com/">
				<img src="images/hxrc.png" />
				<figcaption><p>中国海峡人才网</p></figcaption></a>
		</figure>
	</div>
	<div class="linkman">
		<span class="linkman1">
			<span class="owner">版权所有：</span><span>李晓凤</span>
		</span>
		<span class="linkman2">
			<span class="qq">QQ:</span><span>401551973</span>
		</span>
		<span class="linkman3">
			<span class="tel">联系电话:</span><span>18050408133</span>
		</span>
	</div>
</div>
<script src="js/digit.js"></script>
<script src="js/time.js"></script>
<script type="text/javascript" src="js/myfocus-2.0.1.min.js"></script>
<script type="text/javascript">
	myFocus.set({
		id:'myFocus',
		pattern:'mF_pconline'//风格
	});
</script>
</body>
</html>
