<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
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
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	$("#btnExit").click(function() {
		var content = $("#content").val();
		var password = $("#password").val();
		
		if (password == "") {
			alert("비밀번호를 입력하세요.");
			document.form2.password.focus();
			return;
		} else {
			confirm("탈퇴 하시면 복구가 불가 합니다."
					 +"그래도 하시겠습니까?");
			document.form2.action = "Withdrawal.do";
			document.form2.submit();
		}	
	});
});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<header id="header">
				<a href="#" class="KitchenNote"><strong>Kitchen</strong>Note</a>
				<section id="search" class="alt 4u 12u$">
					<form method="post">
						<input name="search" id="query" type="text">
					</form>
				</section>
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span
							class="label">Instagram</span></a></li>
				</ul>
			</header>
			<div class="navi c">
				<input type="button" value="카테고리"> <input type="button"
					value="레시피"> <input type="button" value="이벤트"> <input
					type="button" value="고객센터"><br>
			</div>
			<hr>
			<form method="post" name="form2">
			<h2>회원 탈퇴</h2>
			<br>
			<div>
				비밀번호 : <input type="password" id="password" name="password"
					placeholder="비밀번호를 입력하여 주세요.">
			</div>
			<br>
			<div>
				탈퇴 사유 :
				<textarea name="content" id="content" cols="80" rows="8"
					placeholder="탈퇴 사유를 입력하여주세요. 불만스러운 사항이 있다면 개선해 나가도록 하겠습니다."></textarea>
			</div>
			<hr>
			<button type="button" name="btnExit" id="btnExit">탈퇴</button>
			<button type="button" name="btnCancel" id="btnCancel">취소</button>

			</form>

			<div id="sidebar">
				<div class="inner">
					<nav id="menu">
						<h2>마이 페이지</h2>
						<image src="#">
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
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="../assets/js/main.js"></script>
</body>
</html>