<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<title>1:1 문의하기</title>
<!-- 글 수정 폼  -->
<style type="text/css">
.navi input {
	float: left;
}

.c input {
	width: 25%
}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnReset").click(function() {
			if (confirm("취소 하시겠습니까?")) {
				document.form2.action = "adminView.do";
				document.form2.submit();
			}
		});
		$("#btnConfirm").click(function() {
			var answer = $("#answer").val();
			var status = $("#status").val();

			if (answer == "") {
				alert("내용을 입력하세요.");
				document.form2.answer.focus();
				return;
			} else {
				confirm("답변글을 등록 하시겠습니까?");
				document.form2.action = "adminUpdate2.do"
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
					<a href="home.do" class="logo"><img
						src="../../../images/kitchennote-logo.png" width="300px"
						height=150px> KitchenNote</a>
					<section id=search class="alt 4u 12u$">
						<form method=post action=recipe.do>
							<input type=text name=search id=query placeholder="Search">
						</form>
					</section>
					<ul class="icons">
						<li class="out"><a href="login/loginForm.do"
							class="icon fa-sign-in"><span class=label> sign-in </span></a>
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
				<h2>답변하기</h2>
				<form name="form2" method="GET">
					<div>
						내용
						<textarea name="answer" id="answer" rows="8" cols="80"
										placeholder="글 내용 입력"></textarea>
					</div>
					<div style="width: 650px; text-align: center;">
						<input type="hidden" name="num" value="${dto.num}"> <input
										type="hidden" name="member_id" value="관리자">
						<button type="button" id="btnConfirm">저장</button>
						<button type="button" id="btnReset">취소</button>
					</div>
				</form>
			
						</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
				<header class="major">
					<h2>고객센터</h2>
					</header>
					<ul>
						<li><span class="opener">사용자 관리</span>
							<ul>
								<li><a
									href="admin.do?pageNum=1&&filter=&&search=&&">-
										일반 사용자 관리</a></li>
								<li><a
									href="adminChef.do?pageNum=1&&filter=&&search=&&">-
										쉐프 사용자 관리 </a></li>
								<li><a
									href="adminChefUp.do?pageNum=1">-
										쉐프 신청서 </a></li>
								<li><a
									href="dropUser.do?pageNum=1&&filter=&&search=&&">-
										탈퇴자 관리 </a></li>
							</ul></li>
						<li><span class="opener">레시피 관리</span>
							<ul>
								<li><a
									href="adminRecipe.do?pageNum=1&&filter=&&search=&&">-
										전체 레시피 목록</a></li>
								<li><a
									href="adminPayRecipe.do?pageNum=1&&filter=&&search=&&">-
										유료 레시피 목록</a></li>
								<li><a
									href="adminDropRecipe.do?pageNum=1&&filter=&&search=&&">-
										삭제 레시피 목록 </a></li>
							</ul></li>
						<li><span class="opener">결제 내역 관리</span>
							<ul>
								<li><a
									href="forkList.do?pageNum=1">-
										포크 충전 내역</a></li>
								<li><a
									href="purRecipe.do?pageNum=1">-
										레시피 결제 내역</a></li>
							</ul></li>
						<li><span class="opener">공지 사항</span>
							<ul>
								<li><a href="notify.do?pageNum=1">- 공지 사항</a></li>
							</ul></li>
						<li><span class="opener">문의 사항</span>
							<ul>
								<li><a
									href="admin/AdminFAQ.do?pageNum=0">-
										자주 묻는 질문 /FAQ</a></li>
								<li><a
									href="admin/AdminList.do?pageNum=0">-
										1:1 문의</a></li>
							</ul></li>
						<li><a
							href="adminStatics/adminStatics.do">홈페이지
								통계 </a></li>
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