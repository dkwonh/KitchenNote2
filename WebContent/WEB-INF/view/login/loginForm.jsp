<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
#log_btn {
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 30px;
}

#mem_btn {
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-right: 30px;
}

</style>
<script type="text/javascript">
function Login(){
        var form = document.login1;
        var e_Chk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        var email = document.getElementById("id").value;
        var pw_Chk = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,20}$/; //  8 ~ 10자 영문, 숫자 조합
        var passwd = document.getElementById("pw").value;

               //아이디에서 입력 필수 조건문
               if (form.member_id.value == ""){
                       alert("이메일을 입력하세요!");
                       form.member_id.focus();//포커스를 id박스로 이동.
                       return;
               }
               if(e_Chk.test(email)==false){      
                   alert("이메일형식이 올바르지 않습니다.");
                   form.member_id.focus();
                   return false;
               } 

               if (form.password.value == ""){
                    alert("패스워드를 입력하세요!");
                    form.password.focus();//포커스를 Password박스로 이동.
                    return;
               }
               /* if(pw_Chk.test(passwd)==false){      
                   alert("비밀번호 형식이 올바르지 않습니다.");
                   form.password.focus();
                   return false;
               } 

               if (form.password.value.length <8 || form.password.value.length > 20)
               {
                    alert("비밀번호는 4~20자 이내로 입력 가능 합니다!");

                    form.password.select();
                    return;
               } */

      form.submit();
      }
function open_pw(){
	window.open("pwFind.do", "비밀번호 찾기","scrollbars=no,resizable=no,width=500,height=400").close;
}


</script>
</head>
<body>
	<div class="text-center" align="center">
		<h1>로그인</h1>
	</div>
	<br>
	<div>
		<br>
		<form name="login1" action="login2.do">
			<table width="400" height="100" align="center" cellspacing="0">
				<tr height="10" align="center">
				</tr>

				<!-- 로그인 -->
				<tr>
					<td><b>Email:</b></td>
					<td><input type="text" style="width: 430px" id="id"
						name="member_id" maxlength="45" placeholder="E-mail" /></td>
				</tr>
				<tr>
					<td><b>PW:</b></td>
					<td><input type="password" style="width: 430px" id="pw"
						name="password" maxlength="20" placeholder="PW" /></td>
				</tr>
			</table>
			<br>
			<!-- 버튼 -->
			<div width="400" height="50" align="center">
			    <input id="mem_btn" type="button" value="회원가입" onclick="location.href='memberForm.do'" />
				<input id="log_btn" type="button" value="로그인 " onclick="Login();" />
				</div>
				<br>
				<div height="10" align="center">
				<button onclick="open_pw()">비밀번호 찾기</button>
			</div>
		</form>
	</div>
</body>
</html>