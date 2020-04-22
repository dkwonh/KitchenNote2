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
#main *{
font-family: 'Cafe24Oneprettynight';
}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnCheck").click(function() {
			var password = "password=" + $("#password").val();
			var url = "pwd.do"
			$.ajax({
				type : "POST",
				url : url,
				data : password,
				dataType : "json",
				error : function() {
					alert("비밀번호를 확인해주세요");
				},
				success : function(data) {
					if ($("#password").val() != data) {
						alert("비밀번호가 틀립니다.");
						document.form1.password.focus();
						return;
					} else {
						document.form1.action = "deleteForm.do";
						document.form1.submit();
					}
				}
			});
		});
		$("#btnCancel").click(function() {
			history.go(-1);
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
						<li class="in"><a href="'mypage/mypagefirst.do" class="icon fa-user"><span
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
								<input type="button" value="카테고리"> <input type="button"
									value="레시피"> <input type="button" value="이벤트"> <input
									type="button" value="고객센터"><br>
				</div>
				<hr>
				<h2>비밀 번호 확인</h2>

				<form method="post" name="form1" id="form1">
					<div>
						<h4>회원 탈퇴를 하시려면 비밀번호를 입력하여 주세요.</h4>
						password : <input type="password" name="password" id="password">
					</div>
					<input type="button" id="btnCheck" name="btnCheck" value="확인">
					<input type="button" id="btnCancel" name="btnCancel" value="취소">
				</form>
			
						</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
				<header class="major">
					<h2>마이 페이지</h2>
					</header>
					<ul>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/FAQ.do"> -
								레시피</a></li>

						<li><a
							href="http://localhost:8082/KitchenNote/customer/list.do">-
								스크랩</a></li>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/write.do">-
								댓글</a></li>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/write.do">-
								알람</a></li>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/write.do">-
								결제 내역</a></li>
						<li><a
							href="http://localhost:8082/KitchenNote/myPage/memberInfo.do">-
								회원 정보 수정</a></li>

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