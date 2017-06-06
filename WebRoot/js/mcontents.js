
function djlc(i)
{	
	//$.get("content/content.txt",function(data){var s=eval(data);alert(s[1].name);});
	//$.get("content/content.txt",function(data){alert(data);});
	$.ajax(
		{
			type:"GET",
			url:"content/content.txt"+Math.randow(),
			success:function(data)
					{	
						var s=eval(data);						
						$("#djl h3").html(s[i].title);
						$("#djl p").html(s[i].content);
					}
		}
	  );
}
