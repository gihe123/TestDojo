package JavaBeans;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;

public class findBean
{
	public ArrayList find(String tableName,String title) throws UnsupportedEncodingException
{
	ArrayList contentlist=new ArrayList();
	//连接对象
	Connection con=null;
	//语句对象
	Statement stmt=null;
	//结果集对象
	ResultSet rs=null;
	//查询语句
	String sql="SELECT content FROM "+tableName+" WHERE title='"+title+"'";
	//连接数据库的URL
	String url="jdbc:mysql://127.0.0.1:3306/testdojo";
	//数据库用户名和密码
	String dbuser="root";
	String dbpass="123456";
	try
	{
		//加载驱动程序，参数是驱动程序的名字
		Class.forName("com.mysql.jdbc.Driver");
		//建立连接
		con=DriverManager.getConnection(url,dbuser,dbpass);
		//创建语句对象
		stmt=con.createStatement();
		//执行SQL语句，返回结果集
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			//获取结果集中的信息
			String tmpContent=rs.getString(1);
			//tmpContent=new String(tmpContent.getBytes("8859_1"));
			//创建内容对象
			ContentBean cont=new ContentBean();
			cont.setContent(tmpContent);
			
			contentlist.add(cont);
		}
	}
	catch(Exception e)
	{
	}
	finally
	{
		try{rs.close();}catch(Exception e){}
		try{stmt.close();}catch(Exception e){}
		try{con.close();}catch(Exception e){}
	}
	return contentlist;
}
}
