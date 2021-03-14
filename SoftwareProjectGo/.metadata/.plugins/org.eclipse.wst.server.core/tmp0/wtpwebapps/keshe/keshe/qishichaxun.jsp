<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<html><body bgcolor = white >
<head>
<title>围棋论坛后台管理系统</title>	
<link rel="stylesheet" href="css/page.css" />

</head>
<body>	
	<div class="left">	
		<div class="bigTitle">围棋论坛后台管理系统</div>
		<div class="lines">
			<div onclick="pageClick(this)" ><a href = "qishiguanli.jsp">返回</a>
			</div>
			<div onclick="pageClick(this)" ><a href = "#">棋事信息</a></div>											
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
		<% Connection con;
    Statement sql; 
    ResultSet rs;
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){
       out.println("忘记把MySQL数据库的JDBC-数据库驱动程序复制到JDK的扩展目录中");
    }
    try { 
    	String uri= "jdbc:mysql://127.0.0.1/weiqiluntan?serverTimezone=UTC&characterEncoding=utf-8"; 
          String user="root";
          String password="daichongte,123";
          con=DriverManager.getConnection(uri,user,password);
          sql=con.createStatement();
          rs=sql.executeQuery("SELECT * FROM news ");
          out.print("<table border=3>");
          out.print("<tr>");
          out.print("<th width=30>"+"id");	            
          out.print("<th width=100>"+"标题");
          out.print("<th width=100>"+"作者");
          out.print("<th width=50>"+"出处");
          out.print("<th width=100>"+"时间");
          out.print("<th width=100>"+"文本");
          out.print("</TR>");
          while(rs.next()){
            out.print("<tr>");
              out.print("<td >"+rs.getString(1)+"</td>"); 
              out.print("<td >"+rs.getString(2)+"</td>");
              out.print("<td >"+rs.getString(3)+"</td>");
              out.print("<td >"+rs.getString(4)+"</td>");
              out.print("<td >"+rs.getDate("release_time")+"</td>"); 
              out.print("<td >"+"</td>");
            out.print("</tr>") ; 
          }
          out.print("</table>");
          con.close();
    }
    catch(SQLException e){ 
          out.print(e);
    }
 %>
	</div>
	</div>				
	<div style="text-align:center;"></div>
	
</body>
</html>
