<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<title>1:1 문의하기</title>
<!-- 새 글 쓰기 -->
<style type="text/css">
.navi input {
	float: left;
}

.c input {
	width: 25%
}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnSave").click(function() {
			var subject = $("#subject").val();
			var content = $("#content").val();
			var member_id = $("#member_id").val();
			var reg_date = $("#reg_date").val();
			var status = $("#status").val();
			var secret = $(":checked").val();

			if (subject == "") {
				alert("제목을 입력하세요.");
				document.form1.subject.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요.");
				document.form1.content.focus();
				return;
			}
			if (secret == null || secret == "") {
				alert("공개 여부를 체크하여 주세요.");
				document.form1.secret.focus();
				return;
			}
			document.form1.submit();
		});
		$("#btnCancel").click(function() {
			document.form1.action = "list.do?pageNum=0"
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
					type="button" value="고객센터">
			</div>
			<br>
			<h2>1:1 문의하기</h2>
			<form name="form1" method="post" action="insert.do">
				<div>
					제목 :<input name="subject" id="subject" size="80"
						placeholder="글 제목 입력">
				</div>
				<br />
				<div class="4u 12u$(small)">
					공개 여부 :<input type="radio" id="demo-priority-normal" name="secret"
						value="true"> <label for="demo-priority-normal">공개</label>
					<input type="radio" id="demo-priority-high" name="secret"
						value="false"> <label for="demo-priority-high">비공개</label>
				</div>
				<div>
					내용 :
					<textarea name="content" id="content" rows="8" cols="80"
						placeholder="글 내용 입력"></textarea>
				</div>
				<input type="hidden" name="member_id" value="${member_id }">
				<input type="hidden" name="status" value="${status}">
				<div style="width: 650px; text-align: center;">
					<button type="button" id="btnSave">확인</button>
					<button type="button" id="btnCancel">취소</button>
				</div>
			</form>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
					<h2>고객센터</h2>
					<ul>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/FAQ.do?pageNum=0">자주
								묻는 질문/FAQ</a></li>
						<li><span class="opener">1:1 문의</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do?pageNum=0">-
										내 문의 내역</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do?pageNum=0">-
										1:1 문의하기</a></li>
							</ul></li>
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