package myservlet.control;
import mybean.data.My_Bean; //��������2�е�Javabeanģ��
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class guanliyuan_Servlet extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response)
               throws ServletException,IOException{
	   My_Bean resultBean=null;
      try{  resultBean=(My_Bean)request.getAttribute("resultBean");
            if(resultBean==null){
                resultBean=new My_Bean(); //����Javabean����
                request.setAttribute("resultBean",resultBean);
            }
      }
      catch(Exception exp){
            resultBean=new My_Bean();  //����Javabean����
            request.setAttribute("resultBean",resultBean);
      } 
     try{  Class.forName("com.mysql.cj.jdbc.Driver");
     }
     catch(Exception e){} 
     request.setCharacterEncoding("gb2312");
     HttpSession session=request.getSession(true);
     String dataBase = request.getParameter("dataBase");
     String tableName = request.getParameter("tableName");
     String username1=request.getParameter("username");
     String password1=request.getParameter("password");   
     Connection con;
     Statement sql; 
     ResultSet rs;
     String p=username1;
     int flag=0;
     String user = new String("root");
     String Password =new String("daichongte,123");
     try{ 
    	 String uri= "jdbc:mysql://127.0.0.1/warehouse?serverTimezone=UTC&characterEncoding=utf-8"; 
    	 con=DriverManager.getConnection(uri,user,Password);
          sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
        		  ResultSet.CONCUR_UPDATABLE);
          String condition ="SELECT * FROM guanliyuan where username="+p;
          rs=sql.executeQuery(condition);
          ResultSetMetaData metaData = rs.getMetaData();
          int columnCount = metaData.getColumnCount(); //�õ������������
          String []columnName = new String[columnCount];
          for(int i=0;i<columnName.length;i++) {
              columnName[i] = metaData.getColumnName(i+1); //�õ�����
           }
           resultBean.setColumnName(columnName);   //����Javabean����ģ��
           rs.last();
           int rowNumber=rs.getRow();  //�õ���¼��
           String [][] tableRecord=resultBean.getTableRecord();
           tableRecord = new String[rowNumber][columnCount];
           rs.beforeFirst();
           int i=0;
           while(rs.next()){
             for(int k=0;k<columnCount;k++) 
               tableRecord[i][k] = rs.getString(k+1);
             i++; 
           }
           resultBean.setTableRecord(tableRecord); //����Javabean����ģ��   
           /*if(tableRecord[0][1].equals(password1))
           {
        	   RequestDispatcher dispatcher=
     		   request.getRequestDispatcher("dengluchenggong2.jsp");
     		   dispatcher.forward(request,response);  //ת��
     		   session.setAttribute("username",username1);
     		   session.setAttribute("flag","1");
           }
           else
           {
        	   RequestDispatcher dispatcher=
               request.getRequestDispatcher("denglushibai.jsp");
               dispatcher.forward(request,response);  //ת��
               session.setAttribute("flag","0");
           }*/
           for(int count=0;count<rowNumber;count++)
           {
        	   if(tableRecord[count][0].equals(p))
        	   {
		           if(tableRecord[count][1].equals(password1))
		           {
		     		   flag=1;
		           }
		           else
		           {
		        	   flag=0;
		               
		           }
        	   }
           }
           if(flag==1)
           {
        	   RequestDispatcher dispatcher=
     		   request.getRequestDispatcher("dengluchenggong2.jsp");
     		   dispatcher.forward(request,response);  //ת��
     		   session.setAttribute("username",username1);
     		   session.setAttribute("flag","1");
           }
           else
           {
        	   RequestDispatcher dispatcher=
		               request.getRequestDispatcher("denglushibai.jsp");
		               dispatcher.forward(request,response);  //ת��
		               session.setAttribute("flag","0");
           }
           
          con.close();  
     }
     catch(SQLException e){
          System.out.println(e);
          fail(request,response,"��¼ʧ��"+e.toString());
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
         out.println("����");
         out.println("<a href =login.jsp>�����¼</a>");
         out.println("</body></html>");
        }
        catch(IOException exp){} 
    }
}