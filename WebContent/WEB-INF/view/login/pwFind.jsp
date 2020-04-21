<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function fn_pwfind() {
		var form = document.pwfind;
		var em_Chk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var eFind = document.getElementById("member_id").value;

		if (form.member_id.value == "") {
			alert("이메일을 입력하세요.");
			form.member_id.focus();
			return false;
		}
		if (em_Chk.test(eFind) == false) {
			alert("이메일형식이 올바르지 않습니다.");
			form.member_id.focus();
			return false;
		}
		if (!form.EMchk.value) {
			alert("이메일 체크를 해주세요.")
			return false;
		}
	}
	/* 이메일 있는지 확인 */
	function fn_m_Chk() {
		$.ajax({
			url : "emChk.do",
			type : "post",
			dataType : "json",
			data : {
				"member_id" : $("#member_id").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("회원인 이메일 입니다.");
					$("#EMchk").attr("value", "Y");
				} else if (data == 0) {
					alert("해당이메일이 존재하지 않습니다");
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="#" align="center">
		<h1>비밀번호 찾기</h1>
	</div>
	<br>

	<form name="pwfind" class="#" action="find_pass.do"
		onsubmit="return fn_pwfind()" method="post">
		<div align="center">
			<label class="#">키친노트 계정</label>
			<div class="#">
				<input type="text" id="member_id" name="member_id" maxlength="45"
					placeholder="이메일을 작성해주세요">
			</div>
		</div>

		<div class="#">
			<!-- style="margin-left: 30%" -->
			<!-- Button -->
			<br>
			<div width="400" height="50" align="center">
				<button type="button" id="EMchk" name="EMchk" value=""
					OnClick=" fn_m_Chk()">이메일 체크</button>
				<input type="submit" value="이메일 보내기">
			</div>
		</div>
		<br>
		<div class="#">
			<div class="#">
				<div align="center"
					style="border-top: 1px solid #888; width: 450px; margin: 20px auto; padding-top: 15px; font-size: 85%">
					가입하신 이메일로 임시비밀번호를 전송해드리겠습니다.</div>
			</div>
		</div>
	</form>
</body>
</html>