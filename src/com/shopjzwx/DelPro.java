package com.shopjzwx;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class DelPro extends HttpServlet {

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

		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("GB2312");
		String id=request.getParameter("id");
//		System.out.println(id);
		try{
			DataBase db=new DataBase();
			Connection cn=db.getConnection();
			Statement st=cn.createStatement();
			Statement st1=cn.createStatement();
			String sql="select cId from jzwx_pro where id="+id;
			ResultSet rs=st.executeQuery(sql);
			rs.next();
			int cId=rs.getInt(1);
			sql="delete from jzwx_album where pid="+cId;
			st1.executeUpdate(sql);
			sql="delete from jzwx_pro where id="+id;
			st1.executeUpdate(sql);
			sql="select count(id) from jzwx_pro";
			ResultSet rs1=st.executeQuery(sql);
			rs1.next();
			int rowCount=rs1.getInt(1);
			int pageCount=0;
			if(rowCount%10==0){
				pageCount=rowCount/10;
			}else{
				pageCount=rowCount/10+1;
			}
			response.sendRedirect("listPro.jsp?page="+pageCount);
		}catch(Exception e){
			e.printStackTrace();
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
