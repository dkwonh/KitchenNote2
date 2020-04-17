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
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "AdminFAQDelete.do"
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function() {
			document.form1.action = "AdminFAQUpdate.do?bno=" + ${dto.bno};
			document.form1.submit();
		});
		$("#btnNon").click(function() {
			document.form1.action = "AdminFAQ.do?pageNum=0"
			document.form1.submit();
		});
		;
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
			<section>
		<h2>상세 보기</h2>
		<form name="form1" method="post" readonly>
			<div>분류 : ${dto.menu }</div>
			<div>조회수 : ${dto.viewcnt }</div>
			<div>
				제목<input value="${dto.title}" name="title" id="title" size="80"
					readonly>
			</div>
			<div>
				내용
				<textarea name="content" id="content" rows="8" cols="80" readonly>${dto.content}</textarea>
			</div>

			<div style="width: 650px; text-align: center;">
				<input type="hidden" name="bno" value="${dto.bno}">
				<button type="button" id="btnUpdate">수정</button>
				<button type="button" id="btnDelete">삭제</button>
				<button type="button" id="btnNon">확인</button>
			</div>
		</form>
		</div>
		</section>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
					<h2>고객 센터</h2>
					<ul>
						<li><span class="opener">사용자 관리</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										일반 사용자 관리</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										쉐프 사용자 관리 </a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										쉐프 등업 신청확인 </a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										탈퇴자 관리 </a></li>
							</ul></li>
						<li><span class="opener">레시피 관리</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										레시피 목록</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										유료 레시피 목록</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										삭제 레시피 목록 </a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										레시피 통계 </a></li>
							</ul></li>
						<li><span class="opener">결제 내역 관리</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										레시피 결제 내역</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										쿠킹 클래스 결제 내역</a></li>
							</ul></li>
						<li><span class="opener">이벤트 관리</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										쿠킹 클래스</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										강사 모집</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										종료된 이벤트 </a></li>
							</ul></li>
						<li><span class="opener">문의 사항</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/admin/AdminFAQ.do?pageNum=1">-
										자주 묻는 질문 /FAQ</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/admin/AdminList.do?pageNum=0">-
										1:1 문의</a></li>
							</ul></li>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/write.do">홈페이지
								통계 </a></li>
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