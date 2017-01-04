<%@ page language="java" import="java.util.*,bean.Userbean"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="userbeancl" class="bean.Userbeancl" scope="page"></jsp:useBean>
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
		<script type="text/javascript">
  
   
  </script>
 <%

 %>
  </head>
  
  <body bgcolor="#DDDDDD"><center>
  <h1>用户查询</h1>
  <img class="m1" src="img/TAFE.JPG" alt="bg">
  <hr>
 <form name="form1" action="dealUserData">
     <label>精确查询<input type="radio" name="s" value="1" checked="checked"></label>
     <label>模糊查询<input type="radio" name="s" value="2"></label><br>
     <label>请输入用户名<input type="text" name="uname"></label>
     <label><input type="hidden" name="flag" value="search"></label>
     <input type="submit" value="搜索">
 </form>
  <hr>  
  <%
    ArrayList al = (ArrayList)request.getAttribute("al");
    Object flag  = request.getAttribute("flag"); 
     if(flag!=null){
        if(al.isEmpty()){
       out.print("很遗憾，没有查找到结果<br>");
       out.print("<a href=MyMain.jsp >返回主菜单</a>");
       return;
       }else{
     
   %>
  <h1>查询结果</h1>
  <hr>
  <table border="1">
  <tr><th>id</th><th>name</th><th>pass</th><th>E-mail</th><th>class</th><tr>
  <% 
   
   for(int i=0;i<al.size();i++){
    
    Userbean ub  = (Userbean) al.get(i);
   
    
   
  %>
  <tr><td><%=ub.getId() %></td>
      <td><%=ub.getName() %></td>
      <td><%=ub.getPass() %></td>
      <td><%=ub.getMail() %></td>
      <td><%=ub.getGrade() %></td></tr>
   <%
 }
 }
 
 }
 
  %>
 </table>
  <a href=MyMain.jsp >返回主菜单</a>
  </center></body>
</html>

 