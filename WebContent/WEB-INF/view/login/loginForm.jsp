<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
function Login()
{
        var form = document.login1;

               //아이디에서 입력 필수 조건문
               if (form.member_id.value == "")
               {
                       alert("이메일을 입력하세요!");
                       form.member_id.focus();//포커스를 id박스로 이동.
                       return;
               }

               if (form.password.value == "")
               {
                    alert("패스워드를 입력하세요!");
                    form.password.focus();//포커스를 Password박스로 이동.
                    return;
               }

               if (form.password.value.length <4 || form.password.value.length > 20)
               {
                    alert("비밀번호는 4~20자 이내로 입력 가능 합니다!");

                    form.password.select();
                    return;
               }

      form.submit();
      }

</script>
</head>
<body>
	<div class="text-center">
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
			<div>
				<input type="button" value="로그인 " onclick="Login();" /> 
				<input type="button" value="회원가입" onclick="location.href='memberForm.do'" />
			</div>
		</form>
	</div>
</body>
</html>