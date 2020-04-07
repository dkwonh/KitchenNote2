<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<title>1:1 문의하기</title>
<script>
	$(document).ready(function() {
		$("btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/customer.delete.do";
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function() {
			var title = $("#title").val();
			var content = $("#content").val();
			var writer = $("#writer").val();
			if (title == "") {
				alert("제목을 입력하세요.");
				document.form1.title.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요.");
				document.form1.content.focus();
				return;
			}
			if (writer == "") {
				alert("이름을 입력하세요.");
				document.form1.writer.focus();
				return;
			}
			document.form1.action = "${path}/customer/update.do"
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<nav id="menu">
		<header id="header">
			<a href="#" class="KitchenNote"><strong>Kitchen</strong>Note</a> <input
				type="search"><input type="button" value="검색">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
			</ul>
		</header>
		<hr>
		<input type="button" value="카테고리"> <input type="button"
			value="레시피"> <input type="button" value="이벤트"> <input
			type="button" value="고객센터"><br>

		<h2>1:1 문의하기</h2>
		<form name="form1" method="post">
			<div>
				작성일자 :
				<fmt:formatDate value="${dto.regdate }"
					pattern="yyyy-MM-dd a HH:mm:ss" />
			</div>
			<div>조회수 : ${dto.viewcnt }</div>
			<div>
				제목<input name="title" id="title" size="80" placeholder="글 제목 입력">
			</div>
			<div>
				공개여부 <input type="radio" name="open" value="공개">공개 <input
					type="radio" name="open" value="비공개">비공개
			</div>
			<div>
				내용
				<textarea name="content" id="content" rows="8" cols="80"
					placeholder="글 내용 입력">${dto.content}</textarea>
			</div>
			<div>
				이름 <input name="writer" id="writer" value="${dto.writer }"
					placeholder="이름 입력">
			</div>
			<div style="width: 650px; text-align: center;">
				<input type="hidden" name="bno" value="${dto.bno}">
				<button type="button" id="btnUpdate">수정</button>
				<button type="button" id="btnDelete">삭제</button>
			</div>
			<ul>
				<li><a href="#">자주 묻는 질문/FAQ</a></li>
				<li><span class="opener">1:1 문의</span>
					<ul>
						<li><a href="#">1:1 문의하기</a></li>
						<li><a href="#">내 문의 내역</a></li>
					</ul></li>
	</nav>

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