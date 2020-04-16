<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<title>1:1 문의하기</title>
<!-- 내 문의 내역 게시물 상세내용 보기 -->
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
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "delete.do"
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function() {
			document.form1.action = "update.do?num=" + ${dto.num};
			document.form1.submit();
		});
		$("#btnNon").click(function() {
			document.form1.action = "list.do?pageNum=0"
			document.form1.submit();
		});
		$("input[name='secret']").attr('disabled', true);
	});
</script>
</head>
<body>
	<nav id="menu">
		<header id="header">
			<a href="#" class="KitchenNote"><strong>Kitchen</strong>Note</a>
			<section id="search" class="alt 4u 12u$">
				<form method="post">
					<input name="search" id="query" type="text">
				</form>
			</section>
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
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
		<form name="form1" method="post">
			<div>
				작성일자 :
				<fmt:formatDate value="${dto.reg_date }"
					pattern="yyyy-MM-dd a HH:mm:ss" />
			</div>
			<div>조회수 : ${dto.readcount }</div>
			<div>
				이름 <input name="member_id" id="member_id" value="${dto.member_id }"
					readonly>
			</div>
			<div>
				제목<input value="${dto.subject}" name="title" id="title" size="80"
					readonly>
			</div>
			<div class="4u 12u$(small)" readonly>
				공개 여부 :<input type="radio" id="demo-priority-normal" name="secret"
					value="${dto.secret }" checked> <label
					for="demo-priority-normal">공개</label> <input type="radio"
					id="demo-priority-high" name="secret" value="${dto.secret }"
					checked> <label for="demo-priority-high">비공개</label>
			</div>
			<div>
				내용
				<textarea name="content" id="content" rows="8" cols="80" readonly>${dto.content}</textarea>
			</div>
			<br>
			<div>
				관리자 답변 :<br> <input type="hidden" name="answer" id="answer"
					rows="8" cols="80" readonly>${dto.answer}</textarea>


				<div style="width: 650px; text-align: center;">
					<input type="hidden" name="num" value="${dto.num}">
					<button type="button" id="btnUpdate">수정</button>
					<button type="button" id="btnDelete">삭제</button>
					<button type="button" id="btnNon">확인</button>
				</div>
		</form>
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