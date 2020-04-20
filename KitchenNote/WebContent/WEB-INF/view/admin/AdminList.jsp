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
		$("#btnWrite").click(function() {
			location.href = "adminWrite.do";
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
			<section>
				<h2>내 문의 내역</h2>
				<br>검색 창을 이용하시면 더 정확한 정보를 검색하실 수 있습니다.<hr>
				<h4>내 문의 내역</h4>
				<div class="12u$">
					<form action="AdminList.do?pageNum=0">
						검색 :<select id="select2" name="select2">
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						
						 <input type="search" id="select3" name="select3" placeholder="검색 할 내용을 입력하여주세요.">
						 <input type="hidden" name="pageNum" value="1">
					</form>
				</div>
			</section>
			<table border="1" width="600px">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>조회수</th>
					<th>공개 여부</th>
					<th>처리 상태</th>
				</tr>
				<c:forEach var="row" items="${AdminList}">
					<tr>
						<td>${row.num+(pageNum-1)*10}</td>
						<td><a href="adminView.do?num=${row.num}">${row.subject }</a></td>
						<td>${row.member_id }</td>
						<td><fmt:formatDate value="${row.reg_date }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${row.readcount }</td>
						<td>${row.secret}</td>
						<td>${row.status }</td>
					</tr>
				</c:forEach>
			</table>
			<button type="button" id="btnWrite">글쓰기</button>
			<ul class="pagination">
				<li><c:if test="${startPage > 10 }">
						<a href="AdminList.do?pageNum=${startPage-10}" class="button">이전</a>
					</c:if> <c:if test="${startPage <= 10 }">
						<span class="button disabled">이전</span>
					</c:if></li>

				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<li><a href="AdminList.do?pageNum=${i}" class="page">${i}</a></li>
				</c:forEach>

				<li><c:if test="${endPage < pageCount }">
						<a href="AdminList.do?pageNum=${startPage+10}" class="button">다음</a>
					</c:if> <c:if test="${endPage >= pageCount }">
						<span class="button disabled">다음</span>
					</c:if></li>
			</ul>

		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
					<h2>고객센터</h2>
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
	<script src="../assets/js/main.js"></script>
</body>
</html>