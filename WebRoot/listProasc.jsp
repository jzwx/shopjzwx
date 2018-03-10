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
    
    <title>My JSP 'listPro.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="style/backstage.css">
<script type="text/javascript">
function showDetail(id){
	window.location='showDetail.jsp?id='+id;
}
	function addPro(){
		window.location='addPro.jsp';
	}
	function editPro(id){
		window.location='editPro.jsp?id='+id;
	}
	function delPro(id){
		if(window.confirm("您确认要删除嘛？添加一次不易，且删且珍惜!")){
			window.location="delpro.bin?id="+id;
		}
	}
	function search(){
		if(event.keyCode==13){
			var val=document.getElementById("search").value;
			window.location="listProsearch.jsp?keywords="+val;
		}
	}
	function change(val){
		var val=document.getElementById("select").value;
		window.location="listProasc.jsp?order="+val;
	}
</script>
  </head>
  
  <body>
<div id="showDetail"  style="display:none;">

</div>
<div class="details">
                    <div class="details_operation clearfix">
                        <div class="bui_select">
                            <input type="button" value="添&nbsp;&nbsp;加" class="add" onclick="addPro()">
                        </div>
                        <div class="fr">
                            <div class="text">
                                <span>商品价格：</span>
                                <div class="bui_select">
                                    <select id="select" class="select" onchange="change(this.value)">
                                    	<option>-请选择-</option>
                                        <option value="iPrice asc" >由低到高</option>
                                        <option value="iPrice desc">由高到底</option>
                                    </select>
                                </div>
                            </div>
                            <div class="text">
                                <span>上架时间：</span>
                                <div class="bui_select">
                                 <select id="" class="select" onchange="change(this.value)">
                                 	<option>-请选择-</option>
                                        <option value="pubTime desc" >最新发布</option>
                                        <option value="pubTime asc">历史发布</option>
                                    </select>
                                </div>
                            </div>
                            <div class="text">
                                <span>搜索</span>
                                <input type="text" value="" class="search"  id="search" onkeypress="search()" >
                            </div>
                        </div>
                    </div>
                         <%
                         int n=10;
                         String o=request.getParameter("order");
                        	try{
                        	DataBase db=new DataBase();
                        	Connection cn=db.getConnection();
                        	Statement st=cn.createStatement();
                        	String sql=null;
                        	if(o.equals("iPrice asc")){
                        		sql="select * from jzwx_pro order by iPrice asc";
                        	}
                        	else if(o.equals("iPrice desc")){
                        		sql="select * from jzwx_pro order by iPrice desc";
                        	}
                        	else if(o.equals("pubTime desc")){
                        		sql="select * from jzwx_pro order by pubTime desc";
                        	}
                        	else{
                        		sql="select * from jzwx_pro order by pubTime asc";
                        	}
                        	
                        	ResultSet rs=st.executeQuery(sql);
                        	String page1=request.getParameter("page");
                        	int nowPage=1;
                        	try{
                        		if(page1!=null)
                        		{
                        			nowPage=Integer.parseInt(page1);
                        		}
                        	}catch(Exception e){
                        		e.printStackTrace();
                        	}
                        	for(int i=0;i<(nowPage-1)*10;i++){
                        		rs.next();
                        	}
                         %>
                    <!--表格-->
                    <table class="table" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th width="10%">编号</th>
                                <th width="20%">商品名称</th>
                                <th width="10%">商品分类</th>
                                <th width="10%">是否上架</th>
                                <th width="15%">上架时间</th>
                                <th width="10%">慕课价格</th>
                                <th>操作</th>
                            </tr>
                        </thead>
   
                        <tbody>
                       <%
                       	for(int i=0;i<10;i++){
                       	if(rs.next()){
                        %>
                            <tr>
                                <!--这里的id和for里面的c1 需要循环出来-->
                                <td><%=rs.getString(1) %></td>
                                <td><%=rs.getString(2) %></td>
                                <td><%=rs.getString(12) %></td>
                                <td><%=rs.getString(10) %></td>
                                 <td><%=rs.getString(9) %></td>
                                  <td><%=rs.getString(6) %></td>
                                  
                                <td align="center">
                                				<input type="button" value="详情" class="btn" onclick="showDetail(<%=rs.getString(1) %>)"><input type="button" value="修改" class="btn" onclick="editPro(<%=rs.getString(1) %>)"><input type="button" value="删除" class="btn"onclick="delPro(<%=rs.getString(1) %>)">
					            <!--                 <div id="showDetail" style="display:none;">
					                        	
					                        	<table class="table" cellspacing="0" cellpadding="0">
					                        		<tr>
					                        			<td width="20%" align="right">商品名称</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">商品类别</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">商品货号</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">商品数量</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td  width="20%"  align="right">商品价格</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td  width="20%"  align="right">幕课网价格</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">商品图片</td>
					                        			<td>
					                        			11<img width="100" height="100" src="uploads/<?php echo $img['albumPath'];?>" alt=""/> &nbsp;&nbsp;
					                        			</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">是否上架</td>
					                        			<td>11
					                        			</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">是否热卖</td>
					                        			<td>
					                        				11
					                        			</td>
					                        		</tr>
					                        	</table>
					                        	<span style="display:block;width:80%; ">
					                        	商品描述<br/>
					                        	
					                        	</span>
					                        </div> -->  
                                
                                </td>
                            </tr>
                            <%
                            }
                            	}
                            	sql="select count(id) from jzwx_pro";
                            	rs=st.executeQuery(sql);
                            	rs.next();
                            	int rowCount=rs.getInt(1);
                            	int pageCount=0;
                            	if(rowCount%10==0){
                            		pageCount=rowCount/10;
                            	}else{
                            		pageCount=rowCount/10+1;
                            	}
                             %>
                            <tr>
                            	<td colspan="7" align="center">
                            	<a href="listPro.jsp?page=1">[首页]</a>
										<%					
										if(nowPage>1){
											 %>
                    <a href="listPro.jsp?page=<%=nowPage-1 %>">[上一页]</a>
                    <%
										}
										else{
											%>
                    	<a href="listPro.jsp?page=1">[上一页]</a>
                    	<%
										}
											for(int i=1;i<=pageCount;i++)
											{
												%>
													<a href="listPro.jsp?page=<%=i %>">[<%=i %>]</a>
												<%
											}
											 if(nowPage<pageCount){
                    %>
                          <a href="listPro.jsp?page=<%=nowPage+1 %>">[下一页]</a>
                    <%
                    }
                     else{
                    	%>
                    	<a href="listPro.jsp?page=<%=pageCount %>">[下一页]</a>
                    	<%
                    }
                     %>
                    <a href="listPro.jsp?page=<%=pageCount %>">[尾页]</a><span style="float: right;">总共<%=pageCount %>页/当前是第<%=nowPage %>页</span>
                    <%
										 %>	
										 							
								</td>
                            </tr>
                        </tbody>

                    </table>
                    <%
                    	}catch(Exception e){
                    		e.printStackTrace();
                    	}
                     %>
                </div>

</body>
</html>
