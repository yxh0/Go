package myservlet;
import mybean.Message_Bean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Message_Servlet extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response)
               throws ServletException,IOException{
	  Message_Bean digitBean=null;
      HttpSession session=request.getSession(true);
      try{  digitBean=(Message_Bean)session.getAttribute("digitBean");
            if(digitBean==null){
                digitBean=new Message_Bean(); //创建Javabean对象
                 //将digitBean存储到session对象中: 
                session.setAttribute("digitBean",digitBean);
            }
      }
      catch(Exception exp){
            digitBean=new Message_Bean();  //创建Javabean对象
            session.setAttribute("digitBean",digitBean);//digitBean存储到session中
      } 
      String str1=request.getParameter("username");
      String str2=request.getParameter("text");
      if(str1==null||str2==null)
         return;
      if(str1.length()==0||str2.length()==0)
         return;
      
      digitBean.setUsername(str1);     //将数据存储在digitBean中 
      digitBean.setText(str2);
      response.sendRedirect("Check_jsp.jsp");  //重定向
   } 
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
       doPost(request,response);
   }
}
