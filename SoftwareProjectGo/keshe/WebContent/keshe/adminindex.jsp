<%@ page contentType="text/html;charset=gb2312" %>
<html><body bgcolor = white >
<head>
<title>围棋论坛后台管理系统</title>	
<link rel="stylesheet" href="css/page.css" />
</head>
<body>	
	<div class="left">	
		<div class="bigTitle">围棋论坛后台管理系统</div>
		<div class="lines">
			<div onclick="pageClick(this)" ><a href = "index.jsp">主页</a>
			</div>
			<div onclick="pageClick(this)"><a href = "yonghuguanli.jsp">用户管理</a>
			</div>				
							
			<div onclick="pageClick(this)"><a href = "message.jsp">论坛管理</a>
			</div>				
			<div onclick="pageClick(this)"><a href = "qishiguanli.jsp">棋事管理</a>
			</div>		
		</div>	
	</div>
	<div class="top">			
	<div class="leftTiyle" id="flTitle">
	</div>	
	<div class="thisLogin"><a href = "tuichu.jsp">退出登录</a>
	</div>		
	<div class="thisUser">你好，管理员
	</div>			
	</div>	
	<div class="content">欢迎来到围棋论坛后台管理系统！
	</div>				
	<div style="text-align:center;"></div>
		
	</body>

</html>