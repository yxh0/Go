<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>博客页面</title>
<link rel="stylesheet" href="css/init.css">
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="css/blog_post.css">
</head>
<body>
	<div class="header w">
		<div class="logo">
			<img src="images/logo.jpg" alt="" />
		</div>
		<div class="login">
			<ul>
				<li>				
					<%
						String flag = "";
						flag = (String)session.getAttribute("flag");
					%>						
  					<% if (flag =="0" || flag==null){%>
					    <a href="login.jsp">登录</a>
						<a href="register.jsp">注册</a>
						<br><a href="guanliyuandenglu.jsp">管理员登录</a>	
						<%} %>
					<% if (flag =="1" ){%>
  					<%  String username=(String)session.getAttribute("username");%>
					您好，<%=username %>
					<br><a href="tuichu.jsp">退出</a>				
					<%}%>	
				</li>
			</ul>
		</div>
	</div>
	<!-- 导航栏 -->
	<div class="nav w">
		<div class="container">
			<ul class="left">
		    	<li><a href="index.jsp" >首页</a></li>
		    	<li><a href="blog.jsp" >博客</a></li>
		    	<li><a href="luntan.jsp" >论坛</a></li>
		    	<li><a href="qishi.jsp" >棋事</a></li>
		    	<li><a href="xianshangweiqi.jsp" >线上围棋</a></li>
		    	<li><a href="bangzhu.jsp" >帮助</a></li>
		    	<li><a href="chongzhi.jsp" >充值</a></li>
			</ul>
  		</div>
	</div>
	<div class="blogg">
		<div class="border w"></div>
		<form action="addblogServlet" name="register" method="post">
			<center>标题<input name="blog_title" type="textArea" style="width:40em" class="code"><br></center>
			<center>正文<textarea name="blog_text" style="width:40em" rows="10"></textarea><br>
			<input type="submit" value="发表博文" class="now-register"></center>
         </form>
	</div>
</body>
</html>