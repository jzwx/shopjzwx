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
<title>商品介绍</title>
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
				<a href="#" class="collection">收藏小星星网站</a>
			</div>
			<div class="rightArea">
				欢迎来到小星站点！<a href="#" class="">[登录]</a><a href="#" class="">[免费注册]</a>
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
				<div class="shopClass_show hide">
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
	<strong><a href="#">首页</a></strong>
	<span>&nbsp;&gt;&nbsp;</span>
	<a href="#"><%=rs.getString(2) %></a>
<!--  	<span>&nbsp;&gt;&nbsp;</span>
	<a href="#">Apple 苹果</a>-->
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
					<div class="dt">慕课价</div>
					<div class="dd"><span class="des_money"><em>￥</em><%=rs1.getDouble(6) %></span></div>
				</div>
				<div class="dl clearfix">
					<div class="dt">优惠</div>
					<div class="dd"><span class="hg"><i class="hg_icon">满换购</i><em>购ipad加价优惠够配件或USB充电插座</em></span></div>
				</div>
				<div class="des_position">
					<div class="dl clearfix">
							<div class="dt">送到</div>
							<div class="dd">
							<div class="select">
							<h3>海淀区五环内</h3><span></span>
							<ul class="show_select">
							<li>上帝</li>
							<li>五道口</li>
							<li>红旗街</li>
							</ul>	
							</div>
							<span class="theGoods">有货,可当日出货</span>
							</div>
					</div>
								<div class="dl clearfix">
							<div class="dt colorSelect">选择颜色</div>
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
							<div class="dt colorSelect des_select_more">选择版本</div>
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
						<div class="dt des_num">数量</div>
						<div class="dd clearfix">
							<div class="des_number">
								<div class="reduction">-</div>
								<div class="des_input">
									<input type="text"/>
								</div>
								<div class="plus">+</div>
							</div>
							<span class="xg">限购<em>9</em>件</span>
						</div>
					</div>
				</div>
				<div class="des_select">
					已选择<span>"白色|WIFI 16G"</span>
				</div>
				<div class="shop_buy">
					<a href="#" class="shopping_btn"></a>
					<span class="line"></span>
					<a href="#" class="buy_btn"></a>
				</div>
				<div class="notes">
					注意:此商品可提供普通发票,不提供增值税发票。
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
			<h3 class="tit">同价位</h3>
			
			
			
			<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">文字介绍文字介绍文字介绍文字介绍文字介绍文字介绍</a></p>
					<p class="money">￥888</p>
				</div>
			</div>
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">文字介绍文字介绍文字介绍文字介绍文字介绍文字介绍</a></p>
					<p class="money">￥888</p>
				</div>
			</div>
			
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">文字介绍文字介绍文字介绍文字介绍文字介绍文字介绍</a></p>
					<p class="money">￥888</p>
				</div>
			</div>
			
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">文字介绍文字介绍文字介绍文字介绍文字介绍文字介绍</a></p>
					<p class="money">￥888</p>
				</div>
			</div>
			
		</div>
		<div class="hr_15"></div>
		<div class="recommend">
			<h3 class="tit">看了还买</h3>

			<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">文字介绍文字介绍文字介绍文字介绍文字介绍文字介绍</a></p>
					<p class="money">￥888</p>
				</div>
			</div>
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">文字介绍文字介绍文字介绍文字介绍文字介绍文字介绍</a></p>
					<p class="money">￥888</p>
				</div>
			</div>
			
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">文字介绍文字介绍文字介绍文字介绍文字介绍文字介绍</a></p>
					<p class="money">￥888</p>
				</div>
			</div>
			
			
						<div class="item">
				<div class="item_cont">
						<div class="img_item">
						<a href="#"><img src="images/shopImg.jpg" alt=""/></a>
					</div>
					<p><a href="">文字介绍文字介绍文字介绍文字介绍文字介绍文字介绍</a></p>
					<p class="money">￥888</p>
				</div>
			</div>
			
		</div>
	</div>
	<div class="rightArea">
		<div class="des_infoContent">
			<ul class="des_tit">
				<li class="active"><span>产品介绍</span></li>
				<li><span>商品评价(123213)</span></li>
			</ul>
			<div class="ad">
			<a href="#"><img src="images/ad.jpg" /></a>
			</div>
			<div class="info_text">
				<div class="info_tit">
				<h3>强烈推荐</h3><h4>货比三家,海选</h4>
				</div>
				<p>
				现在是买mini的好时候！换代清仓直降,但苹果品质不变!杀跌后几乎全委会前王企鹅UI武器和哦我回去武器二级胸前金额比起保护入耳额UI侮辱别人
				额外热温热污染二额外热舞热污染额外热污染我认为热污染玩儿温柔玩儿w额外任务二
				</p>
				<div class="hr_45"></div>
				<div class="info_tit">
				<h3>强烈推荐</h3><h4>货比三家,海选</h4>
				</div>
				<p>
				现在是买mini的好时候！换代清仓直降,但苹果品质不变!杀跌后几乎全委会前王企鹅UI武器和哦我回去武器二级胸前金额比起保护入耳额UI侮辱别人
				额外热温热污染二额外热舞热污染额外热污染我认为热污染玩儿温柔玩儿w额外任务二
				</p>
				<div class="hr_45"></div>
				<img src="images/pad.jpg"  class="center"/>
				<div class="hr_45"></div> 
			</div>
		</div>
		<div class="hr_15"></div>
		<div class="des_infoContent">
			<h3 class="shopDes_tit">商品评价</h3>
			<div class="score_box clearfix">
				<div class="score">
					<span>4.7</span><em>分</em>
				</div>
				<div class="score_speed">
					<ul class="score_speed_text">
						<li class="speed_01">非常不满意</li>
						<li class="speed_02">不满意</li>
						<li class="speed_03">一般</li>
						<li class="speed_04">满意</li>
						<li>非常满意</li>
					</ul>
					<div class="score_num">
						4.7<i></i>
					</div>
					<p>共18939位慕课网友参与评分</p>
				</div>
			</div>
			<div class="review_tab">
				<ul class="review fl">
					<li><a href="#" class="active">全部</a></li>
					<li><a href="#">满意(6545)</a></li>
					<li><a href="#">一般(4545)</a></li>
					<li><a href="#">不满意(5455)</a></li>
				</ul>
				<div class="review_sort fr">
					<a href="#" class="review_time">时间排序</a><a href="#" class="review_reco">推荐排序</a>
				</div>
			</div>
			<div class="review_listBox">
			<div class="review_list clearfix">
					<div class="review_userHead fl">
					<div class="review_user">
						<img src="images/userhead.jpg" alt="" />
						<p>61***42</p>
						<p>金色会员</p>
					</div>
				</div>
			<div class="review_cont">
					<div class="review_t clearfix">
							<div class="startsBox fl"><span class="stars"></span><span class="stars"></span><span class="stars"></span><span class="stars"></span><span class="stars"></span></div>
					<span class="stars_text fl">5分 满意</span>
					</div>
					<p>挺不错的,信赖慕课挺不错的,信奈慕课</p>
					<p><a href="#" class="ding">顶(0)</a><a href="#" class="cai">踩(0)</a></p>
				</div>
				
			</div>	
			
				<div class="review_list clearfix">
					<div class="review_userHead fl">
					<div class="review_user">
						<img src="images/userhead.jpg" alt="" />
						<p>61***42</p>
						<p>金色会员</p>
					</div>
				</div>
			<div class="review_cont">
					<div class="review_t clearfix">
							<div class="startsBox fl"><span class="stars"></span><span class="stars"></span><span class="stars"></span><span class="stars"></span><span class="stars"></span></div>
					<span class="stars_text fl">5分 满意</span>
					</div>
					<p>挺不错的,信赖慕课挺不错的,信奈慕课</p>
					<p><a href="#" class="ding">顶(0)</a><a href="#" class="cai">踩(0)</a></p>
				</div>
				
			</div>	
			</div>
			
			<div class="hr_25"></div>
		<div class="page">
		<a href="#">上一页</a><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><span class="hl">....</span><a href="#">20</a><a href="#">下一页</a><span class="morePage">共20页,到第</span><input type="text" class="pageNum"/><span class="ye">页</span><input type="button" value="确定" class="page_btn"/>
		</div>
		<div class="hr_25"></div>
		</div>
		
		
	</div>
</div>
<!--第二个结束-->
<div class="hr_25"></div>
<div class="footer">
	<p><a href="">慕课简介</a><i>|</i><a href="">慕课公告</a><i>|</i><a href="">招纳贤士</a><i>|</i><a href="">联系我们</a><i>|</i>客服热线：400-675-1234</p>
	<p>Copyright &copy; 2006 - 2014 慕课版权所有&nbsp;&nbsp;&nbsp;京ICP备09037834号&nbsp;&nbsp;&nbsp;京ICP证B1034-8373号&nbsp;&nbsp;&nbsp;某市公安局XX分局备案编号：123456789123</p>
	<p class="web"><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a></p>
</div>

</body>
</html>

