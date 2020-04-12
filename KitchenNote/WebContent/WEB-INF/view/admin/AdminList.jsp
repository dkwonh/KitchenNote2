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
			location.href = "AdminFAQWrite.do";
		});
		$("#choice").click(function() {

		});
		/* 		$(document).ready(function() {
		 $("#BtnModified").click(function() {
		 location.href = "AdminFAQWrite.do";
		 }); // 컨트롤러 생성 */
	});
</script>
</head>
<body>
	<nav id="menu">
		<header id="header">
			<a href="#" class="KitchenNote"><strong>Kitchen</strong>Note</a> <input
				type="search"><input type="button"
				class="button special small" value="검색">
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
				type="button" value="고객센터"><br>
		</div>
		<section>
			<h2>내 문의 내역</h2>
			<h4>내 문의 내역</h4>
			<div class="12u$">
				<form name="searchform" method="post">
					구분 :<select id="select1" name="select1">
						<option value="0">선택</option>
						<option value="1">레시피</option>
						<option value="2">쿠킹 클래스</option>
						<option value="3">결제 및 환불</option>
						<option value="4">오류 및 수정</option>
						<option value="5">신고</option>
					</select> 검색 :<select id="select2" name="select2">
						<option value="6">선택</option>
						<option value="7">제목</option>
						<option value="8">작성자</option>
					</select> <input type="search" placeholder="search"> <input
						type="button" id="btnSearch" value="검색">
				</form>
			</div>
		</section>
		<p>
			정렬 :<select id="select3">
				<option value="순번">순번</option>
				<option value="조회수">조회수</option>
			</select>
		<table border="1" width="600px">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>공개 여부</th>
				<th>조회수</th>
				<th>처리 상태</th>
			</tr>
			<c:forEach var="row" items="${list}">
				<tr>
					<td>${row.bno}</td>
					<td><a href="view.do?bno=${row.bno}">${row.title }</a></td>
					<td>${row.writer }</td>
					<td><fmt:formatDate value="${row.regdate }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${row.open}</td>
					<td>${row.viewcnt }</td>
				</tr>
			</c:forEach>
		</table>
		<button type="button" id="btnWrite">글쓰기</button>
		<table>
			<tr>
				<c:if test="${pageMaker.prev}">
					<td><a
						href='<c:url value="customer/list.do?page=${pageMaker.startPage-1}"/>'>&laquo;</a>
					</td>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<td><a href='<c:url value="customer/list.do"/>'>${idx}</a></td>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<td><a
						href='<c:url value="customer/list.do?page=${pageMaker.endPage+1}"/>'>&raquo;</a>
					</td>
				</c:if>
			</tr>
		</table>
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
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>

</body>
</html>