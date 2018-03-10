package com.shopjzwx;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Vali extends HttpServlet {
	String ver[]=new String[62];
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try
		{
			response.setContentType("image/jpeg");
			OutputStream os=response.getOutputStream();
			BufferedImage image=new BufferedImage(75,27,BufferedImage.TYPE_INT_RGB);
			Graphics g=image.getGraphics();
			g.setColor(new Color(200,200,200));
			g.fillRect(0, 0, 75, 27);
			g.setColor(new Color(150,150,150));
			for(int i=0;i<20;i++)
			{
				int x1=(int)(Math.random()*75);
				int y1=(int)(Math.random()*27);
				int x2=(int)(Math.random()*75);
				int y2=(int)(Math.random()*27);
				g.drawLine(x1, y1, x2, y2);
			}
			String vali="";
			for(int i=0;i<4;i++)
			{
				String v=(ver[(int)(Math.random()*62)]);
				vali+=v;
				g.setColor(new Color((int)(Math.random()*150),(int)(Math.random()*150),(int)(Math.random()*150)));
				g.setFont(new Font("宋体",Font.BOLD, 20));
				g.drawString(v,i*10+20,18);
			}
			//保存随机生成验证码
			HttpSession session=request.getSession();
			session.setAttribute("vali", vali);
			g.dispose();
			//以image的形式输出
			ImageIO.write(image,"JPEG",os);
		}catch(Exception e)
		{
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

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		for(int i=0;i<10;i++)
		{
			ver[i]=new Integer(i).toString();
		}
		for(int i=0;i<26;i++)
		{
			ver[i+10]=new Character((char)(i+97)).toString();
		}
		for(int i=0;i<26;i++)
		{
			ver[i+36]=new Character((char)(i+65)).toString();
		}
	}

}
