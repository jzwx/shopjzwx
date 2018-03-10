<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.shopjzwx.DataBase"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>-.-</title>
<link rel="stylesheet" href="style/backstage.css">
<script type="text/javascript">

	function addAdmin(){
		window.location="addCate.jsp";	
	}
	function editCate(id){
		window.location="editCate.jsp?id="+id;	
	}
	function delCate(id){
		if(confirm("确认删除吗?"))
		{
			window.location="delCate.bin?id="+id;
			return ;
		}
		else
		{
			return ;
		}
	}
</script>
</head>

<body>
 <div class="details">
                    <div class="details_operation clearfix">
                        <div class="bui_select">
                            <input type="button" value="添&nbsp;&nbsp;加" class="add"  onclick="addAdmin()">
                        </div>
                         </div>
                         <%
                         	int n=10;
                         	try
                         	{
                         		DataBase db=new DataBase();
                         		Connection cn=db.getConnection();
                         		Statement st=cn.createStatement();
                         		String	sql="select * from jzwx_cate";
                         		ResultSet rs=st.executeQuery(sql);
                         		int nowPage=1;
                         		String page1=request.getParameter("page");
                         		try
                         		{
	                         		if(page1!=null)
	                         		{
	                         			nowPage=Integer.parseInt(page1);
	                         		}
	                         	}catch(Exception e){
	                         		e.printStackTrace();
	                         	}
	                         	for(int i=0;i<(nowPage-1)*n;i++){
	                         		rs.next();
	                         	}
                          %>
                    <!--表格-->
                    <table class="table" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th width="25%">编号</th>
                                <th width="25%">分类</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        	for(int i=0;i<n;i++)
                        	{
                        	if(rs.next()){
                         %>
                            <tr>
                                <td><%=rs.getString(1) %></td>
                                <td><%=rs.getString(2) %></td>
                                <td align="center"><input type="button" value="修改" class="btn" onclick="editCate(<%=rs.getString(1) %>)"><input type="button" value="删除" class="btn"  onclick="delCate(<%=rs.getString(1) %>)"></td>
                            </tr>
                          <%
                          }
                          	}
                           %>
                        </tbody>
                    </table>
                         <div align="center">
                    <a href="listCate.jsp?page=1">[首页]</a>
                    <%
                    	    sql="select count(id) from jzwx_cate";
                            rs=st.executeQuery(sql);
                            rs.next();
                            int rowCount=rs.getInt(1);
                            //System.out.println(rowCount);
                            int pageCount=0;
                            if(rowCount%n==0)
                            {
                            	pageCount=rowCount/n;
                            }else{
                            	pageCount=rowCount/n+1;
                            }
                    	if(nowPage>1){
                     %>
                    <a href="listCate.jsp?page=<%=nowPage-1 %>">[上一页]</a>
                    <%
                    }
                    else
                    {
                    	%>
                    	<a href="listCate.jsp?page=1">[上一页]</a>
                    	<%
                    }
                    for(int i=1;i<=pageCount;i++)
                    {
                    	%>
                    		<a href="listCate.jsp?page=<%=i%>">[<%=i %>]</a>
                    	<%
                    }
                    if(nowPage<pageCount){
                    %>
                          <a href="listCate.jsp?page=<%=nowPage+1 %>">[下一页]</a>
                    <%
                    }
                    else{
                    	%>
                    	<a href="listCate.jsp?page=<%=pageCount %>">[下一页]</a>
                    	<%
                    }
                    %>
                    <a href="listCate.jsp?page=<%=pageCount %>">[尾页]</a><span style="float: right;">总共<%=pageCount %>页/当前是第<%=nowPage %>页</span>
                    <%
                    }catch(Exception e)
                    {
                    	e.printStackTrace();
                    }
                     %>
                </div>
                </div>
</body>
</html>