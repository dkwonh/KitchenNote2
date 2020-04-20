<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/KitchenNote2/assets/css/main.css" />
<title>회원 가입</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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


</script>
</head>
<body>
<div id="main">
		<div class="inner" style="margin-top: 100px">
	<div style="margin: 0 auto; margin-top: 100px;" class="text-center" align="center">
		<h1>회원가입</h1>
	</div>
	<div class="6u u5">
	<br>
	<div style="padding: 15px; margin: 0 auto; max-width: 700px">

		<form name="memChk" action="mem.do" onsubmit="return checkId()" Method="post">
			<table width="600" height="400" align="center" cellspacing="0">
				<tr height="10" align="center">
				</tr>

				<tr>
					<td><b>Email:</b></td>
					<!-- name="e_id" -->
					<td><input type="text" id="member_id" name="member_id"
						maxlength="45" placeholder=" ex)your@email.com" />
						<button type="button" id="em_Chk" name="em_Chk"
							value="N" OnClick="fn_emChk()">중복확인</button>
							<!-- <button type="button" id="email2" name="email2"
							value="N" OnClick="fn_email()">이메일인증</button> -->
							 <!--  <input type="hidden" name="idDuplicateion" value="idUnCheck"> --></td>
				</tr>
				<tr>
					<td><b>PW:</b></td>
					<td><input type="password" id="pw" name="password"
						maxlength="20"  placeholder=" ※8~20자의 영문 대소문자와 숫자로만 입력" /></td>
				</tr>
				<tr>
					<td><b>PW:</b></td>
					<td><input type="password" id="pw2" name="password2"
						maxlength="20" /></td>
				</tr>
				<tr>
					<td><b>NickName:</b></td>
					<td><input type="text" id="nickname" name="nickname"
						maxlength="45" />
						<button type="button" id="nick2" name="nickname2" value="N"
							OnClick="nickChk()">중복확인</button> <!-- <input type="hidden" name="nickDuplicateion" value="nameUnCheck"> --></td>
				</tr>

			</table>
			<br>
			<!-- 버튼 -->
			<div width="400" height="50" align="center" cellspacing="0">
				<tbody>
					<div height="10" align="center">
						<input type="submit" value="회원 가입">
						<input type="reset" name="reset" value="다시 입력">
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