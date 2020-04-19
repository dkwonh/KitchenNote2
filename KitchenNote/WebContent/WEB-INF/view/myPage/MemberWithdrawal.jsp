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
			var checkbox = document.form2.checkbox.checked;

			if (!checkbox) {
				alert("안내 동의를 선택하여 주세요.");
				document.form2.checkbox.focus();
				return;
			} else {
				document.form2.action = "delete.do";
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
				<br> 탈퇴 후에는 아이디 ${member_id} 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수
				없습니다. <br>게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다. 또한, 키친노트 아이디를
				사용해 다른 서비스에 사용할 수 없게 됩니다. <br>
				<hr>
				<div class="6u$ 12u$(small)">
					<input type="checkbox" id="checkbox" name="checkbox" value="agree">
					<label for="checkbox">안내 사항을 모두 확인하였으며, 이에 동의합니다</label>
				</div>
				<hr>
				<div>
					탈퇴 사유 :
					<textarea name="content" id="content" cols="80" rows="8"></textarea>
				</div>
				<hr>
				<button type="button" name="btnExit" id="btnExit">탈퇴</button>
				<button type="button" name="btnCancel" id="btnCancel">취소</button>

			</form>
		</div>
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
	<script src="../assets/js/main.js"></script>
</body>
</html>