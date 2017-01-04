package Servlet;
//������������� �û��� ��ɾ�Ĳ�

import java.io.IOException;
import bean.Userbeancl;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dealUserData extends HttpServlet {

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
        //��ñ�ʾֵ
		String flag = request.getParameter("flag");
		
		//ʹ�÷�ҳ��ʾ����
		if(flag.equals("fengye")){
			
		//�õ��û�ϣ����ʾ��pageNow 
		 String spageNow = request.getParameter("pageNow");
		 int pageNow = Integer.parseInt(spageNow);
		//����Userbeancl 
		 Userbeancl ubc = new Userbeancl();
		 //����ܵ���pageNow
		  ArrayList al = ubc.al(pageNow, 3);
		    int pageCount = ubc.getpageCount();
		    //��al,pageCount ����request ��
		    request.setAttribute("re", al);
		    request.setAttribute("pageCount", pageCount+"");
		    request.setAttribute("pageNow", spageNow);
		    //������ת�ص�manager.jsp 
		    request.getRequestDispatcher("Manager.jsp").forward(request, response);
		    
		}
		//ʹ��ɾ������
		if(flag.equals("delete")){
			
			 String uid = request.getParameter("uid");
			
			 Userbeancl ubc = new Userbeancl();
				
			 if(ubc.deleteit(Integer.parseInt(uid))){
			  request.getRequestDispatcher("Ok.jsp").forward(request, response);
			 }else{
			  request.getRequestDispatcher("Error.jsp").forward(request, response);
			 }
		}
		//�޸��û�
		if(flag.equals("alter")){
			String upw = request.getParameter("upw");
		    String umail = request.getParameter("umail");
		    String ugrade = request.getParameter("ugrade"); 
		    String uid = request.getParameter("uid");
		    Userbeancl ubc = new Userbeancl();
		    boolean B = ubc.update(uid,upw, umail, ugrade);
		   
		    if(B){
		    response.sendRedirect("Ok.jsp");
		    }else{
		    response.sendRedirect("Error.jsp");
		    }
		}
		//�����û�
		if(flag.equals("add")){
			 String uname = request.getParameter("uname");
			 String upasswd = request.getParameter("upasswd");
			 String mail = request.getParameter("mail");
			 String grade = request.getParameter("grade");
			 Userbeancl ubc = new Userbeancl();
			boolean re= ubc.addUser(uname, upasswd, mail, Integer.parseInt(grade));
			if(re){
			  //response.sendRedirect("Ok.jsp");
				request.getRequestDispatcher("Ok.jsp").forward(request, response);
			}else{
			  //response.sendRedirect("Error.jsp");
				request.getRequestDispatcher("Error.jsp").forward(request, response);
			}
			
		}
		//��ѯ�û�
	    if(flag.equals("search")){
	    	 String s = request.getParameter("s");
	    	 String uname = request.getParameter("uname");
	    	 Userbeancl ubc = new Userbeancl(); 
	    	 ArrayList al = ubc.als(uname, s);
	    	 request.setAttribute("al", al);
	    	 String flag2="flag";
	    	 request.setAttribute("flag",flag2);
	    	 request.getRequestDispatcher("Searchuser.jsp").forward(request, response);
	    	  
	    }
			
		
		
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          this.doGet(request, response);
		
	}

}
