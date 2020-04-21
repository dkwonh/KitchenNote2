<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/KitchenNote2/assets/css/main.css" />
<title>이메일 인증</title>
<style>
.u5 {
	margin: auto;
}

@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#main * {
	font-family: 'Cafe24Oneprettynight';
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	//확인버튼 누르면 실행
	function fn_close() {
		var form = document.form3;

		//생성된 인증번호
		var data = document.getElementById("checkMail").value;

		//인증번호가 비어있다면
		if (form.chkNum.value == "") {
			alert("인증번호를 입력해야합니다!");
			form.chkNum.focus();
			return false;
		}
		//인증번호가 같지 않으면
		if (form.chkNum.value != data) {
			alert("인증번호가 틀립니다!");
			form.chkNum.focus();
			return false;
		}
		//인증번호가 같다면
		if (form.chkNum.value == data) {
			alert("확인되었습니다");
			opener.document.getElementById('checkM').value = "YES"
		    
			self.close();

		}

	}

	//이메일 보내기 컨트롤러 호출
	function fn_sendmail() {
		var data = "";

		$.ajax({
			url : "sendMail.do",
			type : "post",
			dataType : "text",
			async : false,
			data : "member_id=" + $("#member_id").val(),
			error : function(e) {
				alert("실패했습니다");
				console.log(e);
			},
			success : function(data) {
				alert("메일을 확인해주세요.");
				document.getElementById("checkMail").value = data;
				console.log(document.getElementById("checkMail").value);
			}
		});
	}
</script>
</head>
<body class="text-center">
	<div id="main">
		<div class="inner" style="margin-top: 30px;">
			<div style="margin: 0 auto; margin-top: 0px;" align="center">
				<h2>메일인증</h2>
			</div>
			<div class="7u u5">
				<br>

				<div style="padding: 5px; margin: 0 auto; max-width: 500px">
					<br>
					<!-- 인증번호 보내기 하면 이메일 보냄 -->
					<form name="form3" action="sendMail.do" align="center">
						<table align="center" cellspacing="0">							
							<!-- 이메일 -->
							<tr>
								<td><b>Email</b></td>
								<td><input type="text" style="width: 300px" id="member_id"
									name="member_id" maxlength="45" class="form-control"
									value="${param.email}" /></td>
							</tr>
							<tr>
								<td><b>인증번호</b></td>
								<td><input type="text" style="width: 300px" id="chkNum"
									name="chkNum" maxlength="12" class="form-control"
									placeholder="인증번호를 입력해주세요" /> <input type="hidden"
									id="checkMail" value="0"></td>
							</tr>
						</table>
						<br>
						<!-- 버튼 -->
						<!-- 짧은버튼 -->
						<div width="200" height="30" align="center" cellspacing="0">
							<tbody>

								<div style="padding-left: 30px">
									<button type="button" onclick="fn_sendmail()" style="margin-right:15px;">인증번호 받기</button>
									<input type="button" value="확인" onclick="fn_close()" style="margin-left:15px;">
								</div>
							</tbody>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="/KitchenNote2/assets/js/jquery.min.js"></script>
	<script src="/KitchenNote2/assets/js/skel.min.js"></script>
	<script src="/KitchenNote2/assets/js/util.js"></script>
	<script src="/KitchenNote2/assets/js/main.js"></script>
</body>
</html>