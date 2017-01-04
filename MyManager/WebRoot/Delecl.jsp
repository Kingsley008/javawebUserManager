<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="connn" class="bean.Conn" scope="page"></jsp:useBean>
<jsp:useBean id="ubc" class="bean.Userbeancl" scope="page"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Delecl.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<%
	//MVC修改：换成servlet处理删除
	 String uid = request.getParameter("uid");
	
	 if(ubc.deleteit(Integer.parseInt(uid))){
	  response.sendRedirect("Ok.jsp");
	 }else{
	  response.sendRedirect("Error.jsp");
	 }
	 
	%>

  </head>
  
  <body>
   
  </body>
</html>
