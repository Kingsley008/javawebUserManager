<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Alter.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	
	.m1{
		width: 50%;
		height: 50%;
	}
		</style>
 <%
    Userbean ub = (Userbean) request.getAttribute("uinfo");
    int uid =  ub.getId();
    String uname = ub.getName();
    uname =Tools.getNewString(uname);
    String upw = ub.getPass();
    String umail = ub.getMail();
    int grade = ub.getGrade();
   %>
 
  </head>
 
  
  <body bgcolor="#DDDDDD"><center>
  <h1>修改用户资料</h1>
  <img class="m1" src="img/TAFE.JPG" alt="bg">
  <hr>
   <form action="dealUserData" method="post">
  <label>id&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="uid" value="<%=uid %>" readonly></label><br>
  <label>name&nbsp&nbsp<input type="text" value="<%=uname%>" name="uname" readonly></label><br>
  <label>pass&nbsp&nbsp&nbsp&nbsp<input type="text" value="<%=upw %>"name="upw"></label><br>
  <label>E-mail<input type="text" value="<%=umail%>"name="umail"></label><br>
  <label>Grade&nbsp&nbsp<input type="text" value="<%=grade%>"name="ugrade" readonly></label><br>
  <label><input type="hidden" name="flag" value="alter"></label><br>
   <input type="submit" value="修改"><br>
   <hr>
   <a href=MyMain2.jsp >返回主菜单</a>
   </form>
  </center></body>
