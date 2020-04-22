<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/KitchenNote2/assets/css/main.css" />
<meta charset="UTF-8">
<title>로그인</title>
<style>
.u5 {
	margin: auto;
}

@font-face {
	font-family: 'BBTreeTR';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeTR.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
} /* 패스워드 폰트 */
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

#pw {
	font-family: 'BBTreeTR';
}

td b{
font-size: 15pt;
}
input{
font-size: 13pt;
color: #3d4449;
}
</style>
<script type="text/javascript">
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

function Login(){
        var form = document.login1;
        var e_Chk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        var email = document.getElementById("id").value;

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

               if (form.password.value.length <8 || form.password.value.length > 20)
               {
                    alert("비밀번호는 8~20자 이내로 입력 가능 합니다!");

                    form.password.select();
                    return;
               }

      form.submit();
      }

//비밀번호 찾기창
function open_pw(){
	window.open("pwFind.do", "비밀번호 찾기","scrollbars=no,resizable=no,width=510,height=400").close;
}


</script>
</head>
<body>
	<c:if test="${NOT==0}">
		<script>
     		alert("로그인에 실패했습니다. 다시로그인 해주세요.");
     		<% session.invalidate(); %>
		</script>
	</c:if>
	<div id="main">
		<div class="inner">
			<%@ include file="../homepage/head.jsp"%>
			<div class="text-center" align="center">
				<h1 style="margin-top: 0.5em">로그인</h1>
			</div>
			<div class="4u u5">
				<br>
				<form name="login1" action="login2.do" style="margin:0;">
					<table align="center" cellspacing="0">
						
						<!-- 로그인 -->
						<tr>
							<td style="width:50px"><b>Email</b></td>
							<td>
							<input type="text" id="id" name="member_id" maxlength="45" placeholder="E-mail" />
							</td>
						</tr>
						<tr>
							<td><b>PW</b></td>
							<td><input type="password"
								 id="pw" name="password"
								maxlength="20" placeholder="PW" /></td>
						</tr>
					</table>
					<!-- 버튼 -->
					<div class="8u" style="margin: auto;"> 
					<input class="special fit"id="log_btn" type="button" value="로그인 " onclick="Login();"/></div>
				</form>
				<div class="8u" style="margin: auto;">
				<button class="6u" id="mem_btn"
						onclick="location.href='memberForm.do'" style="float:left;" >회원가입</button> 
				<button class="6u" onclick="open_pw()" style="float:right;">비밀번호 찾기</button>
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