package com.shopjzwx;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
public class AdminLogin extends HttpServlet {

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

		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("GBK");
		String user=request.getParameter("adminuser");
		String passwd=request.getParameter("adminpasswd");
		try
		{
			DataBase db=new DataBase();
			Connection cn=db.getConnection();
			Statement st=cn.createStatement();
			String sql="select * from jzwx_admin where username='"+user+"' and password='"+passwd+"'";
			ResultSet rs=st.executeQuery(sql);
			HttpSession session=request.getSession();
			String vali=(String) session.getAttribute("vali");
			String indexvali=request.getParameter("vali");
			if(rs.next()&&vali.equals(indexvali))
			{
				session.setAttribute("user", user);
				Cookie username=new Cookie("user",user);
				username.setMaxAge(60*60*24*7);
				response.addCookie(username);
				response.sendRedirect("AdminMain.jsp");
				System.out.println("µÇÂ¼³É¹¦");
			}
			else
			{
				response.sendRedirect("AdminLogin.jsp");
				System.out.println("µÇÂ¼Ê§°Ü");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
