<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addAdmin.jsp' starting page</title>
    
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
  <h3 align="center">添加用户</h3>
	<form action="adduser.bin" method="post">
		<table width="70%" border="1" cellpadding="5" cellspacing="0" bgcolor="#cccccc" align="center"  style="border: solid 1px #000000;">
			<tr>
				<td align="right" style="border: solid 1px #000000;">用户名</td>
				<td style="border: solid 1px #000000;"><input type="text" name="username" placeholder="请输入用户名" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;">密码</td>
				<td style="border: solid 1px #000000;"><input type="password" name="password" placeholder="请输入密码" size="21"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;">邮箱</td>
				<td style="border: solid 1px #000000;"><input type="text" name="email" placeholder="请输入邮箱" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;">性别</td>
				<td style="border: solid 1px #000000;"><input type="radio" name="sex" value="1" checked="checked"/>男
				<input type="radio" name="sex" value="2"/>女
				<input type="radio" name="sex" value="3"/>保密
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;">地址</td>
				<td style="border: solid 1px #000000;"><input type="text" name="adr" placeholder="请输入地址" size="20"/></td>
			</tr>
			<tr align="center">
				<td colspan="2" style="border: solid 1px #000000;"><input type="submit" value="添加用户"/></td>
			</tr>
		</table>
	</form>
  </body>
</html>
