<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<h3>系统信息</h3>
	<table width="70%" border="1" cellpadding="5" cellspacing="0" bgcolor="#cccccc" style="text-align:left; border:solid 1px #000000;">
	                 <tr>
						  <td style="border: solid 1px #000000;">操作系统</td>
						  <td style="text-align:left; border:solid 1px #000000;">Windowns</td>
					   </tr>
					   <tr>
						  <td style="border: solid 1px #000000;">Apache版本</td>
						  <td style="text-align:left; border:solid 1px #000000;">Apache/2.2.11(Win64) Java Web</td>
					   </tr>
					   <tr>
						  <td style="border: solid 1px #000000;">JDK版本</td>
						  <td style="text-align:left; border:solid 1px #000000;">1.8</td>
					   </tr>
					   <tr>
						  <td style="border: solid 1px #000000;">运行方式</td>
						  <td style="text-align:left; border:solid 1px #000000;">apache2handler</td>
					   </tr>
	</table>
	<h3>软件信息</h3>
	<table width="70%" border="1" cellpadding="5" cellspacing="0" bgcolor="#cccccc" style="text-align:left; border:solid 1px #000000;">
		  <tr>
						  <td style="border: solid 1px #000000;">系统名称</td>
						  <td style="text-align:left; border:solid 1px #000000;">小星网电子商城</td>
					   </tr>
					   <tr>
						  <td style="border: solid 1px #000000;">开发团队</td>
						  <td style="text-align:left; border:solid 1px #000000;">King&小星网的小伙伴 </td>
					   </tr>
					   <tr>
						  <td style="border: solid 1px #000000;">公司网址</td>
						  <td style="text-align:left; border:solid 1px #000000;"><a href="#">http://www.jzwx.com</a></td>
					   </tr>
					   <tr>
						  <td style="border: solid 1px #000000;">成功案例</td>
						  <td style="text-align:left; border:solid 1px #000000;">小星网</td>
					   </tr>
	</table>
</center>

</body>
</html>
