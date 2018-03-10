<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shopjzwx.DataBase"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editAdmin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h3 align="center">管理员信息修改</h3>
  	<form name="f" action="editadmin.bin" method="post">
 		<%
 			int id=Integer.parseInt(request.getParameter("id"));
 			try{
 				DataBase db=new DataBase();
 				Connection cn=db.getConnection();
 				Statement st=cn.createStatement();
 				String sql="select * from jzwx_admin where id="+id;
 				ResultSet rs=st.executeQuery(sql);
 				rs.next();
 				%>
 			<table width="70%" border="1" cellpadding="5" cellspacing="0" bgcolor="#cccccc" align="center"  style="border: solid 1px #000000;">
 			<tr>
				<td align="right" style="border: solid 1px #000000;">管理员编号</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pid" value="<%=rs.getString(1) %>" onfocus=this.blur() size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;">管理员名称</td>
				<td style="border: solid 1px #000000;"><input type="text" name="username" value="<%=rs.getString(2) %>" placeholder="请输入管理员名称" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;">管理员密码</td>
				<td style="border: solid 1px #000000;"><input type="password" name="password" value="<%=rs.getString(3) %>" placeholder="请输入管理员密码" size="21"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;">管理员邮箱</td>
				<td style="border: solid 1px #000000;"><input type="text" name="email" value="<%=rs.getString(4) %>" placeholder="请输入管理员邮箱" size="20"/></td>
			</tr>
			<tr align="center">
				<td colspan="2" style="border: solid 1px #000000;"><input type="submit" value="确认修改" onclick="return confirm('确认修改吗?')"/></td>
			</tr>
		</table>
 				<%
 			}catch(Exception e)
 			{
 				e.printStackTrace();
 			}
 		 %>
 	</form>
  </body>
</html>
