package com.shopjzwx;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class AddPro extends HttpServlet {

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

		response.setContentType("text/html;cahrset=gb2312;");
		request.setCharacterEncoding("GBK");
		String pName=request.getParameter("pName");
		String pSn=request.getParameter("pSn");
		int pNum=Integer.parseInt(request.getParameter("pNum"));
		double mPrice=Double.parseDouble(request.getParameter("mPrice"));
		double iPrice=Double.parseDouble(request.getParameter("iPrice"));
		String pDesc=request.getParameter("pDesc");
		String pImg=request.getParameter("filename");
		String pubTime=request.getParameter("pubTime");
		int isShow=Integer.parseInt(request.getParameter("isShow"));
		int isHot=Integer.parseInt(request.getParameter("isHot"));
		int cId=Integer.parseInt(request.getParameter("cId"));
		if(!pImg.equals("")){
			pImg="images/"+pImg.substring(pImg.lastIndexOf("\\")+1);
		}
//		System.out.println(pImg);
//		System.out.println(pName+" "+pSn+" "+pNum+" "+mPrice+" "+iPrice+" "+pDesc+" "+pImg+" "+pubTime+" "+isShow+" "+isHot+" "+cId);
		try{
			DataBase db=new DataBase();
			Connection cn=db.getConnection();
			Statement st=cn.createStatement();
			Statement st1=cn.createStatement();
			String sql="insert into jzwx_pro(pName,pSn,pNum,mPrice,iPrice,pDesc,pImg,pubTime,isShow,isHot,cId) values('"+pName+"','"+pSn+"',"+pNum+","+mPrice+","+iPrice+",'"+pDesc+"','"+pImg+"','"+pubTime+"',"+isShow+","+isHot+","+cId+")";
			st.executeUpdate(sql);
			sql="select cId from jzwx_pro where pName='"+pName+"'";
			ResultSet rs=st.executeQuery(sql);
			rs.next();
			String sql1="insert into jzwx_album(pid,albumPath) values("+rs.getInt(1)+",'"+pImg+"')";
			st.executeUpdate(sql1);
			response.sendRedirect("addPro1.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
