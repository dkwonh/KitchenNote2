<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/KitchenNote2/assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>회원 가입</title>
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

@font-face {
	font-family: 'BBTreeTR';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeTR.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
} /* 패스워드 폰트 */
#main * {
	font-family: 'Cafe24Oneprettynight';
}

td b {
	font-size: 15pt;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


function checkId(){
	var form = document.memChk;
	var e_Chk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	var email = document.getElementById("member_id").value;  
	var pw_Chk = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,20}$/; //  8 ~ 20자 영문, 숫자 조합
    var passwd = document.getElementById("pw").value;


	if(form.member_id.value ==""){
		alert("이메일을 입력하세요.");
		form.member_id.focus();
		return false;
		}
	if(e_Chk.test(email)==false){      
        alert("이메일형식이 올바르지 않습니다.");
        form.member_id.focus();
        return false;
    } 
	
	if(form.em_Chk.value =='N'){
		alert("이메일 중복체크를 해주세요.")
		return false; 
		}

	if(form.chkMail.value == ""){
		alert("이메일 인증을 해주세요.")
		return false; 
		}
	
	if(form.pw.value == ""){
		alert("패스워드를 입력하세요.");
		form.pw.focus();
		return false;
		}
	
	if(pw_Chk.test(passwd)==false){      
        alert("비밀번호 형식이 올바르지 않습니다.");
        form.password.focus();
        return false;
    } 
    
	if(form.pw.value.length < 8 || form.pw.value.length > 20){
		 alert("비밀번호는 8~20자 이내로 입력 가능 합니다!");
                         form.pw.select();
                         return false;
                        }
    if(form.pw.value != form.pw2.value){
    	alert("패스워드를 동일하게 입력하세요.");
		form.pw2.focus();
		return false;
		}
if(form.nickname.value ==""){
		alert("닉네임을 입력하세요.");
		form.nickname.focus();
		return false;
		}
		//console.log(form.nickname2.value)
if(form.nickname2.value == 'N'){
	alert("닉네임 중복체크를 해주세요.")
	return false;
	}
/* form.submit(); */
	
}

/* 아이디 중복창 */
function fn_emChk(){
    $.ajax({
       url : "emChk.do",
       type : "post",
       dataType : "json",
       data : {"member_id" : $("#member_id").val()},
       success : function(data){
          if(data == 1){
             alert("중복된 이메일 입니다.");
          }else if(data == 0){
             $("#em_Chk").attr("value", "Y");
             alert("사용가능한 이메일 입니다.");
          }
       }
    });
 }

/* 닉네임 중복창 */
function nickChk(){
    $.ajax({
       url : "nkChk.do",
       type : "get",
       dataType : "json",
       data : {"nickname" : $("#nickname").val()},
       success : function(data){
          if(data == 1){
             alert("중복된 닉네임 입니다.");
          }else if(data == 0){
             $("#nick2").attr("value", "Y");
             alert("사용가능한 닉네임 입니다.");
          }
          console.log($("#nick2").attr("value"))
       }
    });
 }

//이메일 인증번호 받기
function fn_email(){
	   var windowObj;
       var email = document.getElementById('member_id').value;
     
     var settings ='scrollbars=no,resizable=no,width=600,height=400';
         /* 'toolbar=yes,directories=yes,status=yes,menubar=no,scrollbars=auto,resizable=no,height=400,width=400,left=0,top=0' */
      // 자식창을 열고 자식창의 window 객체를 windowObj 변수에 저장
      windowObj = window.open("<%=request.getContextPath()%>/login/emailCode.do?email="+email,"인증받기",settings);
}

</script>
</head>
<body>
	<div id="main">
		<div class="inner">
			<%@ include file="../homepage/head.jsp"%>
			<div class="text-center" align="center">
				<h1 style="margin: 0.5em auto;">회원가입</h1>
			</div>
			<div class="5u u5">
				<form name="memChk" action="mem.do" onsubmit="return checkId()"
					Method="post">
					<table width="600" height="300" align="center" cellspacing="0">
						<tr height="10" align="center">
						</tr>

						<tr>
							<td><b>Email</b></td>
							<!-- name="e_id" -->
							<td><input type="text" style="width: 250px;" id="member_id"
								name="member_id" maxlength="45" placeholder=" ex)your@email.com" /></td>
							<td><button type="button" id="em_Chk" name="em_Chk"
									value="N" OnClick="fn_emChk()">중복확인</button></td>
							<td><button type="button" id="email2" name="email2" value=""
									OnClick="fn_email()">이메일인증</button> <input type="hidden"
								name="chkMail" id="checkM" value=""></td>
						</tr>
						<tr>
							<td><b>PW</b></td>
							<td colspan="3"><input type="password"
								style="width: 350px; font-family: 'BBTreeTR';" id="pw"
								name="password" maxlength="20"
								placeholder="8~20자의 영문 대소문자와 숫자로만 입력하세요." /></td>
						</tr>
						<tr>
							<td><b>PW</b></td>
							<td colspan="3"><input type="password"
								style="width: 350px; font-family: 'BBTreeTR';" id="pw2"
								name="password2" maxlength="20" /></td>
						</tr>
						<tr>
							<td><b>NickName</b></td>
							<td colspan="2"><input type="text" style="width: 350px;"
								id="nickname" name="nickname" maxlength="45" />
							<td><button type="button" id="nick2" name="nickname2"
									value="N" OnClick="nickChk()">중복확인</button></td>
						</tr>

					</table>
					<!-- 버튼 -->
					<div class="8u" style="margin: auto;">
						<div align="center">
							<input class="special" type="submit" value="회원 가입"
								style="float: left;"> <input type="reset" name="reset"
								value="다시 입력" style="float: right;">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="/KitchenNote2/assets/js/jquery.min.js"></script>
	<script src="/KitchenNote2/assets/js/skel.min.js"></script>
	<script src="/KitchenNote2/assets/js/util.js"></script>
	<script src="/KitchenNote2/assets/js/main.js"></script>
</body>
</html>