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
$(document).ready(function(){
	$("#btnsave").click(function(){
		var tel = $("#tel").val();
		var sns_address = $("#sns_address").val();
		var content = $("#content").val();

		if(tel == ""){
			alert("연락처를 입력하세요.");
			document.form1.tel.focus();
			return;
			}
		if(sns_address == ""){
			alert("SNS주소를 입력하세요.")
			document.form1.sns_address.focus();
			return;
			}
		if(content == ""){
			alert("신청 사유를 입력해주세요")
			document.form1.sns_address.focus();
			}
		});
	$("#btncancel").click(function(){
		document.form1.action = "MemberInfo.do"
			document.form1.submit();
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
			<h2>쉐프 신청하기</h2>
			<br>
			<div>
				연락처 : <input type="text"
					placeholder="승인여부를 안내 받으실 정확한 휴대전화 번호를  숫자로만 입력하여 주세요.">
			</div>
			<br>
			<div>
				개인 SNS 주소: <input type="text" palceholder="승인을 위한 간단한 확인 절차입니다.">
			</div>
			<br>
			<div>
				신청 이유(동기) :
				<textarea name="content" id="content" cols="80" rows="8"
					placeholder="신청 이유(동기)를 입력하여주세요."></textarea>
			</div>
			<hr>
			<button type="submit" id="btnsave">쉐프 신청</button>
			<button type="submit" id="btncalcel">취소</button>

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
								href="http://localhost:8082/KitchenNote/customer/write.do">-
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