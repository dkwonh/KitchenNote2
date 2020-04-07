<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>관리자FAQ</title>
</head>
<body>
	<nav id="menu">
		<header id="header">
			<input type="button" value="카테고리"> <input type="search"><input
				type="button" value="검색"> <a href="#" class="KitchenNote"><strong>Kitchen</strong>Note</a>
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			</ul>
		</header>
		<br>
		<header class="major"> </header>
		<ul>
			<li><span class="opener">사용자 관리</span>
				<ul>
					<li><a href="#">일반 사용자 관리</a></li>
					<li><a href="#">쉐프 사용자 관리</a></li>
					<li><a href="#">쉐프 등업 신청 확인</a></li>
					<li><a href="#">탈퇴자 관리</a></li>
				</ul></li>
			<li><span class="opener">레시피 관리</span>
				<ul>
					<li><a href="#">레시피 목록</a></li>
					<li><a href="#">유료 레시피 목록</a></li>
					<li><a href="#">삭제 레시피 목록</a></li>
					<li><a href="#">레시피 통계</a></li>
				</ul></li>
			<li><span class="opener">결제 내역 관리</span>
				<ul>
					<li><a href="#">레시피 결제 내역</a></li>
					<li><a href="#">쿠킹 클래스 결제 내역</a></li>
				</ul></li>
			<li><span class="opener">이벤트 관리</span>
				<ul>
					<li><a href="#">쿠킹 클래스</a></li>
					<li><a href="#">강사 모집</a></li>
					<li><a href="#">종료된 이벤트</a></li>
				</ul></li>
			<li><span class="opener">문의 사항</span>
				<ul>
					<li><a href="#">자주 묻는 질문/FAQ</a></li>
					<li><a href="#">1:1 문의</a></li>
				</ul></li>
			<li><a href="#">홈페이지 통계</a></li>
		</ul>
		<h4>
			회원 문의 내역
			<h4>
				<p>
					정렬<select id="select3">
						<option value="제목">제목</option>
						<option value="작성자">작성자</option>
						<option value="등록일">등록일</option>
						<option value="조회수">답변 상태</option>
					</select>
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>답변 상태</th>
					</tr>
				</p>
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