<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shopjzwx.DataBase"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>С�ǵ����̳ǻ�ӭ��!</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="style/reset.css"/> 
<link type="text/css" rel="stylesheet" href="style/main.css"/>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript" src="js/ie6Fixpng.js"></script>
<![endif]-->
</head>

<body>
<div class="headerBar">
	<div class="topBar">
		<div class="comWidth">
			<div class="leftArea">	
				<a href="#" class="collection">�ղ�С������վ</a>
			</div>
			<div class="rightArea">
						<%
				String user11=(String)session.getAttribute("user11");
				if(user11==null){
				 %>
				��ӭ����С��վ�㣡<a href="Login.jsp" class="">[��¼]</a><a href="reg.jsp" class="">[���ע��]</a>
				<%
					}
					else{
				 %>
				 	��ӭ<%=user11 %>����С��վ�㣡<a href="Login.jsp" class="">[�˳�]</a><a href="reg.jsp" class="">[���ע��]</a>
				 <%
				 }
				  %>
			</div>
		</div>
	</div>
	<div class="logoBar">
		<div class="comWidth">
			<div class="logo fl">
				<a href="#"><img src="images/logo.jpg" alt="Ľ����"></a>
			</div>
			<div class="search_box fl">
				<input type="text" class="search_text fl"/>
				<input type="button" value="�� ��" class="search_btn fr"/>
			</div>
			<div class="shopCar fr">
				<span class="shopText fl">���ﳵ</span>
				<span class="shopNum fl">0</span>
			</div>
		</div>
	</div>
	<div class="navBox">
		<div class="comWidth">
			<div class="shopClass fl">
				<h3>ȫ����Ʒ����<i></i></h3>
				<div class="shopClass_show">
					<dl class="shopClass_item">
						<dt><a href="#" class="b">�ֻ�</a> <a href="#" class="b">����</a> <a href="#" class="aLink">��Լ��</a></dt>
						<dd><a href="#" class="c">��ҫ3X</a> <a href="#" class="c">����</a> <a href="#" class="c">�����豸 </a></dd>
					</dl>
					<dl class="shopClass_item">
						<dt><a href="#" class="b">����</a> <a href="#" class="b">Ӳ������</a> <a href="#" class="aLink">װ����</a></dt>
						<dd><a href="#" class="c">�ʼǱ�</a> <a href="#" class="c">̨ʽ��</a> <a href="#" class="c">������ </a><a href="#" class="c">ƽ��</a></dd>
					</dl>
					<dl class="shopClass_item">
						<dt><a href="#" class="b">��ҵ�</a></dt>
						<dd><a href="#" class="c">����</a> <a href="#" class="c">�յ�</a> <a href="#" class="c">���� </a> <a href="#" class="c">ϴ�»�</a></dd>
					</dl>
					<dl class="shopClass_item">
						<dt><a href="#" class="b">��������</a> <a href="#" class="b">�������</a></dt>
						<dd><a href="#" class="c">����������</a> <a href="#" class="c">΢��¯</a> <a href="#" class="c">ȡů�豸</a></dd>
					</dl>
					<dl class="shopClass_item">
						<dt><a href="#" class="b">ʳƷ</a>/<a href="#" class="b">����</a>/<a href="#" class="b">����</a> <a href="#" class="aLink">����</a></dt>
						<dd><a href="#" class="c">����</a> <a href="#" class="c">������</a> <a href="#" class="c">��ʳ </a> <a href="#" class="c">���� </a></dd>
					</dl>
				</div>
			</div>
			<ul class="nav fl">
				<li><a href="#">�����</a></li>
				<li><a href="#">��ں�</a></li>
				<li><a href="#">�Ź�</a></li>
				<li><a href="#">����</a></li>
				<li><a href="#">��������</a></li>
				<li><a href="#">��Ʒ��</a></li>
			</ul>
		</div>
	</div>
</div>
<!--������FLASHͼƬ�л�-->
<div class="banner comWidth clearfix">
	<div class="banner_bar banner_big">
		<ul class="imgBox">
			<li><a href="#"><img src="images/banner/banner_01.jpg" alt="banner"/></a></li>
			<li><a href="#"><img src="images/banner/banner_02.jpg" alt="banner"/></a></li>
		</ul>
		<div class="imgNum">
			<a href="#" class="active"></a><a href="#"></a><a href="#"></a><a href="#"></a><a href="#"></a>
		</div>
		<div class="font">
			<p>��Ʒ����ͼ</p>
		</div>
	</div>
</div>

<%
	try{
	DataBase db=new DataBase();
	Connection cn=db.getConnection();
	Statement st=cn.createStatement();
	String sql="select * from jzwx_cate";
	ResultSet rs=st.executeQuery(sql);
	while(rs.next()){
 %>
<!--��һ��-->
<div class="shopTit comWidth">
	<span class="icon"></span><h3><%=rs.getString(2) %></h3>
	<a href="#" class="more">����&gt;&gt;</a>
</div>
<div class="shopList comWidth clearfix">
	<div class="leftArea">
		<div class="banner_bar banner_sm">
			<ul class="imgBox">
				<li><a href="#"><img src="images/banner/banner_sm_01.jpg" alt="banner"/></a></li>
				<li><a href="#"><img src="images/banner/banner_sm_02.jpg" alt="banner"/></a></li>
			</ul>
			<div class="imgNum">
				<a href="#" class="active"></a><a href="#"></a><a href="#"></a>
			</div>
		</div>
	</div>
	<div class="rightArea">
		<div class="shopList_top clearfix">
		
		
			<%
		Statement st1=cn.createStatement();
		String sql1="select * from jzwx_pro where cId="+rs.getInt(1)+" limit 4";
		ResultSet rs1=st1.executeQuery(sql1);
		while(rs1.next()){
	 %>
			<div class="shop_item">
				<div class="shop_img">
					<a href="proDetails.jsp?id=<%=rs1.getString(1) %>&cId=<%=rs1.getString(12) %>" target="_blank"><img height="200px" width="187px" src="<%=rs1.getString(8) %>" alt="1"/></a>
				</div>
				<h5><%=rs1.getString(2) %></h5>
				<p><%=rs1.getDouble(6) %>Ԫ</p>
			</div>
		<%
		}
		 %>
		 
		</div>

		
		
		<div class="shopList_sm clearfix">
		<%
			Statement st2=cn.createStatement();
			String sql2="select * from jzwx_pro where id>8 and cId="+rs.getInt(1)+" limit 4";
			ResultSet rs2=st2.executeQuery(sql2);
			while(rs2.next()){
		 %>
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="proDetails.jsp?id=<%=rs2.getString(1) %>&cId=<%=rs2.getString(12) %>" target="_blank"><img src="<%=rs2.getString(8) %>" alt="NFC"/></a>
				</div>
				<div class="shopItem_text">
					<p style="font-size:10px;"><%=rs2.getString(2) %></p>
					<h3><%=rs2.getDouble(6) %>Ԫ</h3>
				</div>
			</div>
			
			
		<%
			}
		 %>
		</div>
	</div>
</div>

<%

}
	}catch(Exception e){
		e.printStackTrace();
	}
 %>
<!--�ڶ���-->
<!--  <div class="shopTit comWidth">
	<span class="icon"></span><h3>ʳƷ��ˮ</h3>
	<a href="#" class="more">����&gt;&gt;</a>
</div>
<div class="shopList comWidth clearfix">
	<div class="leftArea">
		<div class="banner_bar banner_sm">
			<ul class="imgBox">
				<li><a href="#"><img src="images/banner/banner_sm_02.jpg" alt="banner"/></a></li>
				<li><a href="#"><img src="images/banner/banner_sm_01.jpg" alt="banner"/></a></li>
			</ul>
			<div class="imgNum">
				<a href="#" class="active"></a><a href="#"></a><a href="#"></a>
			</div>
		</div>
	</div>
	<div class="rightArea">
		<div class="shopList_top clearfix">
			<div class="shop_item">
				<div class="shop_img">
					<a href="#"><img src="images/shopImg_05.jpg" alt="1"/></a>
				</div>
				<h3>������ʳ����</h3>
				<p>50Ԫ</p>
			</div>
			<div class="shop_item">
				<div class="shop_img">
					<a href="#"><img src="images/shopImg_05.jpg" alt="2"/></a>
				</div>
				<h3>������ʳ����</h3>
				<p>40Ԫ</p>
			</div>
			<div class="shop_item">
				<div class="shop_img">
					<a href="#"><img src="images/shopImg_05.jpg" alt="3"/></a>
				</div>
				<h3>������ʳ����</h3>
				<p>20Ԫ</p>
			</div>
			<div class="shop_item">
				<div class="shop_img">
					<a href="#"><img src="images/shopImg_05.jpg" alt="4"/></a>
				</div>
				<h3>������ʳ����</h3>
				<p>80Ԫ</p>
			</div>
		</div>
		<div class="shopList_sm clearfix">
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="#"><img src="images/shopImg_06.jpg" alt="1"/></a>
				</div>
				<div class="shopItem_text">
					<p>������ ά�����׽�Ƭ 60Ƭ</p>
					<h3>��600.00</h3>
				</div>
			</div>
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="#"><img src="images/shopImg_07.jpg" alt="2"/></a>
				</div>
				<div class="shopItem_text">
					<p>������ ά�����׽�Ƭ 40Ƭ</p>
					<h3>��400.00</h3>
				</div>
			</div>
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="#"><img src="images/shopImg_08.jpg" alt="3"/></a>
				</div>
				<div class="shopItem_text">
					<p>������ ά�����׽�Ƭ 20Ƭ</p>
					<h3>��200.00</h3>
				</div>
			</div>
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="#"><img src="images/shopImg_09.jpg" alt="4"/></a>
				</div>
				<div class="shopItem_text">
					<p>������ ά�����׽�Ƭ 10Ƭ</p>
					<h3>��100.00</h3>
				</div>
			</div>
		</div>
	</div>
</div>
-->

<!--�ڶ�������-->
<div class="hr_25"></div>
<div class="footer">
	<p><a href="">Ľ�μ��</a><i>|</i><a href="">Ľ�ι���</a><i>|</i><a href="">������ʿ</a><i>|</i><a href="">��ϵ����</a><i>|</i>�ͷ����ߣ�400-675-1234</p>
	<p>Copyright &copy; 2006 - 2014 Ľ�ΰ�Ȩ����&nbsp;&nbsp;&nbsp;��ICP��09037834��&nbsp;&nbsp;&nbsp;��ICP֤B1034-8373��&nbsp;&nbsp;&nbsp;ĳ�й�����XX�־ֱ�����ţ�123456789123</p>
	<p class="web"><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a></p>
</div>

</body>
</html>
