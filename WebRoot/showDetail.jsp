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
    
    <title>My JSP 'showDetail.jsp' starting page</title>
        <link href="style/global.css"  rel="stylesheet"  type="text/css" media="all" />
    
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
     <h3 align="center">商品详情</h3>
	<form action="showdetail.bin" method="post" name="f1">
	<%
	String id=request.getParameter("id");
	
		try{
			DataBase db=new DataBase();
			Connection cn=db.getConnection();
			Statement st=cn.createStatement();
			Statement st1=cn.createStatement();
			String sql="select * from jzwx_pro where id="+id;
			ResultSet rs=st.executeQuery(sql);
			rs.next();
	 %>
		<table width="70%" border="1" cellpadding="5" cellspacing="0" bgcolor="#cccccc" align="center"  style="border: solid 1px #000000;">
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品编号</td>
				<td style="border: solid 1px #000000;"><input type="text" name="id" value="<%=rs.getString(1) %>" size="20" onfocus=this.blur()"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品名称</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pName" value="<%=rs.getString(2) %>" size="20" disabled="true"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品分类</td>
				<td style="border: solid 1px #000000;">
				<%
					int cId=rs.getInt(12);
					String sql1="select cName from jzwx_cate where id="+cId;
					ResultSet rs1=st1.executeQuery(sql1);
					rs1.next();
				 %>
				<select name="cId">
				<option value="<%=cId %>"><%=rs1.getString(1) %></option>
				</select>
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品货号</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pSn" value="<%=rs.getString(3) %>" size="20" disabled="true"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品数量</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pNum" value="<%=rs.getInt(4) %>"  size="20" disabled="true" /></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品市场价</td>
				<td style="border: solid 1px #000000;"><input type="text" name="mPrice" value="<%=rs.getDouble(5) %>"  size="20" disabled="true"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品小星价</td>
				<td style="border: solid 1px #000000;"><input type="text" name="iPrice" value="<%=rs.getDouble(6) %>"  size="20" disabled="true"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%" >商品描述</td>
				<td style="border: solid 1px #000000;">
				<textarea name="pDesc" id="editor_id" value="<%=rs.getString(7) %>" style="width:100%;height:150px;" disabled="true"><%=rs.getString(7) %></textarea>
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品图像</td>
				<td style="border: solid 1px #000000;">
					<img src="<%=rs.getString(8) %>" name="images"/>
				<!-- 
				<div id="attachList" class="clear">
						
					</div>
				 -->	
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品上架时间</td>
				<td style="border: solid 1px #000000;"><input type="text" name="pubTime" value="<%=rs.getString(9) %>" size="20" disabled="true"/></td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">商品是否上架</td>
				<td style="border: solid 1px #000000;">
				<select name="isShow">
				<%
					if(rs.getInt(10)==1){
				 %>
					<option value="1">是</option>

					<%
						}
						else{
					 %>
					<option value="0">否</option>

					<%
						}
					 %>
				</select>
				</td>
			</tr>
			<tr>
				<td align="right" style="border: solid 1px #000000;" width="20%">销量好的商品</td>
				<td style="border: solid 1px #000000;">
				<select name="isHot">
				<%
					if(rs.getInt(11)==1){
				 %>
					<option value="1">好</option>

					<%
						}
						else{
					 %>
					<option value="0">不好</option>

					<%
						}
					 %>
				</select>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2" style="border: solid 1px #000000;"><input type="submit" value="返回列表"/></td>
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
