<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page  import="net.zmcheng.user.DbDriver" %> 
<%@page  import="net.zmcheng.user.UserManage" %> 

<%
   String  Name = new String(request.getParameter("t1").getBytes("ISO-8859-1"),"UTF-8");
   String Psw  = new String(request.getParameter("t2").getBytes("ISO-8859-1"),"UTF-8");
   UserManage  zan = new UserManage();
   boolean Flag=false;
   Flag= zan.Land(Name,Psw);
   if(Flag==true){
	   session.setAttribute("user", "Name");
 %>
<script type="text/javascript">
   alert("登陆成功")；
    window.location="index.html";
</script>
<%}
   else{
%>
<script type="text/javascript">
   alert("你的输入有误")；
    window.location="register.html";
</script>
<%} %>

