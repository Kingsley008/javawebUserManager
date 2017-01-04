package Servlet;
import java.io.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Tools;
import bean.Userbean;
import bean.Userbeancl;

public class logincl extends HttpServlet {

	/**
		 * Destruction of the servlet. <br>
		 */
	public void init() throws ServletException{
		System.out.println("init");
		try {
			BufferedReader br = new BufferedReader(
					                 new InputStreamReader(
					                		 new FileInputStream("F:/test.txt")));
			String count= br.readLine();
			br.close();
			this.getServletContext().setAttribute("Vtime", count);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	 
	
	}
	public void destroy() {
		System.out.print("destory");
		 try {
				PrintWriter pw = new PrintWriter(
						             new BufferedWriter( 
						            	 new OutputStreamWriter(
						            			 new FileOutputStream("F:/test.txt"))));
				Object obj2=this.getServletContext().getAttribute("Vtime");
				pw.write(obj2.toString());
				pw.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String uname= request.getParameter("uname");
		String upasswd = request.getParameter("upasswd");
	    uname = Tools.getNewString(uname);
	
		Userbeancl ubc = new Userbeancl();
		 boolean check= ubc.checkit(uname, upasswd);
		  String flag = request.getParameter("flag");
          HttpSession hs = request.getSession();
          
		 if(check){
		  hs.setAttribute("uname", uname);
		  
		  hs.setMaxInactiveInterval(300000);
		  
		  if(flag!=null){
		   URLEncoder.encode(uname, "UTF-8");
		   Cookie cook1 = new Cookie("uname",uname);
		   
		    cook1.setMaxAge(3000*3000);
		    
	      Cookie cook2 = new Cookie("upasswd",upasswd);
	        cook2.setMaxAge(3000*3000);
	        
	      response.addCookie(cook1);
	      response.addCookie(cook2);
	      
	     
//		    ArrayList al = ubc.al(1, 3);
//		    int pageCount = ubc.getpageCount();
		    //将al,pageCount 放入request 中
//		    request.setAttribute("re", al);
//		    request.setAttribute("pageCount", pageCount+"");
//		    request.setAttribute("pageNow", "1");
		    request.getRequestDispatcher("MyMain.jsp").forward(request, response);
	   
	  	
	      }

		  Object obj=this.getServletContext().getAttribute("Vtime");
		  	int i = Integer.parseInt(obj.toString()); 
		  	i++;
		  	this.getServletContext().setAttribute("Vtime", String.valueOf(i));
			  //response.sendRedirect("MyMain.jsp");
		     
		  request.getRequestDispatcher("MyMain.jsp").forward(request, response);
		  
		  
		 }else{
		  //response.sendRedirect("Login.jsp");
	      request.getRequestDispatcher("Login.jsp").forward(request, response);
		 }
		 
		
	}

	
@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}



}
