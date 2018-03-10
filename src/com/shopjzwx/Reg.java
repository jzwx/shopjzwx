package com.shopjzwx;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class Reg extends HttpServlet {

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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("GBK");
		String user=request.getParameter("user");
		String passwd=request.getParameter("passwd");
		String passwd1=request.getParameter("passwd1");
		String email=request.getParameter("email");
		String adr=request.getParameter("adr");
		String sex=request.getParameter("sex");
		System.out.print(user+" "+passwd+" "+passwd1+" "+email+" "+adr+" "+sex);
		if(sex.equals("0")){
			sex="男";
		}else if(sex.equals("1")){
			sex="女";
		}else{
			sex="保密";
		}
		try{
			DataBase db=new DataBase();
			Connection cn=db.getConnection();
			Statement st=cn.createStatement();	
			if(passwd.equals(passwd1)){
				String sql="insert into jzwx_user(username,password,sex,email,face,regTime) values('"+user+"','"+passwd+"','"+sex+"','"+email+"','"+adr+"',1)";
				st.executeUpdate(sql);
				response.sendRedirect("Login.jsp");
			}else{
				System.out.println("密码不一致");
				response.sendRedirect("reg.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
