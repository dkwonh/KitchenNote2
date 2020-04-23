<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/home.css" />
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
#wrapper *{
font-family: 'Cafe24Oneprettynight';
}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
function resultCategory(){
	location.href="/KitchenNote2/searchCategory.do?"+$('form.form').serialize();
}
</script>
<script src="/KitchenNote2/homeJs/home.js"></script>
<script>
	$(document).ready(function() {
		$("#btnback").click(function() {
			document.form1.action = "FAQ.do?pageNum=0"
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<a href="/KitchenNote2/home.do" class="logo"><img
						src="../images/kitchennote-logo.png" width="300px" height=150px></a>
					<section id=search class="alt 4u 12u$">
						<form method=post action=recipe.do>
							<input type=text name=search id=query placeholder="Search">
						</form>
					</section>
					<ul class="icons">
						<li class="out"><a href="/KitchenNote2/login/loginForm.do"
							class="icon fa-sign-in"><span class=label> sign-in </span></a>
						<li class="in"><a href="/KitchenNote2/login/logoutOk.do"
							class="icon fa-sign-out"><span class=label> sign-out </span></a>
						<li class="in"><a href=# class="icon fa-user"><span
								class="label">mypage</span></a></li>

						<li><a href="/KitchenNote2/homeJs/home.js " class="icon fa-archive modal"><span
								class="label">nangbu</span></a></li>

						<li class="in"><a href="/KitchenNote2/recipe/write.do" class="icon fa-edit"><span
								class="label">writeRecipe</span></a></li>

						<li class="admin"><a
							href="/KitchenNote2/admin.do?pageNum=1&&filter=&&search="
							class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
					</ul>
				<script>
				<%String member_id = (String) session.getAttribute("MINFO");
			Integer level = (Integer) session.getAttribute("LEVEL");%>
				$(function(){
					if("<%=member_id%>"== "null"){
						$("li.out").css("display","inline-block");
						$("li.in").css("display","none");
					}
					else{
						$("li.in").css("display","inline-block");
						$("li.out").css("display","none");
					}

					if("<%=level%>" != "0") {
							$("li.admin").css("display", "none");
						} else {
							$("li.admin").css("display", "inline-block");
						}
					});
				</script>
				</header> 
				<div class="navi c">
					<button id="category">카테고리</button>
					<button id="recipe">레시피</button>
					<button id="notify">공지사항</button>
					<button id="support">고객센터</button>
				</div>
				<section>
					<div id="category" style="display: none">
						<form style="text-align: center" class="form">
							<%@ include file="../homepage/category.jsp"%>
							<input type="button" onclick="resultCategory()" value="검색">
						</form>
					</div>
				</section>
				<section>
				<h2>자주 묻는 질문 상세</h2>
				<form name="form1" method="post">
					<div>구분 : ${dto.menu}</div>
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
						<button type="button" id="btnback">확인</button>
					</div>
				</form>
			</section>
						</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
					<p />
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
	<%@ include file="../homepage/nangbu.jsp" %>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>