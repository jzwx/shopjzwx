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
    
    <title>My JSP 'addPro.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="style/global.css">  
	<script type="text/javascript" src="js/addPro.js"></script>
  </head>
  
  <body>
    <h3 align="center">�����Ʒ</h3>
	<form action="addpro.bin" method="post" name="f1">
	<%
		try{
		DataBase db=new DataBase();
		Connection cn=db.getConnection();
		Statement st=cn.createStatement();
		Statement st1=cn.createStatement();
		String sql="select count(id) from jzwx_cate";
		ResultSet rs=st.executeQuery(sql);
		rs.next();
		int cateCount=rs.getInt(1);
		String sql1="select cName from jzwx_cate";
		ResultSet rs1=st.executeQuery(sql1);
	 %>
		<table width="70%" border="1" cellpadding="5" cellspacing="0" bgcolor="#cccccc" align="center"  style="border: solid 1px #000000;">
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒ����</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pName" placeholder="��������Ʒ����" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒ����</td>
				<td style="border: solid 1px #000000;">
				<%
					
				 %>
				<select name="cId">
				<%
				for(int i=1;i<=cateCount;i++)
				{
				if(rs1.next()){
				 %>
				<option value="<%=i %>"><%=rs1.getString(1) %></option>
				<%
				}
				}
				 %>
				</select>
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒ����</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pSn" placeholder="��������Ʒ����" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒ����</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pNum" placeholder="��������Ʒ����" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒ�г���</td>
				<td style="border: solid 1px #000000;"><input type="text" name="mPrice" placeholder="��������Ʒ�г���" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��ƷС�Ǽ�</td>
				<td style="border: solid 1px #000000;"><input type="text" name="iPrice" placeholder="������С�Ǽ�" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒ����</td>
				<td style="border: solid 1px #000000;">
				<textarea name="pDesc" id="editor_id" style="width:100%;height:150px;"></textarea>
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒͼ��</td>
				<td style="border: solid 1px #000000;">
					<input type="file"  name="filename" onChange="changeImage()"/>
					
					<div id="attachList" class="clear">
						<img src="" name="images"/>
					</div>
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒ�ϼ�ʱ��</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pubTime" placeholder="��������Ʒ�ϼ�ʱ��" size="20"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">��Ʒ�Ƿ��ϼ�</td>
				<td style="border: solid 1px #000000;">
				<select name="isShow">
					<option value="1">��</option>
					<option value="0">��</option>
				</select>
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">�����õ���Ʒ</td>
				<td style="border: solid 1px #000000;">
				<select name="isHot">
					<option value="1">��</option>
					<option value="0">����</option>
				</select>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2" style="border: solid 1px #000000;"><input type="submit" value="������Ʒ"/></td>
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
