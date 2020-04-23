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
<title>회원 정보 수정</title>
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
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
function resultCategory(){
	location.href="/KitchenNote2/searchCategory.do?"+$('form.form').serialize();
}
</script>
<script src="/KitchenNote2/homeJs/home.js"></script>
<script>
	$(document).ready(function() {
		$("#btnCancel").click(function() {
			history.go(-1);
		});
		$("#btnExit").click(function() {
			var content = $("#content").val();
			var checkbox = document.form2.checkbox.checked;

			if (!checkbox) {
				alert("안내 동의를 선택하여 주세요.");
				document.form2.checkbox.focus();
				return;
			} else {
				document.form2.action = "delete.do";
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
						<li class="in"><a href="'/KitchenNote2/pageMine/mypagefirst.do" class="icon fa-user"><span
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
				<hr>
				<form method="post" name="form2">
					<h2>회원 탈퇴</h2>
					<br> 탈퇴 후에는 아이디 ${member_id} 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수
					없습니다. <br>게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다. 또한, 키친노트 아이디를
					사용해 다른 서비스에 사용할 수 없게 됩니다. <br>
					<hr>
					<div class="6u$ 12u$(small)">
						<input type="checkbox" id="checkbox" name="checkbox" value="agree">
						<label for="checkbox">안내 사항을 모두 확인하였으며, 이에 동의합니다</label>
					</div>
					<hr>
					<div>
						탈퇴 사유 :
						<textarea name="content" id="content" cols="80" rows="8"></textarea>
					</div>
					<hr>
					<button type="button" name="btnExit" id="btnExit">탈퇴</button>
					<button type="button" name="btnCancel" id="btnCancel">취소</button>

				</form>
			
						</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
				<header class="major">
					<h2>마이 페이지</h2>
					</header>
					<image src="#">
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