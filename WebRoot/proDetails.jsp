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
<title>��Ʒ����</title>
<link type="text/css" rel="stylesheet" href="style/reset.css"/> 
<link type="text/css" rel="stylesheet" href="style/main.css"/>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript" src="js/ie6Fixpng.js"></script>
<![endif]-->
</head>

<body class="grey">
<div class="headerBar">
	<div class="topBar">
		<div class="comWidth">
			<div class="leftArea">	
				<a href="#" class="collection">�ղ�С������վ</a>
			</div>
			<div class="rightArea">
				��ӭ����С��վ�㣡<a href="#" class="">[��¼]</a><a href="#" class="">[���ע��]</a>
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
				<div class="shopClass_show hide">
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
<%
	int id=Integer.parseInt(request.getParameter("id"));
	int cId=Integer.parseInt(request.getParameter("cId"));
	try{
	DataBase db=new DataBase();
	Connection cn=db.getConnection();
	Statement st=cn.createStatement();
	String sql="select * from jzwx_cate where id="+cId;
	ResultSet rs=st.executeQuery(sql);
	if(rs.next()){
	Statement st1=cn.createStatement();
	String sql1="select * from jzwx_pro where id="+id;
	ResultSet rs1=st1.executeQuery(sql1);
	if(rs1.next()){
 %>
<div class="userPosition comWidth">
	<strong><a href="#">��ҳ</a></strong>
	<span>&nbsp;&gt;&nbsp;</span>
	<a href="#"><%=rs.getString(2) %></a>
<!--  	<span>&nbsp;&gt;&nbsp;</span>
	<a href="#">Apple ƻ��</a>-->
	<span>&nbsp;&gt;&nbsp;</span>
	<em><%=rs1.getString(3) %></em>
</div>
<div class="description_info comWidth">
	<div class="description clearfix">
		<div class="leftArea">
			<div class="description_imgs">
				<div class="big">
					<img width="309" height="397" src="<%=rs1.getString(8) %>" alt=""/>
				</div>
	<!-- 		<ul class="des_sming clearfix">
					<li><a href="#"><img src="images/des_sm.jpg" class="active" alt=""/></a></li>
					<li><a href="#"><img src="images/des_sm2.jpg" class="active" alt=""/></a></li>
					<li><a href="#"><img src="images/des_sm.jpg" class="active" alt=""/></a></li>
					<li><a href="#"><img src="images/des_sm2.jpg" class="active" alt=""/></a></li>
					<li><a href="#"><img src="images/des_sm.jpg" class="active" alt=""/></a></li>
				</ul> -->
			</div>
		</div>

		<div class="rightArea">
			<div class="des_content">
				<h3 class="des_content_tit"><%=rs1.getString(2) %></h3>
				<div class="dl clearfix">
					<div class="dt">Ľ�μ�</div>
					<div class="dd"><span class="des_money"><em>��</em><%=rs1.getDouble(6) %></span></div>
				</div>
				<div class="dl clearfix">
					<div class="dt">�Ż�</div>
					<div class="dd"><span class="hg"><i class="hg_icon">������</i><em>��ipad�Ӽ��Żݹ������USB������</em></span></div>
				</div>
				<div class="des_position">
					<div class="dl clearfix">
							<div class="dt">�͵�</div>
							<div class="dd">
							<div class="select">
							<h3>�������廷��</h3><span></span>
							<ul class="show_select">
							<li>�ϵ�</li>
							<li>�����</li>
							<li>�����</li>
							</ul>	
							</div>
							<span class="theGoods">�л�,�ɵ��ճ���</span>
							</div>
					</div>
								<div class="dl clearfix">
							<div class="dt colorSelect">ѡ����ɫ</div>
							<div class="dd clearfix">
								<div class="des_item des_item_active">
									WIFI 16GB
								</div>
								<div class="des_item">
									WIFI 16GB
								</div>
								<div class="des_item">
									WIFI 16GB
								</div>
							</div>
							</div>
					<div class="dl clearfix">
							<div class="dt colorSelect des_select_more">ѡ��汾</div>
							<div class="dd clearfix ">
								<div class="des_item des_item_active des_item_sm">
									WIFI 16GB
								</div>
								<div class="des_item des_item_sm">
									WIFI 16GB +3G
								</div>
								<div class="des_item des_item_sm">
									WIFI +3G
								</div>
										<div class="des_item des_item_sm">
									WIFI 16GB +3G
								</div>
								<div class="des_item des_item_sm">
									WIFI +3G
								</div>
									<div class="des_item des_item_sm">
									WIFI +3G
								</div>
										<div class="des_item des_item_sm">
									WIFI 16GB +3G
								</div>
								<div class="des_item des_item_sm">
									WIFI +3G
								</div>
							</div>
							</div>
							<div class="dl">
						<div class="dt des_num">����</div>
						<div class="dd clearfix">
							<div class="des_number">
								<div class="reduction">-</div>
								<div class="des_input">
									<input type="text"/>
								</div>
								<div class="plus">+</div>
							</div>
							<span class="xg">�޹�<em>9</em>��</span>
						</div>
					</div>
				</div>
				<div class="des_select">
					��ѡ��<span>"��ɫ|WIFI 16G"</span>
				</div>
				<div class="shop_buy">
					<a href="#" class="shopping_btn"></a>
					<span class="line"></span>
					<a href="#" class="buy_btn"></a>
				</div>
				<div class="notes">
					ע��:����Ʒ���ṩ��ͨ��Ʊ,���ṩ��ֵ˰��Ʊ��
				</div>
				</div>
				
				</div>
			</div>
		</div>
	</div>
</div>
<%
}
}
	}catch(Exception e){
		e.printStackTrace();
	}
 %>
<div class="hr_15"></div>
<div class="des_info comWidth clearfix">
	<div class="leftArea">
		<div class="recommend">
			<h3 class="tit">ͬ��λ</h3>
			
			
			
			<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">���ֽ������ֽ������ֽ������ֽ������ֽ������ֽ���</a></p>
					<p class="money">��888</p>
				</div>
			</div>
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">���ֽ������ֽ������ֽ������ֽ������ֽ������ֽ���</a></p>
					<p class="money">��888</p>
				</div>
			</div>
			
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">���ֽ������ֽ������ֽ������ֽ������ֽ������ֽ���</a></p>
					<p class="money">��888</p>
				</div>
			</div>
			
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">���ֽ������ֽ������ֽ������ֽ������ֽ������ֽ���</a></p>
					<p class="money">��888</p>
				</div>
			</div>
			
		</div>
		<div class="hr_15"></div>
		<div class="recommend">
			<h3 class="tit">���˻���</h3>

			<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">���ֽ������ֽ������ֽ������ֽ������ֽ������ֽ���</a></p>
					<p class="money">��888</p>
				</div>
			</div>
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">���ֽ������ֽ������ֽ������ֽ������ֽ������ֽ���</a></p>
					<p class="money">��888</p>
				</div>
			</div>
			
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">���ֽ������ֽ������ֽ������ֽ������ֽ������ֽ���</a></p>
					<p class="money">��888</p>
				</div>
			</div>
			
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">���ֽ������ֽ������ֽ������ֽ������ֽ������ֽ���</a></p>
					<p class="money">��888</p>
				</div>
			</div>
			
		</div>
	</div>
	<div class="rightArea">
		<div class="des_infoContent">
			<ul class="des_tit">
				<li class="active"><span>��Ʒ����</span></li>
				<li><span>��Ʒ����(123213)</span></li>
			</ul>
			<div class="ad">
			<a href="#"><img src="images/ad.jpg" /></a>
			</div>
			<div class="info_text">
				<div class="info_tit">
				<h3>ǿ���Ƽ�</h3><h4>��������,��ѡ</h4>
				</div>
				<p>
				��������mini�ĺ�ʱ�򣡻������ֱ��,��ƻ��Ʒ�ʲ���!ɱ���󼸺�ȫί��ǰ�����UI������Ŷ�һ�ȥ����������ǰ�����𱣻������UI�������
				������������Ⱦ��������������Ⱦ��������Ⱦ����Ϊ����Ⱦ����������w���������
				</p>
				<div class="hr_45"></div>
				<div class="info_tit">
				<h3>ǿ���Ƽ�</h3><h4>��������,��ѡ</h4>
				</div>
				<p>
				��������mini�ĺ�ʱ�򣡻������ֱ��,��ƻ��Ʒ�ʲ���!ɱ���󼸺�ȫί��ǰ�����UI������Ŷ�һ�ȥ����������ǰ�����𱣻������UI�������
				������������Ⱦ��������������Ⱦ��������Ⱦ����Ϊ����Ⱦ����������w���������
				</p>
				<div class="hr_45"></div>
				<img src="images/pad.jpg"  class="center"/>
				<div class="hr_45"></div> 
			</div>
		</div>
		<div class="hr_15"></div>
		<div class="des_infoContent">
			<h3 class="shopDes_tit">��Ʒ����</h3>
			<div class="score_box clearfix">
				<div class="score">
					<span>4.7</span><em>��</em>
				</div>
				<div class="score_speed">
					<ul class="score_speed_text">
						<li class="speed_01">�ǳ�������</li>
						<li class="speed_02">������</li>
						<li class="speed_03">һ��</li>
						<li class="speed_04">����</li>
						<li>�ǳ�����</li>
					</ul>
					<div class="score_num">
						4.7<i></i>
					</div>
					<p>��18939λĽ�����Ѳ�������</p>
				</div>
			</div>
			<div class="review_tab">
				<ul class="review fl">
					<li><a href="#" class="active">ȫ��</a></li>
					<li><a href="#">����(6545)</a></li>
					<li><a href="#">һ��(4545)</a></li>
					<li><a href="#">������(5455)</a></li>
				</ul>
				<div class="review_sort fr">
					<a href="#" class="review_time">ʱ������</a><a href="#" class="review_reco">�Ƽ�����</a>
				</div>
			</div>
			<div class="review_listBox">
			<div class="review_list clearfix">
					<div class="review_userHead fl">
					<div class="review_user">
						<img src="images/userhead.jpg" alt="" />
						<p>61***42</p>
						<p>��ɫ��Ա</p>
					</div>
				</div>
			<div class="review_cont">
					<div class="review_t clearfix">
							<div class="startsBox fl"><span class="stars"></span><span class="stars"></span><span class="stars"></span><span class="stars"></span><span class="stars"></span></div>
					<span class="stars_text fl">5�� ����</span>
					</div>
					<p>ͦ�����,����Ľ��ͦ�����,����Ľ��</p>
					<p><a href="#" class="ding">��(0)</a><a href="#" class="cai">��(0)</a></p>
				</div>
				
			</div>	
			
				<div class="review_list clearfix">
					<div class="review_userHead fl">
					<div class="review_user">
						<img src="images/userhead.jpg" alt="" />
						<p>61***42</p>
						<p>��ɫ��Ա</p>
					</div>
				</div>
			<div class="review_cont">
					<div class="review_t clearfix">
							<div class="startsBox fl"><span class="stars"></span><span class="stars"></span><span class="stars"></span><span class="stars"></span><span class="stars"></span></div>
					<span class="stars_text fl">5�� ����</span>
					</div>
					<p>ͦ�����,����Ľ��ͦ�����,����Ľ��</p>
					<p><a href="#" class="ding">��(0)</a><a href="#" class="cai">��(0)</a></p>
				</div>
				
			</div>	
			</div>
			
			<div class="hr_25"></div>
		<div class="page">
		<a href="#">��һҳ</a><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><span class="hl">....</span><a href="#">20</a><a href="#">��һҳ</a><span class="morePage">��20ҳ,����</span><input type="text" class="pageNum"/><span class="ye">ҳ</span><input type="button" value="ȷ��" class="page_btn"/>
		</div>
		<div class="hr_25"></div>
		</div>
		
		
	</div>
</div>
<!--�ڶ�������-->
<div class="hr_25"></div>
<div class="footer">
	<p><a href="">Ľ�μ��</a><i>|</i><a href="">Ľ�ι���</a><i>|</i><a href="">������ʿ</a><i>|</i><a href="">��ϵ����</a><i>|</i>�ͷ����ߣ�400-675-1234</p>
	<p>Copyright &copy; 2006 - 2014 Ľ�ΰ�Ȩ����&nbsp;&nbsp;&nbsp;��ICP��09037834��&nbsp;&nbsp;&nbsp;��ICP֤B1034-8373��&nbsp;&nbsp;&nbsp;ĳ�й�����XX�־ֱ�����ţ�123456789123</p>
	<p class="web"><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a></p>
</div>

</body>
</html>

