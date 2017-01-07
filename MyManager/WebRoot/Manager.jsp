<%@ page language="java" import="java.util.*,bean.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="userbeancl" class="bean.Userbeancl" scope="page"></jsp:useBean>
<jsp:useBean id="userbean" class="bean.Userbean" scope="page"></jsp:useBean>
<jsp:useBean id="connn" class="bean.Conn" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<title>用户信息管理系统</title>
	<style type="text/css">
	h2,h1,section{
    
     text-align: center; 
      margin:0 auto; 
	}
	.m1{
		width: 50%;
		height: 50%;
		margin-left: 25%;

	}
	table{
     text-align: center; 
     margin:0 auto;
     
	}
	</style>
<script type="text/javascript">
function checkit(){
//js背背背啊啊啊啊啊 ！！！！！！！
  return window.confirm("您真的要删除吗？")
}
</script>

</head>

<img class="m1" src="img/TAFE.JPG" alt="bg">
<body bgcolor="#DDDDDD">

<h1>用户管理</h1>
<h2>欢迎：<%=session.getAttribute("uname") %></h2>


<%
ArrayList al =(ArrayList)request.getAttribute("re");
%>
<section>
<table>
<tr bgcolor="pink"><th>id</th><th>name</th><th>pass</th><th>E-mail</th><th>class</th><th>修改用户</th><th>删除用户</th></tr>
<% 
 //定义一个颜色数组
 String []color={"silver","pink"};
 Userbean ub;
 for(int i=0;i<al.size();i++){
     ub=(Userbean)al.get(i);
%>
<tr bgcolor="<%=color[i%2]%>"><td><%=ub.getId() %></td><td><%=ub.getName() %><td><%=ub.getPass() %></td><td><%=ub.getMail() %></td>
<td><%=ub.getGrade() %></td>
<td><a href=<%out.println("Alter.jsp?uid="+ub.getId()+"&upw="+ub.getPass()+"&umail="+
						ub.getMail()+"&ugrade="+ub.getGrade()+"&uname="+ub.getName());%>>修改用户</a></td>
						<td><a href=dealUserData?flag=delete&uid=<%=ub.getId()%> onclick="return checkit();">删除用户</a></td></tr>

<%
}
//从request当中取出pageCount,返回一个Object,转一下
int pageCount=Integer.parseInt(request.getAttribute("pageCount").toString());

//一共有几页
%>
</table>
<% 
int pageNow = Integer.parseInt(request.getAttribute("pageNow").toString());
if(pageNow!=1){ 
%>


<a href=dealUserData?flag=fengye&pageNow=1>首页</a>
<a href=dealUserData?flag=fengye&pageNow=<%=pageNow-1 %>>上一页</a>

<%
}
 %>
 <%
 
 for(int i=pageNow;i<pageNow+3;i++){
 
  %>
<a href=dealUserData?flag=fengye&pageNow=<%=i%>><%=i%></a>  
 
  <%
  
 
  }
  
   %>
   
 <%
if(pageNow!=pageCount){ 
%>
<a href=dealUserData?flag=fengye&pageNow=<%=pageNow+1 %> >下一页</a>
<a href=dealUserData?flag=fengye&pageNow=<%=pageCount%>>尾页</a><br>

<%
}

 %>
 <form action="dealUserData" method="post">
 <label><input type="text" size="3" pattern=[1-9]{1}{2} required name="pageNow"></label>
 <input type="hidden" value="fengye" name="flag">
 <label><input type="submit" value="Go"></label>
 </form>
 <p>您是第<%=application.getAttribute("Vtime") %>位访问者</p><br>
 <a href=MyMain.jsp >返回主菜单</a>
 </section>
</body>
</html>