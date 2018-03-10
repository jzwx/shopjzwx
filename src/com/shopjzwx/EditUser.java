package com.shopjzwx;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class EditUser extends HttpServlet {

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
		request.setCharacterEncoding("GBK");
		int pid=Integer.parseInt(request.getParameter("pid"));
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String sex=request.getParameter("sex");
		String email=request.getParameter("email");
		System.out.println(sex);
		try{
			DataBase db=new DataBase();
			Connection cn=db.getConnection();
			Statement st=cn.createStatement();
			String sql="update jzwx_user set username='"+username+"',password='"+password+"',sex='"+sex+"',email='"+email+"' where id="+pid;
			st.executeUpdate(sql);
			sql="select count(id) from jzwx_user";
			ResultSet rs=st.executeQuery(sql);
			rs.next();
			int rowCount=rs.getInt(1);
			int pageCount=0;
			if(rowCount%10==0){
				pageCount=rowCount/10;
			}else{
				pageCount=rowCount/10+1;
			}
			response.sendRedirect("listUser.jsp?page="+pageCount);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
