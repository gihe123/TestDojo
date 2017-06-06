package Servlets;

import javax.servlet.*; 
import javax.servlet.http.*;
import java.io.*; 
import java.util.*;
import JavaBeans.*;

public class findServlet extends HttpServlet 
{

public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws IOException,ServletException 
	{
		String tableName=request.getParameter("tableName");  
		tableName =  new String(tableName.getBytes("ISO8859-1"), "UTF-8");  		
		request.setAttribute("tableName", tableName);
		
		String answer=request.getParameter("answer");  
		answer =  new String(answer.getBytes("ISO8859-1"), "UTF-8");  
		request.setAttribute("answer", answer);
		
		String title=request.getParameter("title");  
		title =  new String(title.getBytes("ISO8859-1"), "UTF-8");  
		request.setAttribute("title", title);
		findBean find=new findBean();
		try{
			//调用业务方法获得内容
			ArrayList contentlist=find.find(tableName,title);
			ContentBean cntnt=new ContentBean();
			cntnt=(ContentBean) contentlist.get(0);
			String content=cntnt.getContent();
			request.setAttribute("content", content);
			//转向显示界面
			if(answer.equals("0"))
			{
				RequestDispatcher rd=request.getRequestDispatcher("study.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("exercise.jsp");
				rd.forward(request, response);
			}
			
		}
		catch(Exception e)
		{
			//设置文档类型
			response.setContentType("text/html;charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println(e.toString());
		}
	 }
public void doPost(HttpServletRequest request, HttpServletResponse response)  
		throws ServletException, IOException 
		{   
			doGet(request, response); 
		}
}