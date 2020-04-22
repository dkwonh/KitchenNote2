<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../../assets/css/main.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>1:1 문의하기</title>
<!-- 새 글 쓰기 -->
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
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnSave").click(function() {
			var subject = $("#subject").val();
			var content = $("#content").val();
			var member_id = $("#member_id").val();
			var reg_date = $("#reg_date").val();
			var secret = $(":checked").val();

			if (subject == "") {
				alert("제목을 입력하세요.");
				document.form1.subject.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요.");
				document.form1.content.focus();
				return;
			}
			if (secret == null || secret == "") {
				alert("공개 여부를 체크하여 주세요.");
				document.form1.secret.focus();
				return;
			}
			document.form1.submit();
		});
		$("#btnCancel").click(function() {
			document.form1.action = "AdminList.do?pageNum=" + ${pageNum}
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
				<br>
				<h2>1:1 문의 공지</h2>
				<form name="form1" method="post" action="adminInsert.do">
					<div>
						제목 :<input name="subject" id="subject" size="80"
										placeholder="글 제목 입력">
					</div>
					<br />
					<div class="4u 12u$(small)">
						공개 여부 :<input type="radio" id="demo-priority-normal" name="secret"
										value="true"> <label for="demo-priority-normal">공개</label>
						<input type="radio" id="demo-priority-high" name="secret"
										value="false"> <label for="demo-priority-high">비공개</label>
					</div>
					<div>
						내용 :
						<textarea name="content" id="content" rows="8" cols="80"
										placeholder="글 내용 입력"></textarea>
					</div>
					<input type="hidden" name="member_id" value="member_id">
					<%--  <input type="hidden" name="regdate" value="${dto.regdate }"> --%>
					<div style="width: 650px; text-align: center;">
						<button type="button" id="btnSave">확인</button>
						<button type="button" id="btnCancel">취소</button>
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
	</div>>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>

</body>
</html>