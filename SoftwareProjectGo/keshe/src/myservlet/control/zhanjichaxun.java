package myservlet.control;
import mybean.data.My_Bean; //引入例子2中的Javabean模型
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class chongzhi_Servlet extends HttpServlet{
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
     try{  Class.forName("com.mysql.jdbc.Driver");
     }
     catch(Exception e){} 
     request.setCharacterEncoding("gb2312");
     HttpSession session=request.getSession(true);
     String dataBase = request.getParameter("dataBase");
     String tableName = request.getParameter("tableName");
     String zhanghao=request.getParameter("zhanghao");
     String zhanghao1=request.getParameter("zhanghao1");
     String money=request.getParameter("jine");   
     /*if(username1==null||username1.length()==0) {
        fail(request,response,"请输入账号");
        return;
     }*/
     Connection con;
     Statement sql; 
     ResultSet rs;
     String p=zhanghao;
     String user = new String("root");
     String Password =new String("0");
     int m,n;
     try{ 
    	 String uri= "jdbc:mysql://127.0.0.1/warehouse"; 
    	 con=DriverManager.getConnection(uri,user,Password);
          sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
        		  ResultSet.CONCUR_UPDATABLE);
          String condition ="SELECT * FROM yonghu where username="+p;
          rs=sql.executeQuery(condition);
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
           rs.beforeFirst();
           int i=0;
           while(rs.next()){
             for(int k=0;k<columnCount;k++) 
               tableRecord[i][k] = rs.getString(k+1);
             i++; 
           }
           resultBean.setTableRecord(tableRecord); //更新Javabean数据模型   
           /*if(tableRecord[0][1].equals(password1))
           {
        	   RequestDispatcher dispatcher=
     		   request.getRequestDispatcher("dengluchenggong.jsp");
     		   dispatcher.forward(request,response);  //转发
     		   session.setAttribute("username",username1);
     		   rs.absolute(1);
     		   rs.updateString("flag", "1");
     		   rs.updateRow();
           }
           else
           {
        	   RequestDispatcher dispatcher=
               request.getRequestDispatcher("denglushibai.jsp");
               dispatcher.forward(request,response);  //转发
           }*/
           if(zhanghao.equals(zhanghao1))
           {
	           m=Integer.valueOf(tableRecord[0][2]);
	           n=Integer.valueOf(money);
	           m=m+n;
	           rs.absolute(1);
	 		   rs.updateInt("money", m);
	 		   rs.updateRow();
	 		   RequestDispatcher dispatcher=
	 	       request.getRequestDispatcher("chongzhichenggong.jsp");
	 	       dispatcher.forward(request,response);  //转发
           }
           else
           {
        	   RequestDispatcher dispatcher=
        	   request.getRequestDispatcher("chongzhishibai.jsp");
        	   dispatcher.forward(request,response);  //转发
           }
           con.close();  
     }
     catch(SQLException e){
          System.out.println(e);
          fail(request,response,"充值失败"+e.toString());
     }  
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
           throws ServletException,IOException{
       doPost(request,response);
   }
   public void fail(HttpServletRequest request,HttpServletResponse response,
                      String backNews) {
        response.setContentType("text/html;charset=GB2312");
        try {
         PrintWriter out=response.getWriter();
         out.println("<html><body>");
         out.println("<h2>"+backNews+"</h2>") ;
         out.println("返回");
         out.println("<a href =chongzhi.jsp>输入记录</a>");
         out.println("</body></html>");
        }
        catch(IOException exp){} 
    }
}
