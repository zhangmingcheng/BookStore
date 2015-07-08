<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.zmcheng.user.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page  import="net.zmcheng.user.DbDriver" %> 
<%@page  import="net.zmcheng.user.UserManage" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线图书商城登录注册页面</title>
    <style type="text/css">
        <!--
        *{
            margin: 0px;
            padding: 0px;
        }

        .top{
            width: 100%;
            margin: 0px;
            height: 200px;
            background-color: lightgreen;
            font-size: 15px;
            clear: both;
        }

        .top1{
            height: 16px;
            width: 100%;
            clear: both;
        }
        .top1_1{
            background-color: aliceblue;
            float:left;
            width:65px;
            height:100%;
            margin-left: 70%;
        }
        .top1_2{
            background-color: aliceblue;
            float:left;
            height:100%;
            width:35px;
            margin-left:5px;
        }
        .top1_3{
            background-color: aliceblue;
            float:left;
            height:100%;
            width:50px;
            margin-left:5px;
        }
        .topimg{
            width: 100%;
            height: 150px;
            clear: both;
            margin: 0px;
        }
        .topimg1{
            margin-left: 20%;
            padding-bottom: 90px;
        }
        .topimg2{
            margin-left: -13%;
            padding-bottom: 25px;
        }
        .topimg3{
            margin-left: 13%;
        }
        .top2{
            clear: both;
            width:100%;
            height:34px;
            background-color: limegreen;
        }

        .top3{
            width: 100%;
            height:10px;
            background-color: orange;
            clear: both;
        }
        .ul1{
            margin-left: 25%;
            list-style-type: none;
            padding-top: 10px;

        }
        .li1{
            display: inline;
            margin-left: 25px;
            font-size: 20px;
        }
        .bottom1{
            width:100%;
            height: 20px;
            background-color: limegreen;
        }
        .ul2{
            margin-left: 40%;
            list-style-type: none;
        }
        .li2{
            display: inline;
            margin-left: 25px;
            font-size: 10px;
        }
        .bottom2{
            margin-left:30%;
        }

        .body_{
            width: 70%;
            margin: 20px auto;
            height: 400px;
            clear: both;
            background-color: aquamarine;
        }
        h2{
            color: blue;
        }
        .helpimg{
            height:330px;
            width: 100%;
        }
        a:link,a:visited{
            font-weight: bold;
            text-decoration: none;
            color: powderblue;
        }
        a:hover,a:active{
            color: orange;
        }

        -->
    </style>
</head>

<div class = "top">
    <div class="top1">
        <div class="top1_1"><a href="#">帮助中心</a></div>
        <div class="top1_2"><a href="information.jsp">账号</a></div>
        <div class="top1_3">购物车</div>
    </div>
    <div class="topimg">
        <img src="images/h1.png" class="topimg1"/>
        <img src="images/decoration-1.png" class="topimg2"/>
        <img src="images/decoration-2.png" class="topimg3"/>
    </div>
    <div class="top2">
        <ul class="ul1">
            <li class="li1"><a href="index.html">网站首页</a></li>
            <li class="li1"><a href="#">图书介绍</a></li>
            <li class="li1"><a href="ContactUs.html">联系我们</a></li>
        </ul>
    </div>
    <div class="top3"></div>
</div>
<div class="body_">
 <h2>你的账户信息</h2>
 <br/>
    <%
    User user = (User)session.getAttribute("user");
    String temp_name=user.getName();
    UserManage  zan = new UserManage();
   User  temp_user= zan.getInformation(temp_name);
   int T1=temp_user.getId();
   String str [] = new String[4];
   str[0]=temp_user.getName();
   str[1]=temp_user.getPsw();
   str[2]=temp_user.getFname();
   str[3]=temp_user.getTel();
   %>
  <table border="1">
               <tr>
                    <td>编号：</td>
                    <td><%out.print(T1);%></td>
                </tr>
                <tr>
                    <td>登录名：</td>
               <td><%=out.print(str[0]) %></td>
                </tr>
                <tr></tr><tr></tr><tr></tr>
                <tr>
                    <td>密码：</td>
                    <td><%=out.print(str[1]) %></td>
                </tr>
                <tr></tr><tr></tr><tr></tr>
                <tr>
                    <td>姓名：</td>
                   <td><%=out.print(str[2])%></td>
                </tr>
                <tr></tr><tr></tr><tr></tr>
                <tr>
                    <td>联系电话：</td>
                    <td><%=out.print(str[3]) %></td>
                </tr>
               </table>
</div>
    <div class="bottom1">
        <ul class="ul2">
            <li class="li2"><a href="index.html">网站首页</a></li>
            <li class="li2"><a href="#">图书介绍</a></li>
            <li class="li2"><a href="ContactUs.html">联系我们</a></li>
        </ul>
    </div>
    <div class="bottom2">
        <p>版权属于前沿技术Copyright@2008|Private|Team of Use</p>
    </div>
</div>

</body>
</html>