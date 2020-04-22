<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<a href="home.do" class="logo"><img
						src="../images/kitchennote-logo.png" width="300px"
						height=150px> KitchenNote</a>
					<section id=search class="alt 4u 12u$">
						<form method=post action=recipe.do>
							<input type=text name=search id=query placeholder="Search">
						</form>
					</section>
					<ul class="icons">
							<li class="in"><a href="login/logoutOk.do"
							class="icon fa-sign-out"><span class=label>
							sign-out
						</span></a>
						
						
						<li class="in"><a href=# class="icon fa-user"><span
								class="label">mypage</span></a></li>
								
						<li><a href=# class="icon fa-archive modal"><span
								class="label">nangbu</span></a></li>

						<li class="in"><a href="#" class="icon fa-edit"><span
								class="label">Facebook</span></a></li>
								
						<li class="admin"><a
							href="admin.do?pageNum=1&&filter=&&search="
							class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
					</ul>
				
				</header> 
				<div class="navi c">
								<input type="button" value="카테고리"> <input type="button"
									value="레시피"> <input type="button" value="이벤트"> <input
									type="button" value="고객센터"><br>
				</div>
				<section>
					<P>
					
								<h3>자주 묻는 질문/FAQ</h3>
					<br> 키친노트서비스 이용에 대하여 궁금한 점이나 문의사항을 등록해주시면 빠른 시간 내에 답변해 드리겠습니다.<br>
					질문 내용에 따라 비공개에서 공개로 전환 될 수 있음을 알려드립니다.<br>
					<p>
				
							</section>
				<h4>자주 찾는 도움말</h4>
				<form action="FAQ.do?pageNum=1">
					<br> 구분 :<select id="select1" name="select1">
						<option value="레시피">레시피</option>
						<option value="쿠킹 클래스">쿠킹 클래스</option>
						<option value="결제 및 환불">결제 및 환불</option>
						<option value="오류 및 수정">오류 및 수정</option>
						<option value="신고">신고</option>
					</select>
					<p>
						검색 :<select id="select2" name="select2">
							<option value="전체">전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> <input type="search" name="select3" id="select3"
										placeholder="검색 할 내용을 입력하여주세요."> <input type="hidden"
										name="pageNum" value="1">
					</p>
					</form>
					<h4>자주 묻는 질문 목록</h4>
					<p>
					
								<table border="1" width="600px">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>구분</th>
							<th>조회수</th>
						</tr>
						<c:forEach var="row" items="${FAQ}">
							<tr>
								<td>${row.bno+(pageNum-1)*10}</td>
								<td><a href="FAQView.do?bno=${row.bno}">${row.title }</a></td>
								<td>${row.menu}</td>
								<td>${row.viewcnt }</td>
							</tr>
						</c:forEach>
					</table>
					<p />
					<ul class="pagination">
						<li><c:if test="${startPage > 10 }">
								<a href="FAQ.do?pageNum=${startPage-10}" class="button">이전</a>
							</c:if> <c:if test="${startPage <= 10 }">
								<span class="button disabled">이전</span>
							</c:if></li>

						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<li><a href="FAQ.do?pageNum=${i}" class="page">${i}</a></li>
						</c:forEach>

						<li><c:if test="${endPage < pageCount }">
								<a href="FAQ.do?pageNum=${startPage+10}" class="button">다음</a>
							</c:if> <c:if test="${endPage >= pageCount }">
								<span class="button disabled">다음</span>
							</c:if></li>
					</ul>
			
						</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
				<header class="major">
					<h2>고객센터</h2>
					</header>
					<ul>
						<li><a
							href="FAQ.do?pageNum=0">자주
								묻는 질문/FAQ</a></li>
						<li><span class="opener">1:1 문의</span>
							<ul>
								<li><a
									href="list.do?pageNum=0">-
										내 문의 내역</a></li>
								<li><a
									href="write.do?pageNum=0">-
										1:1 문의하기</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>