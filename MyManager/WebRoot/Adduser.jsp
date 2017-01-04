<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Adduser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	
	.m1{
		width: 50%;
		height: 50%;
	}
		</style>

  </head>
 
  
  <body bgcolor="#DDDDDD"><center>
  <h1>添加新用户</h1>
  <img class="m1" src="img/TAFE.JPG" alt="bg">
  <form action="dealUserData" method="post">
  <hr>
   <label>用户名<input type="text" name="uname" required></label><br>
   <label>密码 &nbsp&nbsp&nbsp<input type="text" name="upasswd" required></label><br>
   <label>邮箱 &nbsp&nbsp&nbsp<input type="text" name="mail" required></label><br>
   <label>级别 &nbsp&nbsp&nbsp<input type="text" name="grade" value="5" readonly></label><br>
   <label><input type="hidden" name="flag" value="add"></label>
   <input type="submit" value="提交"><br>
   <hr>
   <a href=MyMain.jsp >返回主菜单</a>
   </form>
  </center></body>
</html>
