<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<nav id="menu">
		<header id="header">
			<select id="category">
				<option value="#">카테고리</option>
			</select> <input type="search"> <input type="button"
				class="button special small" value="검색"> <a href="#"
				class="KitchenNote"><strong>Kitchen</strong>Note</a>
			<ul class="icons">
				<a href="#" class="icon fa-twitter"><span class="label">관리자</span></a>

			</ul>
		</header>
		<div class="navi c">
			<input type="button" value="카테고리"> <input type="button"
				value="레시피"> <input type="button" value="이벤트"> <input
				type="button" value="고객센터"><br>
		</div>
		<h2>일반 사용자 관리</h2>
		<select id="select">
			<option value="번호">번호</option>
			<option value="닉네임">닉네임</option>
			<option value="이메일">이메일</option>
		</select> <input type="search">
		<button type="submit">검색</button>
		<a href="#">Excel 파일로 다운 받기</a>
		<table border="1" width="600px">
			<tr>
				<th>번호</th>
				<th>닉네임</th>
				<th>이메일</th>
			</tr>
			<div id="ex1" class="modal">
				<c:forEach var="row" items="${list}">
					<tr>
						<td>${row.bno}</td>
						<td><a href="view.do?bno=${row.bno}">${row.title }</a></td>
						<td>${row.writer }</td>
					</tr>
				</c:forEach>
				<a href="#" rel="modal:close">닫기</a>
			</div>

			<p>
				<a href="#ex1" rel="modal:open">모달창띄우기</a>
			</p>
		</table>
		<button type="button" id="btnWrite">글쓰기</button>
		<h2>고객센터</h2>
		<ul>
			<li><span class="opener">사용자 관리</span>
				<ul>
					<li><a
						href="http://localhost:8082/KitchenNote/customer/list.do">- 일반
							사용자 관리</a></li>
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
						href="http://localhost:8082/KitchenNote/customer/list.do">- 쿠킹
							클래스</a></li>
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
						href="http://localhost:8082/KitchenNote/customer/list.do">- 자주
							묻는 질문 /FAQ</a></li>
					<li><a
						href="http://localhost:8082/KitchenNote/customer/write.do">-
							1:1 문의</a></li>
				</ul></li>
			<li><a
				href="http://localhost:8082/KitchenNote/customer/write.do">홈페이지
					통계 </a></li>
		</ul>
	</nav>

	<footer id="footer">
		<p class="copyright">
			&copy; Untitled. All rights reserved. Demo Images: <a
				href="https://unsplash.com">Unsplash</a>. Design: <a
				href="https://html5up.net">HTML5 UP</a>.
		</p>
	</footer>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>