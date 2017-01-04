<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>用户信息管理系统</title>
	<style type="text/css">
	.s{
        background-color: transparent;
        border: 2px solid; 
        border-radius:3px;
        width: 50%;
        height: 50%;
        padding: 5%;
        margin-top: -250px;

		}
	.m1{
		width: 90%;
		height: 90%;


	}
	.un,h2{
	   
		color: white;
		font-size: 120%;

	}
	.un1{
        color: white;
 	}


	</style>
<%
String uname = null;
String upasswd =null;
Cookie ck[] =request.getCookies();
 if(ck!=null){
	    for(int i=0;i<ck.length;i++){
	        if (URLDecoder.decode(ck[i].getName(),"utf-8").equals("uname")){
	        
	         uname = ck[i].getValue();
	         System.out.print(uname);
	    }
	  }
	  }
if(ck!=null){
	    for(int i=0;i<ck.length;i++){
	        if (ck[i].getName().equals("upasswd")){
	         upasswd = ck[i].getValue();
	    }
	  }
	  }
	  String err = request.getParameter("err");
	  if(err!=null){
	    if(err.equals("1")){
	    out.print("<h2><center>请先登入</center><h2>");
	  }
	  }
 %>

</head>
<body bgcolor="black"><center>
<img class="m1" src="img/bg.jpg" alt="bg">
<section class="s">
<form action="logincl">
<label class="un">用户名<input type="text" name="uname" value="<%if(uname!=null)out.print(uname);%>" required></label><br>
<label class="un">&nbsp密码<input type="password" name="upasswd"value="<%if(uname!=null)out.print(upasswd);%>" required></label><br>
<label class="un1" >保存用户名和密码<input type="checkbox" name="flag"></label>
<label><input type="submit" value="登入"></label>
</form>
</section>
</center></body>
</html>

