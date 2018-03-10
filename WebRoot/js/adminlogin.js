function checkUser()
{
		var user=document.getElementById("adminuserid").value;
		var passwd=document.getElementById("adminpasswdid").value;
		if(user=="")
		{
			if(passwd=="")
			{
				alert("用户名密码不能为空");
			}
			else
			{
				alert("用户名不能为空");
			}
			return false;
		}
		else if(passwd=="")
		{
			if(user=="")
			{
				alert("用户名密码不能为空");
			}
			else
			{
				alert("密码不能为空");
			}
			return false;
		}
		else
		{
			document.getElementById("formid").submit();
			return true;
		}
}

function checkselect()
{
	if(document.getElementById("a1").checked==true)
	{
		alert("ok");
	}
}
