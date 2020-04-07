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
		<h3>자주 묻는 질문/FAQ</h3>
		키친노트서비스 이용에 대하여 궁금한 점이나 문의사항을 등록해주시면 빠른 시간 내에 답변해 드리겠습니다. 질문 내용에 따라
		비공개에서 공개로 전환 될 수 있음을 알려드립니다.<br>
		<p>
			분류<select id="select1">
				<option value="분류">-----분류를 선택하여 주세요.------</option>
				<option value="레시피">레시피</option>
				<option value="쿠킹 클래스">쿠킹 클래스</option>
				<option value="결제 및 환불">결제 및 환불</option>
				<option value="오류 및 수정">오류 및 수정</option>
				<option value="신고">신고</option>
			</select>
		</p>
		<p>
			검색<select id="select2">
				<option value="검색">-----항목을 선택하여 주세요-----</option>
				<option value="제목">제목</option>
				<option value="작성자">작성자</option>
			</select>
		</p>
		<h4>
			전체 문의 내역
			<h4>
				<p>
					정렬<select id="select3">
						<option value="제목">제목</option>
						<option value="작성자">작성자</option>
						<option value="등록일">공개여부</option>
						<option value="조회수">조회수</option>
					</select>
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
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