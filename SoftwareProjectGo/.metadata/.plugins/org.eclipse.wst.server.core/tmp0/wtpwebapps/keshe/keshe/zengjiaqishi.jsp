<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<html><body bgcolor = white >
<head>
<title>围棋论坛后台管理系统</title>	
<link rel="stylesheet" href="css/zengjiaqishi.css" />

</head>
<body>	
	<div class="left">	
		<div class="bigTitle">围棋论坛后台管理系统</div>
		<div class="lines">
			<div onclick="pageClick(this)" ><a href = "qishiguanli.jsp">返回</a>
			</div>
			<div onclick="pageClick(this)"><a href = "#">增加棋事信息</a></div>										
		</div>	
	</div>
	<div class="top">			
	<div class="leftTiyle" id="flTitle">
	</div>	
	<div class="thisLogin"><a href = "tuichu.jsp">退出登录</a>
	</div>		
	<div class="thisUser">你好，管理员
	</div>	
	<div class="content">
		<form action="insertqishiServlet?dataBase=weiqiluntan&tableName=news" name="register" method="post">
				<br><input name="id" type="text" placeholder="请输入插入序号" class="code" >
                <br><input name="title" type="text" placeholder="请输入标题" class="code" >
                <br><input name="author" type="text" placeholder="请输入作者" class="code">
                <br><input name="origin" type="text" placeholder="请输入出处" class="code">
                <br><input name="content" type="text" placeholder="请输入文本" class="code">                              
                <br><input type="submit" value="添加" class="now-register">
         </form>
	</div>		
	</div>	
					
	<div style="text-align:center;"></div>
		
	</body>

</html>