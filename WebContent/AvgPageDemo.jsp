<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.zmcheng.user.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page  import="net.zmcheng.user.DbDriver" %> 
<%@page  import="net.zmcheng.user.UserManage" %> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>hello</title>
	</head>
	<body>
	<table border="1"  spacing="2" >
<%!  int pageSize=4;
 int pageCount;
 int showPage;
 %>
<%
			//一页放5个
			String user = null;
			String pass = null;
			try{
				Connection con = new DbDriver().getConnection();
				String sql = "SELECT * FROM member";
				Statement  stat = con.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
				ResultSet rs = stat.executeQuery(sql);
				rs.last();
				int size = rs.getRow();
				//计算分页后的总数
		     pageCount=(size%pageSize==0)?(size/pageSize):(size/pageSize+1);
		
		  //获取用户想要显示的页数：
		  String integer=request.getParameter("showPage");
		  if(integer==null){
		   integer="1";
		  }
		  try{showPage=Integer.parseInt(integer);
		  }catch(NumberFormatException e){
		   showPage=1;
		  }
		  if(showPage<=1){
		   showPage=1;
		  }
		  if(showPage>=pageCount){
		   showPage=pageCount;
		  }
		
		  //如果要显示第showPage页，那么游标应该移动到的position的值是：
		  int position=(showPage-1)*pageSize+1;
		  //设置游标的位置
		  rs.absolute(position);
		  //用for循环显示本页中应显示的的记录
		  for(int i=1;i<=pageSize;i++){  
		 %>
		   <table>
		    <tr>
		     <th><%=rs.getString("User_id") %></th>
		     <td>发表于：<%=rs.getString("User_name") %></td>
		    </tr>
		    
		   </table>
		
		 <%  
		   rs.next();
		  } 
		  rs.close();
		  con.close();
		  }
		  catch(Exception e){
		  e.printStackTrace();}
		 %>
		 <br>
		 第<%=showPage %>页（共<%=pageCount %>页）
		 <br>
		 <a href="AvgPageDemo.jsp?showPage=1">首页</a>
		 <a href="AvgPageDemo.jsp?showPage=<%=showPage-1%>">上一页</a>
		<% //根据pageCount的值显示每一页的数字并附加上相应的超链接
		  for(int i=1;i<=pageCount;i++){
		 %>
		   <a href="AvgPageDemo.jsp?showPage=<%=i%>"><%=i%></a>
		<% }
		 %> 
		 <a href="AvgPageDemo.jsp?showPage=<%=showPage+1%>">下一页</a>
		 <a href="AvgPageDemo.jsp?showPage=<%=pageCount%>">末页</a>
		 <!-- 通过表单提交用户想要显示的页数 -->
		 <form action="" method="get">
		  跳转到第<input type="text" name="showPage" size="4">页
		  <input type="submit" name="submit" value="跳转">
		 </form> 