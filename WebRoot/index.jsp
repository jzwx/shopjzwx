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
<title>小星电子商城欢迎您!</title>
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
				<a href="#" class="collection">收藏小星星网站</a>
			</div>
			<div class="rightArea">
						<%
				String user11=(String)session.getAttribute("user11");
				if(user11==null){
				 %>
				欢迎来到小星站点！<a href="Login.jsp" class="">[登录]</a><a href="reg.jsp" class="">[免费注册]</a>
				<%
					}
					else{
				 %>
				 	欢迎<%=user11 %>来到小星站点！<a href="Login.jsp" class="">[退出]</a><a href="reg.jsp" class="">[免费注册]</a>
				 <%
				 }
				  %>
			</div>
		</div>
	</div>
	<div class="logoBar">
		<div class="comWidth">
			<div class="logo fl">
				<a href="#"><img src="images/logo.jpg" alt="慕课网"></a>
			</div>
			<div class="search_box fl">
				<input type="text" class="search_text fl"/>
				<input type="button" value="搜 索" class="search_btn fr"/>
			</div>
			<div class="shopCar fr">
				<span class="shopText fl">购物车</span>
				<span class="shopNum fl">0</span>
			</div>
		</div>
	</div>
	<div class="navBox">
		<div class="comWidth">
			<div class="shopClass fl">
				<h3>全部商品分类<i></i></h3>
				<div class="shopClass_show">
					<dl class="shopClass_item">
						<dt><a href="#" class="b">手机</a> <a href="#" class="b">数码</a> <a href="#" class="aLink">合约机</a></dt>
						<dd><a href="#" class="c">荣耀3X</a> <a href="#" class="c">单反</a> <a href="#" class="c">智能设备 </a></dd>
					</dl>
					<dl class="shopClass_item">
						<dt><a href="#" class="b">电脑</a> <a href="#" class="b">硬件外设</a> <a href="#" class="aLink">装机宝</a></dt>
						<dd><a href="#" class="c">笔记本</a> <a href="#" class="c">台式机</a> <a href="#" class="c">超极本 </a><a href="#" class="c">平板</a></dd>
					</dl>
					<dl class="shopClass_item">
						<dt><a href="#" class="b">大家电</a></dt>
						<dd><a href="#" class="c">电视</a> <a href="#" class="c">空调</a> <a href="#" class="c">冰箱 </a> <a href="#" class="c">洗衣机</a></dd>
					</dl>
					<dl class="shopClass_item">
						<dt><a href="#" class="b">厨房电器</a> <a href="#" class="b">生活电器</a></dt>
						<dd><a href="#" class="c">空气净化器</a> <a href="#" class="c">微波炉</a> <a href="#" class="c">取暖设备</a></dd>
					</dl>
					<dl class="shopClass_item">
						<dt><a href="#" class="b">食品</a>/<a href="#" class="b">饮料</a>/<a href="#" class="b">生鲜</a> <a href="#" class="aLink">粮油</a></dt>
						<dd><a href="#" class="c">进口</a> <a href="#" class="c">方便面</a> <a href="#" class="c">零食 </a> <a href="#" class="c">保健 </a></dd>
					</dl>
				</div>
			</div>
			<ul class="nav fl">
				<li><a href="#">数码城</a></li>
				<li><a href="#">天黑黑</a></li>
				<li><a href="#">团购</a></li>
				<li><a href="#">发现</a></li>
				<li><a href="#">二手特卖</a></li>
				<li><a href="#">名品会</a></li>
			</ul>
		</div>
	</div>
</div>
<!--主窗口FLASH图片切换-->
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
			<p>产品宣传图</p>
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
<!--第一个-->
<div class="shopTit comWidth">
	<span class="icon"></span><h3><%=rs.getString(2) %></h3>
	<a href="#" class="more">更多&gt;&gt;</a>
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
				<p><%=rs1.getDouble(6) %>元</p>
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
					<h3><%=rs2.getDouble(6) %>元</h3>
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
<!--第二个-->
<!--  <div class="shopTit comWidth">
	<span class="icon"></span><h3>食品酒水</h3>
	<a href="#" class="more">更多&gt;&gt;</a>
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
				<h3>三月美食狂享购</h3>
				<p>50元</p>
			</div>
			<div class="shop_item">
				<div class="shop_img">
					<a href="#"><img src="images/shopImg_05.jpg" alt="2"/></a>
				</div>
				<h3>三月美食狂享购</h3>
				<p>40元</p>
			</div>
			<div class="shop_item">
				<div class="shop_img">
					<a href="#"><img src="images/shopImg_05.jpg" alt="3"/></a>
				</div>
				<h3>三月美食狂享购</h3>
				<p>20元</p>
			</div>
			<div class="shop_item">
				<div class="shop_img">
					<a href="#"><img src="images/shopImg_05.jpg" alt="4"/></a>
				</div>
				<h3>三月美食狂享购</h3>
				<p>80元</p>
			</div>
		</div>
		<div class="shopList_sm clearfix">
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="#"><img src="images/shopImg_06.jpg" alt="1"/></a>
				</div>
				<div class="shopItem_text">
					<p>康比特 维他保咀嚼片 60片</p>
					<h3>￥600.00</h3>
				</div>
			</div>
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="#"><img src="images/shopImg_07.jpg" alt="2"/></a>
				</div>
				<div class="shopItem_text">
					<p>康比特 维他保咀嚼片 40片</p>
					<h3>￥400.00</h3>
				</div>
			</div>
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="#"><img src="images/shopImg_08.jpg" alt="3"/></a>
				</div>
				<div class="shopItem_text">
					<p>康比特 维他保咀嚼片 20片</p>
					<h3>￥200.00</h3>
				</div>
			</div>
			<div class="shopItem_sm">
				<div class="shopItem_smImg">
					<a href="#"><img src="images/shopImg_09.jpg" alt="4"/></a>
				</div>
				<div class="shopItem_text">
					<p>康比特 维他保咀嚼片 10片</p>
					<h3>￥100.00</h3>
				</div>
			</div>
		</div>
	</div>
</div>
-->

<!--第二个结束-->
<div class="hr_25"></div>
<div class="footer">
	<p><a href="">慕课简介</a><i>|</i><a href="">慕课公告</a><i>|</i><a href="">招纳贤士</a><i>|</i><a href="">联系我们</a><i>|</i>客服热线：400-675-1234</p>
	<p>Copyright &copy; 2006 - 2014 慕课版权所有&nbsp;&nbsp;&nbsp;京ICP备09037834号&nbsp;&nbsp;&nbsp;京ICP证B1034-8373号&nbsp;&nbsp;&nbsp;某市公安局XX分局备案编号：123456789123</p>
	<p class="web"><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a></p>
</div>

</body>
</html>
