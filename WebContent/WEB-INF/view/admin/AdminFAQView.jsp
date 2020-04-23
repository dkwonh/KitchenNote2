<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			<div class="inner">
				<header id="header">
					<a href="/KitchenNote2/home.do" class="logo"><img
						src="../images/kitchennote-logo.png" width="300px"
						height=150px></a>
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

						<li><a href=# class="icon fa-archive modal"><span
								class="label">nangbu</span></a></li>

						<li class="in"><a href="/KitchenNote2/recipe/write.do" class="icon fa-edit"><span
								class="label">writeRecipe</span></a></li>

						<li class="admin"><a
							href="/KitchenNote2/admin.do?pageNum=1&&filter=&&search="
							class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
					</ul>

				</header>
				<script>
				<%
					String member_id = (String)session.getAttribute("MINFO");
					Integer level = (Integer)session.getAttribute("LEVEL");
				%>
				$(function(){
					if("<%=member_id%>"== "null"){
						$("li.out").css("display","inline-block");
						$("li.in").css("display","none");
					}
					else{
						$("li.in").css("display","inline-block");
						$("li.out").css("display","none");
					}

					if("<%=level%>"!= "0" ){
						$("li.admin").css("display","none");
					}
					else{
						$("li.admin").css("display","inline-block");
					}
				});
				</script>
				<section>
					<h2>상세 보기</h2>
					<hr>
					<form name="form1" method="post" readonly>
						<div>분류 : ${dto.menu }</div>
						<div>조회수 : ${dto.viewcnt }</div>
						<div>
							제목 : <input value="${dto.title}" name="title" id="title" size="80"
								readonly>
						</div>
						<div>
							내용 :
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
		</div>
		</section>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
				<header class="major">
					<h2>고객 센터</h2>
					</header>
					<ul>
						<li><span class="opener">사용자 관리</span>
							<ul>
								<li><a href="/KitchenNote2/admin.do?pageNum=1&&filter=&&search=&&">-
										일반 사용자 관리</a></li>
								<li><a href="/KitchenNote2/adminChef.do?pageNum=1&&filter=&&search=&&">-
										쉐프 사용자 관리 </a></li>
								<li><a href="/KitchenNote2/adminChefUp.do?pageNum=1">- 쉐프 신청서 </a></li>
								<li><a href="/KitchenNote2/dropUser.do?pageNum=1&&filter=&&search=&&">-
										탈퇴자 관리 </a></li>
							</ul></li>
						<li><span class="opener">레시피 관리</span>
							<ul>
								<li><a href="/KitchenNote2/adminRecipe.do?pageNum=1&&filter=&&search=&&">-
										전체 레시피 목록</a></li>
								<li><a
									href="/KitchenNote2/adminPayRecipe.do?pageNum=1&&filter=&&search=&&">- 유료
										레시피 목록</a></li>
								<li><a
									href="/KitchenNote2/adminDropRecipe.do?pageNum=1&&filter=&&search=&&">-
										삭제 레시피 목록 </a></li>
							</ul></li>
						<li><span class="opener">결제 내역 관리</span>
							<ul>
								<li>
								<a href="/KitchenNote2/forkList.do?pageNum=1">- 포크 충전 내역</a>
								</li>
								<li>
								<a href="/KitchenNote2/purRecipe.do?pageNum=1">- 레시피 결제 내역</a>
								</li>
							</ul></li>
						<li><span class="opener">공지 사항</span>
							<ul>
								<li><a href="/KitchenNote2/notify.do?pageNum=1">- 공지 사항</a></li>
							</ul></li>
						<li><span class="opener">문의 사항</span>
							<ul>
								<li><a
									href="/KitchenNote2/admin/AdminFAQ.do?pageNum=0">-
										자주 묻는 질문 /FAQ</a></li>
								<li><a
									href="/KitchenNote2/admin/AdminList.do?pageNum=0">-
										1:1 문의</a></li>
							</ul></li>
						<li><a
							href="/KitchenNote2/adminStatics/adminStatics.do">홈페이지
								통계 </a></li>
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