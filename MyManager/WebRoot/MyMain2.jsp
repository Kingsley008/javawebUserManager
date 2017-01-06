<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>用户信息管理系统</title>
	<style type="text/css">
	h1,h2{
     color: #DDDDDD;
	}
	.m1{
		width: 70%;
		height: 50%;
		margin-left: 2%;

	}
	section{
     margin-left: 80%;
     margin-top:-40% ;
	}
	</style>
	
<%
   Object obj=session.getAttribute("uname");
   if(obj==null){
   response.sendRedirect("Login.jsp?err=1");
   }
 %>

</head>
<img class="m1" src="img/bg.jpg" alt="bg">
<body bgcolor="black">
<section>
<h1>主界面</h1>
<header>
<a href="dealUserData?flag=uinfo&uname=<%=obj.toString()%>"><h2>我的帐号</h2></a>
<a href="Quit.jsp"><h2>安全退出</h2></a>
</header>
</section>
</body>
</html>