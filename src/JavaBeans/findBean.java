package JavaBeans;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;

public class findBean
{
	public ArrayList find(String tableName,String title) throws UnsupportedEncodingException
{
	ArrayList contentlist=new ArrayList();
	//���Ӷ���
	Connection con=null;
	//������
	Statement stmt=null;
	//���������
	ResultSet rs=null;
	//��ѯ���
	String sql="SELECT content FROM "+tableName+" WHERE title='"+title+"'";
	//�������ݿ��URL
	String url="jdbc:mysql://127.0.0.1:3306/testdojo";
	//���ݿ��û���������
	String dbuser="root";
	String dbpass="123456";
	try
	{
		//�����������򣬲������������������
		Class.forName("com.mysql.jdbc.Driver");
		//��������
		con=DriverManager.getConnection(url,dbuser,dbpass);
		//����������
		stmt=con.createStatement();
		//ִ��SQL��䣬���ؽ����
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			//��ȡ������е���Ϣ
			String tmpContent=rs.getString(1);
			//tmpContent=new String(tmpContent.getBytes("8859_1"));
			//�������ݶ���
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
