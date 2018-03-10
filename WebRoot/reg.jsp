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
<title>注册</title>
<link type="text/css" rel="stylesheet" href="style/reset.css"/> 
<link type="text/css" rel="stylesheet" href="style/main.css"/>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript" src="js/ie6Fixpng.js"></script>
<![endif]-->
</head>

<body>
<div class="headerBar">
	
	<div class="logoBar reg_logo">
		<div class="comWidth">
			<div class="logo fl">
				<a href="#"><img src="images/logo.jpg" alt="慕课网"></a>
			</div>
			<h3 class="welcome_title">欢迎注册</h3>
		</div>
	</div>
</div>

<div class="regBox">
	<div class="login_cont">
	<form name="f1" action="reg.bin" method="post">
		<ul class="login">
			<li><span class="reg_item"><i>*</i>账户名:</span><div class="input_item"><input type="text" name="user" class="login_input user_icon"/></div></li>
			<li><span class="reg_item"><i>*</i>请设置密码:</span><div class="input_item"><input type="password" name="passwd" class="login_input passwd_icon"/></div></li>
			<li><span class="reg_item"><i>*</i>请确认密码:</span><div class="input_item"><input type="password" name="passwd1" class="login_input passwd_icon"/></div></li>
			<li><span class="reg_item"><i>*</i>&nbsp;&nbsp;邮箱:</span><div class="input_item"><input type="text" name="email" class="login_input passwd_icon"/></div></li>
			<li><span class="reg_item"><i>*</i>&nbsp;&nbsp;性别:</span><div class="input_item" style="position:relative;top:10px;"><input type="radio" checked="checked" name="sex" value="0"/>男
			<input type="radio" name="sex" value="1"/>女<input type="radio" name="sex" value="2"/>保密
			</div></li>
			<li><span class="reg_item"><i>*</i>&nbsp;&nbsp;地址:</span><div class="input_item"><input type="text" name="adr" class="login_input passwd_icon"/></div></li>
			<li class="autoLogin"><span class="reg_item">&nbsp;</span><input type="checkbox" id="t1" class="checked"/><label for="t1">我已阅读并同意</label><a href="#"><font color="#0066FF">《用户注册协议》</font></a></li>
			<li><span class="reg_item">&nbsp;</span><input type="submit" value="" class="submit_btn"/></li>
		</ul>
	</form>
	</div>
</div>

<div class="hr_25"></div>
<div class="footer">
	<p><a href="">慕课简介</a><i>|</i><a href="">慕课公告</a><i>|</i><a href="">招纳贤士</a><i>|</i><a href="">联系我们</a><i>|</i>客服热线：400-675-1234</p>
	<p>Copyright &copy; 2006 - 2014 慕课版权所有&nbsp;&nbsp;&nbsp;京ICP备09037834号&nbsp;&nbsp;&nbsp;京ICP证B1034-8373号&nbsp;&nbsp;&nbsp;某市公安局XX分局备案编号：123456789123</p>
	<p class="web"><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a></p>
</div>

</body>
</html>
