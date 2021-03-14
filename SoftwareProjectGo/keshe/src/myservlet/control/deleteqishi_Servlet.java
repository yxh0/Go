package myservlet.control;
import mybean.data.My_Bean; //引入例子2中的Javabean模型
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Calendar;
public class deleteqishi_Servlet extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response)
               throws ServletException,IOException{
	   My_Bean resultBean=null;
      try{  resultBean=(My_Bean)request.getAttribute("resultBean");
            if(resultBean==null){
                resultBean=new My_Bean(); //创建Javabean对象
                request.setAttribute("resultBean",resultBean);
            }
      }
      catch(Exception exp){
            resultBean=new My_Bean();  //创建Javabean对象
            request.setAttribute("resultBean",resultBean);
      } 
     try{  Class.forName("com.mysql.cj.jdbc.Driver");
     }
     catch(Exception e){} 
     request.setCharacterEncoding("gb2312");
     String id=request.getParameter("id");
     Connection con;
     Statement sql; 
     String user = new String("root");
     String Password =new String("daichongte,123");
     try{ 
    	 String uri= "jdbc:mysql://127.0.0.1/weiqiluntan?serverTimezone=UTC&characterEncoding=utf-8"; 
    	 con=DriverManager.getConnection(uri,user,Password);
          sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
        		  ResultSet.CONCUR_UPDATABLE);         
          try{
          sql.executeUpdate("DELETE FROM news where news_id='"+id+"'");
          }
          catch(SQLException e){
        	  RequestDispatcher dispatcher=
        	          request.getRequestDispatcher("qishiguanli.jsp");
        	          dispatcher.forward(request,response);  //转发
          }
          con.close();
          RequestDispatcher dispatcher=
          request.getRequestDispatcher("qishiguanli.jsp");
          dispatcher.forward(request,response);  //转发
     }
     catch(SQLException e){
          System.out.println(e);
     }  
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
           throws ServletException,IOException{
       doPost(request,response);
   }
}
