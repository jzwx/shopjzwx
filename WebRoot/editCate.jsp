<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shopjzwx.DataBase"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editCate.jsp' starting page</title>
    
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
      <h3 align="center">��ӷ���</h3>
	<form action="editcate.bin" method="post">
	<%
		String id=request.getParameter("id");
		try{
			DataBase db=new DataBase();
			Connection cn=db.getConnection();
			Statement st=cn.createStatement();
			String sql="select * from jzwx_cate where id="+id;
			ResultSet rs=st.executeQuery(sql);
			rs.next();
	 %>
		<table width="70%" border="1" cellpadding="5" cellspacing="0" bgcolor="#cccccc" align="center"  style="border: solid 1px #000000;">
			<tr>
				<td align="right" style="border: solid 1px #000000;">������</td>
				<td style="border: solid 1px #000000;"><input type="text" name="id" onfocus=this.blur() size="20" value="<%=rs.getString(1) %>"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;">��������</td>
				<td style="border: solid 1px #000000;"><input type="text" name="cName" placeholder="�������������" size="20" value="<%=rs.getString(2) %>"/></td>
			</tr>
			<tr align="center">
				<td colspan="2" style="border: solid 1px #000000;"><input type="submit" value="ȷ���޸�"/></td>
			</tr>
		</table>
		<%
			}catch(Exception e){
				e.printStackTrace();
			}
		 %>
	</form>
  </body>
</html>
