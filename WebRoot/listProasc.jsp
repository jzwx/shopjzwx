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
		if(window.confirm("��ȷ��Ҫɾ������һ�β��ף���ɾ����ϧ!")){
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
                            <input type="button" value="��&nbsp;&nbsp;��" class="add" onclick="addPro()">
                        </div>
                        <div class="fr">
                            <div class="text">
                                <span>��Ʒ�۸�</span>
                                <div class="bui_select">
                                    <select id="select" class="select" onchange="change(this.value)">
                                    	<option>-��ѡ��-</option>
                                        <option value="iPrice asc" >�ɵ͵���</option>
                                        <option value="iPrice desc">�ɸߵ���</option>
                                    </select>
                                </div>
                            </div>
                            <div class="text">
                                <span>�ϼ�ʱ�䣺</span>
                                <div class="bui_select">
                                 <select id="" class="select" onchange="change(this.value)">
                                 	<option>-��ѡ��-</option>
                                        <option value="pubTime desc" >���·���</option>
                                        <option value="pubTime asc">��ʷ����</option>
                                    </select>
                                </div>
                            </div>
                            <div class="text">
                                <span>����</span>
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
                    <!--���-->
                    <table class="table" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th width="10%">���</th>
                                <th width="20%">��Ʒ����</th>
                                <th width="10%">��Ʒ����</th>
                                <th width="10%">�Ƿ��ϼ�</th>
                                <th width="15%">�ϼ�ʱ��</th>
                                <th width="10%">Ľ�μ۸�</th>
                                <th>����</th>
                            </tr>
                        </thead>
   
                        <tbody>
                       <%
                       	for(int i=0;i<10;i++){
                       	if(rs.next()){
                        %>
                            <tr>
                                <!--�����id��for�����c1 ��Ҫѭ������-->
                                <td><%=rs.getString(1) %></td>
                                <td><%=rs.getString(2) %></td>
                                <td><%=rs.getString(12) %></td>
                                <td><%=rs.getString(10) %></td>
                                 <td><%=rs.getString(9) %></td>
                                  <td><%=rs.getString(6) %></td>
                                  
                                <td align="center">
                                				<input type="button" value="����" class="btn" onclick="showDetail(<%=rs.getString(1) %>)"><input type="button" value="�޸�" class="btn" onclick="editPro(<%=rs.getString(1) %>)"><input type="button" value="ɾ��" class="btn"onclick="delPro(<%=rs.getString(1) %>)">
					            <!--                 <div id="showDetail" style="display:none;">
					                        	
					                        	<table class="table" cellspacing="0" cellpadding="0">
					                        		<tr>
					                        			<td width="20%" align="right">��Ʒ����</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">��Ʒ���</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">��Ʒ����</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">��Ʒ����</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td  width="20%"  align="right">��Ʒ�۸�</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td  width="20%"  align="right">Ļ�����۸�</td>
					                        			<td>11</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">��ƷͼƬ</td>
					                        			<td>
					                        			11<img width="100" height="100" src="uploads/<?php echo $img['albumPath'];?>" alt=""/> &nbsp;&nbsp;
					                        			</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">�Ƿ��ϼ�</td>
					                        			<td>11
					                        			</td>
					                        		</tr>
					                        		<tr>
					                        			<td width="20%"  align="right">�Ƿ�����</td>
					                        			<td>
					                        				11
					                        			</td>
					                        		</tr>
					                        	</table>
					                        	<span style="display:block;width:80%; ">
					                        	��Ʒ����<br/>
					                        	
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
                            	<a href="listPro.jsp?page=1">[��ҳ]</a>
										<%					
										if(nowPage>1){
											 %>
                    <a href="listPro.jsp?page=<%=nowPage-1 %>">[��һҳ]</a>
                    <%
										}
										else{
											%>
                    	<a href="listPro.jsp?page=1">[��һҳ]</a>
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
                          <a href="listPro.jsp?page=<%=nowPage+1 %>">[��һҳ]</a>
                    <%
                    }
                     else{
                    	%>
                    	<a href="listPro.jsp?page=<%=pageCount %>">[��һҳ]</a>
                    	<%
                    }
                     %>
                    <a href="listPro.jsp?page=<%=pageCount %>">[βҳ]</a><span style="float: right;">�ܹ�<%=pageCount %>ҳ/��ǰ�ǵ�<%=nowPage %>ҳ</span>
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
