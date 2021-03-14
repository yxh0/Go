<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<meta charset="gb2312">
<title>注册界面</title>
<link rel="stylesheet" href="css/init.css">
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="css/regi.css">
</head>
<body>
	<div class="header w">
		<div class="logo">
			<img src="images/logo.jpg" alt="" />
		</div>
		<div class="login">
			<ul>
				<li>
					<a href="login.jsp">登录</a> |
					<a href="register.jsp">注册</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 导航栏 -->
	<div class="nav w">
		<div class="container">
			<ul class="left">
		    	<li><a href="index.jsp" >首页</a></li>
		    	<li><a href="#" >博客</a></li>
		    	<li><a href="#" >论坛</a></li>
		    	<li><a href="#" >棋事</a></li>
		    	<li><a href="xianshangweiqi.jsp" >线上围棋</a></li>
		    	<li><a href="bangzhu.jsp" >帮助</a></li>
		    	<li><a href="chongzhi.jsp" >充值</a></li>
			</ul>
  		</div>
	</div>
	<div class="main w">
		<div class="border w">注册围棋账号</div>
		<form action="insertServlet?dataBase=weiqiluntan&tableName=chess_user" name="register" method="post">
                <input name="username" type="text" placeholder="请输入账号" class="code">
                <input name="password" data-a="a1" type="password" placeholder="请输入密码" class="code">
                <input name="phone" type="text" placeholder="请输入电话" class="code">
                <input name="sex" type="text" placeholder="请输入性别" class="code">
                <div class="lf">
                    <input type="checkbox" checked>
                                                        已阅读并同意<a href="">《围棋账号注册协议》</a>
                </div>
                <input type="submit" value="立即注册" class="now-register">
         </form>
	</div>
	<div class="footer">
    	<p>围棋论坛小组 版权所有</p>
	</div>
</body>
</html>