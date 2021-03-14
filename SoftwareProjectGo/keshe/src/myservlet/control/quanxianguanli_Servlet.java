package myservlet.control;
import mybean.data.My_Bean; //引入例子2中的Javabean模型
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.http.*;
public class quanxianguanli_Servlet extends HttpServlet
{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public void  doPost(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException
   {
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
	     String username2=request.getParameter("username2"); 
	     Connection con;
	     Statement sql; 
	     ResultSet rs;
	     String user = new String("root");
	     String Password =new String("daichongte,123");
	     try{ 
	    	 String uri= "jdbc:mysql://127.0.0.1/warehouse?serverTimezone=UTC&characterEncoding=utf-8"; 
	    	 con=DriverManager.getConnection(uri,user,Password);
	          sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
	        		  ResultSet.CONCUR_UPDATABLE);
	          String condition ="SELECT * FROM yonghu ";
	          rs=sql.executeQuery(condition);
	          rs.beforeFirst();
	          String m=request.getParameter("1");
	          String n=request.getParameter("2");
	          if(m!=null)
	          {	        	
		          while(rs.next())
		          {
			          if(rs.getString(1).equals(username2))
			          {
			        	  rs.updateString(4,"1"); //更新结果集
			        	  rs.updateRow();
			          }
		          }
	          }
	          rs.beforeFirst();
	          if(n!=null)
	          {
	        	  while(rs.next())
		          {
			          if(rs.getString(1).equals(username2))
			          {
			        	  rs.updateString(4,"0"); //更新结果集
			        	  rs.updateRow();
			          }
		          }
	          }
	          rs=sql.executeQuery("SELECT * FROM yonghu");
	          ResultSetMetaData metaData = rs.getMetaData();
	          int columnCount = metaData.getColumnCount(); //得到结果集的列数
	          String []columnName = new String[columnCount];
	          for(int i=0;i<columnName.length;i++) {
	              columnName[i] = metaData.getColumnName(i+1); //得到列名
	           }
	           resultBean.setColumnName(columnName);   //更新Javabean数据模型
	           rs.last();
	           int rowNumber=rs.getRow();  //得到记录数
	           String [][] tableRecord=resultBean.getTableRecord();
	           tableRecord = new String[rowNumber][columnCount];
	           int i=0;
	           while(rs.next()){
	             for(int k=0;k<columnCount;k++) 
	               tableRecord[i][k] = rs.getString(k+1);
	             i++; 
	           }
	           resultBean.setTableRecord(tableRecord); //更新Javabean数据模型   
	          con.close();  
	     }
	     catch(SQLException e){
	          System.out.println(e);
	     }  
   } 
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException
   {      
	   doPost(request,response);
   }
}
