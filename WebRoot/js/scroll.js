 	var area = document.getElementById('study-area');
 	var con1 = document.getElementById('content-study1');
 	var con2 = document.getElementById('content-study2');
 	var speed = 50;
 	area.scrollTop = 0;
 	con2.innerHTML = con1.innerHTML;
 	function scrollUp()
	{
		 if(area.scrollTop >= con1.offsetHeight) 
		 {	
			area.scrollTop = 0;//当1的内容滚动完后复位，2的内容还没有滚动完会继续滚动。
		 }else{
		   area.scrollTop ++; 
		 } 
		console.log(area.scrollTop+"+"+scrollHeight);
	}
	var myScroll = setInterval("scrollUp()",speed);
	area.onmouseover = function()
	{
	 	clearInterval(myScroll);
	}
	area.onmouseout = function()
	{
		 myScroll = setInterval("scrollUp()",speed);
	}

