<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/home.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>1:1 문의하기</title>
<!-- 글 수정 폼  -->
<style type="text/css">
.navi input {
	float: left;
}

.c input {
	width: 25%
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
		$("#btnReset").click(function() {
			if (confirm("취소 하시겠습니까?")) {
				document.form2.action = "view.do";
				document.form2.submit();
			}
		});
		$("#btnConfirm").click(function() {
			var subject = $("#subject").val();
			var content = $("#content").val();
			var member_id = $("#member_id").val();
			var reg_date = $("#reg_date").val();
			var secret = $(":checked").val();

			if (subject == "") {
				alert("제목을 입력하세요.");
				document.form2.subject.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요.");
				document.form2.content.focus();
				return;
			}
			if (secret == null || secret == "") {
				alert("공개 여부를 체크하여 주세요.");
				document.form1.secret.focus();
				return;
			} else {
				confirm("저장 하시겠습니까?");
				document.form2.action = "update2.do"
				document.form2.submit();
			}

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
				<h2>수정하기</h2>
				<form name="form2" method="GET">
					<div>
						제목<input name="subject" id="subject" size="80"
										placeholder="글 제목 입력">
					</div>
					<div class="4u 12u$(small)">
						공개 여부 :<input type="radio" id="demo-priority-normal" name="secret"
										value="true"> <label for="demo-priority-normal">공개</label>
						<input type="radio" id="demo-priority-high" name="secret"
										value="false"> <label for="demo-priority-high">비공개</label>
					</div>
					<div>
						내용
						<textarea name="content" id="content" rows="8" cols="80"
										placeholder="글 내용 입력"></textarea>
					</div>
					<div style="width: 650px; text-align: center;">
						<input type="hidden" name="num" value="${dto.num}"> <input
										type="hidden" name="member_id" value="${dto.member_id }">
						<input type="hidden" name="status" value="${dto.status }">
						<button type="button" id="btnConfirm">저장</button>
						<button type="button" id="btnReset">취소</button>
					</div>
				</form>
			</section>
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