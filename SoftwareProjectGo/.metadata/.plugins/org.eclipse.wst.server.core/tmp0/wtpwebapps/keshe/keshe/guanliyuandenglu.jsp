<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<meta charset="gb2312">
<title>登界面</title>
<link rel="stylesheet" href="css/init.css">
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="css/login.css">
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
<div class="border w">
	<div class="main w">
	  <div class="main-content1">
		<p>登录围棋账号可享受更多服务</p>
	  </div>
	<div class="inp">
			<form action="gdengluServlet?dataBase=warehouse&tableName=guanliyuan" name="register" method="post">
                <div class="main-content2">
                    <input name="username" type="text" placeholder="请输入手机号码/邮箱/用户名" value="" class="text" >
                </div>
                <div class="main-content3">
                    <input name="password" type="password" placeholder="请输入账号密码" value="" class="text" >
                </div>
                <div class="main-content4 ">
                    <a href="#" class="safes">找回密码</a>
                    <span class="safe">|</span>
                    <a href="#" class="safes">账号申诉</a>
                </div>
            <input type="submit" value="登陆" class="main-content5">
            </form>
      </div>
      
     </div>
</div>
<div class="footer w">
    <p>围棋论坛小组 版权所有</p>
</div>
</body>
</html>