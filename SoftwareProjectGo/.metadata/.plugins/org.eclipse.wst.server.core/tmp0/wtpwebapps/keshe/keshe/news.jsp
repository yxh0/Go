<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻</title>
<link rel="stylesheet" href="css/init.css">
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="css/news.css">
</head>
<body>
	<div class="header w">
		<div class="logo">
			<img src="images/logo.jpg" alt="" />
		</div>
		<div class="login">
			<ul>
				<li><a href="login.jsp">登录</a> | <a href="register.jsp">注册</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 导航栏 -->
	<div class="nav w">
		<div class="container">
			<ul class="left">
				<li><a href="#">首页</a></li>
				<li><a href="#">博客</a></li>
				<li><a href="#">论坛</a></li>
				<li><a href="#">棋事</a></li>
				<li><a href="#">线上围棋</a></li>
				<li><a href="#">帮助</a></li>
				<li><a href="#">充值</a></li>
			</ul>
		</div>
	</div>
	<div class="t w" style="height: 600px;">
		<table>
			<thead>
				<tr>
					<th class="one">棋闻棋事</th>
					<th class="two">日期</th>
				</tr>
			</thead>
				<%	Connection con;
					Statement sql;
					ResultSet rs;
					Class.forName("com.mysql.cj.jdbc.Driver");
					try {
						String uri = "jdbc:mysql://localhost:3306/weiqiluntan?useUnicode=true&characterEncoding=gbk&useSSL=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Hongkong";
						String user = "root";
						String password = "daichongte,123";
						con = DriverManager.getConnection(uri, user, password);
						sql = con.createStatement();
						rs = sql.executeQuery("SELECT * FROM news order by release_time desc");				
						while (rs.next()) {
				%>
				<tr>
					 <form action= "newspage.jsp"  method=post>
					<th class="thone" style="height: 35px; weight: 300;"><a href="newspage.jsp?id=<%= rs.getString(1) %>" target="_blank">
						<% out.print(rs.getString(2)); %>
					</a></th>
					</form>
					<th class="thone" style="height: 35px; weight: 300;">
						<% out.print(rs.getString(5)); %>
					</th>
				</tr>
				<%
						}
						con.close();
					} catch (SQLException e) {
						out.print(e);
					}
				%>
		</table>
	</div>
	<div class="footer w">
    	<p>围棋论坛小组 版权所有</p>
	</div>
</body>
</html>