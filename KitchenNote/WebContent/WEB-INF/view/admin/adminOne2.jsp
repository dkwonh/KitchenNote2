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
		<h2>회원 글</h2>
		<form name="dto" method="#">
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
					placeholder="글 내용 입력"></textarea>
			</div>
			<div style="width: 650px; text-align: center;">
				<input type="reset" value="삭제">
			</div>
			<hr>
			<h2>관리자 답변</h2>
			<div>
				답변글
				<textarea name="reple" id="reple" rows="8" cols="80"
					placeholder="글 내용 입력"></textarea>
			</div>
			<div style="width: 650px; text-align: center;">
				<input type="submit" value="등록"><input type="reset"
					value="취소">
					</div>
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