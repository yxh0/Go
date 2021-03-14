<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>充值中心</title>
<link rel="stylesheet" href="css/init.css">
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="css/chongzhi.css">
</head>
<body>
<%! String flag=null;  %>
	<div class="header w">
		<div class="logo">
			<img src="image/logo.jpg" alt="" />
		</div>
		<div class="login">
			<ul>
				<li>
					<% flag=(String)session.getAttribute("flag");%>						
  					<% if (flag =="0" || flag==null){%>
					    <a href="login.jsp">登录</a>
						<a href="register.jsp">注册</a>	
						<%} %>
					<% if (flag =="1" ){%>
  					<%  String username=(String)session.getAttribute("username");%>
					您好，<%=username %>
					<%}%>	
				</li>
			</ul>
		</div>
	</div>
	<!-- 导航栏 -->
	<div class="nav w">
		<div class="container">
			<ul class="left">
		    	<li><a href="index.css" >首页</a></li>
		    	<li><a href="#" >博客</a></li>
		    	<li><a href="#" >论坛</a></li>
		    	<li><a href="#" >棋事</a></li>
		    	<li><a href="#" >线上围棋</a></li>
		    	<li><a href="#" >帮助</a></li>
		    	<li><a href="chongzhi.jsp" >充值</a></li>
			</ul>
  		</div>
	</div>
	<!-- 第一大板块 -->
	<div class="news w">
		<div class="newscont1">
			<div class="newsimg1">
				<a href="#"><img src="image/chongzhishouye.jpg"></a>
			</div>
			<div class="newsimg2">
				<a href="#"><img src="image/chongzhixuetang.jpg"></a>
			</div>
		</div>

		<div class="newscont2">
		  <div class="cont">
			<form action="chongzhiServlet?dataBase=warehouse&tableName=yonghu" method=post name=form>
			  <p>充值账号:   </p><input name="zhanghao" type="text" placeholder="请输入账号" class="text" >
			  <br><p>确认账号:   </p><input name="zhanghao1" type="text" placeholder="请确认账号" class="text" >
			  <br><p>充值方式:      支付宝</p>
			  	<div class="newsimg3">
					<img src="image/zhifubao.jpg">
				</div>		    
			  	<ul>  	  					  	
			  	  <li><p>充值金额:      </p></li>				  
	          	  <li><input name="jine" type="text" placeholder="请输入金额" class="text" ><p>元</p></li>
				</ul>
				<input type="submit" value="立即充值" class="main-content5" style="background:#ff8040;width:300px;" >
		   </form> 
		  </div>
		 </div>
	</div>
	
	<div id="footer">
    	<p>围棋论坛小组 版权所有</p>
	</div>
</body>
</html>