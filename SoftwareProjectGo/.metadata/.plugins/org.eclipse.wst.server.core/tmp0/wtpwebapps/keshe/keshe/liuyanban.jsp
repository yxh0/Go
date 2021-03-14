<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.Liuyanban" %>
<jsp:useBean id="liuyan" class="mybean.data.Liuyanban" scope="session" />
<HTML><body bgcolor=cyan>
 <form action="liuyanban" method="post" name="form">
   输入名字：<input  type="text" name="peopleName">
   <br>发帖标题：<input  type="text"  name="title">
   <br>内容：<br> <textArea name="messages" rows="10" cols=36 
                   wrap="physical"></textArea>
   <br><input type="submit" value="发帖" name="submit">
 </form>
 <a href="Message_wall.jsp">查看留言板</a>
 
 <br>
 <%
	try 
	{
		int sum = (int)application.getAttribute("sum");
			for (int i = 1;i <= sum;++i)
			{
				String temp = "";
				temp+=i;
				Liuyanban message_wall = (Liuyanban)application.getAttribute(temp);
				out.println("第"+i+"条<br>");
				out.println("昵称："+message_wall.getname()+"<br>");
				out.println("发帖标题："+message_wall.getTitle()+"<br>");
				out.println("发帖内容："+message_wall.getMessage()+"<br>");
				out.print("--------------<br>");
			}
	}
	catch (Exception e)
	{
		out.println("留言板中没有留言!");
	}
%>
 
</body></HTML>
