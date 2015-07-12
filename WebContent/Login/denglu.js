function CheckUser1(){
	var Name=document.getElementById("t1");
	var Psw=document.getElementById("t2");
	if(Name.value==""||Psw.value=="")
		{
	            alert("所有输入项都不能为空");
	           return false;
		}
}

function CheckUser2( ){
	var rName=document.getElementById("t3");
	var rPsw=document.getElementById("t4");
	var RName=document.getElementById("t5");
	var rTel=document.getElementById("t6");
	if(rName.value==""||rPsw.value==""||RName.value==""||rTel.value=="")
	{
	            alert("所有输入项都不能为空");
	           return false;
		}
}
