function checkUser()
{
		var user=document.getElementById("adminuserid").value;
		var passwd=document.getElementById("adminpasswdid").value;
		if(user=="")
		{
			if(passwd=="")
			{
				alert("�û������벻��Ϊ��");
			}
			else
			{
				alert("�û�������Ϊ��");
			}
			return false;
		}
		else if(passwd=="")
		{
			if(user=="")
			{
				alert("�û������벻��Ϊ��");
			}
			else
			{
				alert("���벻��Ϊ��");
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
