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
<title>��¼</title>
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
				<a href="#"><img src="images/logo.jpg" alt="Ľ����"></a>
			</div>
			<h3 class="welcome_title">��ӭ��¼</h3>
		</div>
	</div>
</div>

<div class="loginBox">
<form action="login.bin" method="post">
	<div class="login_cont">
		<ul class="login">
			<li class="l_tit">����/�û���/����֤�ֻ�</li>
			<li class="mb_10"><input type="text" name="user" class="login_input user_icon"/></li>
			<li class="l_tit">����</li>
			<li class="mb_10"><input type="password" name="passwd" class="login_input passwd_icon"/></li>
			<li class="autoLogin"><input type="checkbox" id="a1" class="checked"/><label for="a1" class="l">�Զ���¼</label><input type="checkbox" id="a2" class="checked"/><label for="a2" class="l">��ȫ�ؼ���¼</label><a href="#" class="nopasswd">��������?</a></li>
			<li><input type="submit" value="" class="login_btn"/></li>
		</ul>
		<div class="login_Partners">
			<p class="l_tit">ʹ�ú������˺ŵ�¼��վ</p>
			<ul class="login_list clearfix">
				<li><a href="#">QQ</a></li>
				<li><span>|</span></li>
				<li><a href="#">����</a></li>
				<li><span>|</span></li>			
				<li><a href="#">����΢��</a></li>
				<li><span>|</span></li>			
				<li><a href="#">��Ѷ΢��</a></li>
				<li><span>|</span></li>			
				<li>����</li>
			</ul>
		</div>
	</div>
	<a class="reg_link" href="reg.jsp"></a>
</div>
</form>
<div class="hr_25"></div>
<div class="footer">
	<p><a href="">Ľ�μ��</a><i>|</i><a href="">Ľ�ι���</a><i>|</i><a href="">������ʿ</a><i>|</i><a href="">��ϵ����</a><i>|</i>�ͷ����ߣ�400-675-1234</p>
	<p>Copyright &copy; 2006 - 2014 Ľ�ΰ�Ȩ����&nbsp;&nbsp;&nbsp;��ICP��09037834��&nbsp;&nbsp;&nbsp;��ICP֤B1034-8373��&nbsp;&nbsp;&nbsp;ĳ�й�����XX�־ֱ�����ţ�123456789123</p>
	<p class="web"><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a><a href="#"><img src="images/webLogo.jpg" alt="logo"/></a></p>
</div>

</body>
</html>
