<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>자주 묻는 질문/FAQ</title>
<style type="text/css">
.navi input {
	float: left;
}

.c input {
	width: 25%
}

.searchbtn input {
	font-size: 15px;
	padding: 10px 10px
}
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.href = "chefApply.do?chef=test2@ki.com";
		});
		$("#btnPwd").click(function() {
			location.href = "changePwdView.do";
		});
		$("#btnDel").click(function() {
			location.href = "pwdCheck.do";
		});
		$("#btnChange").click(function() {
			var nickname = $("#nickname").val();
			var tel = $("#tel").val();
			var sns_address = $("#sns_address").val();

			if (nickname == "") {
				alert("닉네임을 입력하세요.");
				document.form2.nickname.focus();
				return;
			}
			if (tel == "") {
				alert("전화 번호를 입력하세요.");
				document.form2.tel.focus();
				return;
			}
			if (sns_address == "") {
				alert("SNS주소를 입력하세요.");
				document.form2.sns_address.focus();
				return;
			} else {
				confirm("저장 하시겠습니까?");
				document.form2.action = "changeUser.do";
				document.form2.submit();
			}
		});
	});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<a href="home.do" class="logo"><img
						src="../../../images/kitchennote-logo.png" width="300px"
						height=150px> KitchenNote</a>
					<section id=search class="alt 4u 12u$">
						<form method=post action=recipe.do>
							<input type=text name=search id=query placeholder="Search">
						</form>
					</section>
					<ul class="icons">
						<li class="out"><a href="login/loginForm.do"
							class="icon fa-sign-in"><span class=label> sign-in </span></a>
							<li class="in"><a href="login/logoutOk.do"
							class="icon fa-sign-out"><span class=label>
							sign-out
						</span></a>
						
						
						<li class="in"><a href=# class="icon fa-user"><span
								class="label">mypage</span></a></li>
								
						<li><a href=# class="icon fa-archive modal"><span
								class="label">nangbu</span></a></li>

						<li class="in"><a href="#" class="icon fa-edit"><span
								class="label">Facebook</span></a></li>
								
						<li class="admin"><a
							href="admin.do?pageNum=1&&filter=&&search="
							class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
					</ul>
				
				</header> 
				<div class="navi c">
								<input type="button" value="카테고리"> <input type="button"
									value="레시피"> <input type="button" value="이벤트"> <input
									type="button" value="고객센터"><br>
				</div>
				<hr>
				<h2>회원 정보 수정</h2>
				<img src="${picture }"></img>
				<form method="POST" name="form2">
					사진 바꾸기
					<button type="submit" value="첨부">첨부</button>
					<button type="button" id="btnWrite">쉐프 신청</button>
					<br>
					<div>
						닉네임 : <input type="text" id="nickname" name="nickname"
										value="${dto.nickname}">
					</div>
					<div>
						이메일 : <input type="text" id="chef" name="chef" value="${dto.chef}"
										readonly>
					</div>
					<div>
						연락처 : <input type="text" id="tel" name="tel" value="${dto.tel}">
					</div>
					<div>
						개인 SNS주소 : <input type="text" id="sns_address" name="sns_address"
										value="${dto.sns_address}">
					</div>
					<hr>
					<button type="button" id="btnChange">계정 정보 변경</button>
					<button type="button" id="btnPwd">비밀번호 바꾸기</button>
					<button type="button" id="btnDel">탈퇴 하기</button>
				</form>
			
						</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
				<header class="major">
					<h2>마이 페이지</h2>
					</header>
					<ul>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/FAQ.do"> -
								레시피</a></li>

						<li><a
							href="http://localhost:8082/KitchenNote/customer/list.do">-
								스크랩</a></li>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/write.do">-
								댓글</a></li>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/write.do">-
								알람</a></li>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/write.do">-
								결제 내역</a></li>
						<li><a
							href="http://localhost:8082/KitchenNote/myPage/memberInfo.do">-
								회원 정보 수정</a></li>

					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>