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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
<link rel="stylesheet" type="text/css" href="styles.css">
-->
<title>登录</title>
<link type="text/css" rel="stylesheet" href="style/reset.css"/> 
<link type="text/css" rel="stylesheet" href="style/main.css"/>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript" src="js/ie6Fixpng.js"></script>
<![endif]-->
</head>

<body>
<div class="headerBar">
	
	<div class="logoBar login_logo">
		<div class="comWidth">
			<div class="logo fl">
				<a href="#"><img src="images/logo.jpg" alt="慕课网"></a>
			</div>
			<h3 class="welcome_title">欢迎登录</h3>
		</div>
	</div>
</div>

<div class="loginBox">
<form action="login.bin" method="post">
	<div class="login_cont">
		<ul class="login">
			<li class="l_tit">邮箱/用户名/已验证手机</li>
			<li class="mb_10"><input type="text" name="user" class="login_input user_icon"/></li>
			<li class="l_tit">密码</li>
			<li class="mb_10"><input type="password" name="passwd" class="login_input passwd_icon"/></li>
			<li class="autoLogin"><input type="checkbox" id="a1" class="checked"/><label for="a1" class="l">自动登录</label><input type="checkbox" id="a2" class="checked"/><label for="a2" class="l">安全控件登录</label><a href="#" class="nopasswd">忘记密码?</a></li>
			<li><input type="submit" value="" class="login_btn"/></li>
		</ul>
		<div class="login_Partners">
			<p class="l_tit">使用合作方账号登录网站</p>
			<ul class="login_list clearfix">
				<li><a href="#">QQ</a></li>
				<li><span>|</span></li>
				<li><a href="#">网易</a></li>
				<li><span>|</span></li>			
				<li><a href="#">新浪微博</a></li>
				<li><span>|</span></li>			
				<li><a href="#">腾讯微博</a></li>
				<li><span>|</span></li>			
				<li>更多</li>
			</ul>
		</div>
	</div>
	<a class="reg_link" href="reg.jsp"></a>
</div>
</form>
<div class="hr_25"></div>
<div class="footer">
	<p><a href="">慕课简介</a><i>|</i><a href="">慕课公告</a><i>|</i><a href="">招纳贤士</a><i>|</i><a href="">联系我们</a><i>|</i>客服热线：400-675-1234</p>
	<p>Copyright &copy; 2006 - 2014 慕课版权所有&nbsp;&nbsp;&nbsp;京ICP备09037834号&nbsp;&nbsp;&nbsp;京ICP证B1034-8373号&nbsp;&nbsp;&nbsp;某市公安局XX分局备案编号：123456789123</p>
	<p class="web"><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a></p>
</div>

</body>
</html>
