<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page  import="net.zmcheng.user.DbDriver" %> 
<%@page  import="net.zmcheng.user.UserManage" %> 

<%
   String  Name = new String(request.getParameter("t3").getBytes("ISO-8859-1"),"UTF-8");
   String Psw  = new String(request.getParameter("t4").getBytes("ISO-8859-1"),"UTF-8");
   String  FName = new String(request.getParameter("t5").getBytes("ISO-8859-1"),"UTF-8");
   String Tel  = new String(request.getParameter("t6").getBytes("ISO-8859-1"),"UTF-8");
   UserManage  zan = new UserManage();
    zan.Zhuce(Name,Psw,FName,Tel);
    session.setAttribute("user", "Name");
 %>
<script type="text/javascript">
   alert("注册成功成功")；
    window.location="index.html";
</script>


    