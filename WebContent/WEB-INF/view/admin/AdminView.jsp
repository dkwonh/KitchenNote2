<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>1:1 문의하기</title>
<!-- 내 문의 내역 게시물 상세내용 보기 -->
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
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "adminDelete.do"
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function() {
			document.form1.action = "adminUpdate.do?num=" + ${dto.num};
			document.form1.submit();
		});
		$("#btnNon").click(function() {
			document.form1.action = "AdminList.do?pageNum=0"
			document.form1.submit();
		});
		if(${dto.secret} == true ){
		$("input[id='demo-priority-normal']").attr('checked','checked');
		} else {
			$("input[id='demo-priority-high']").attr('checked','checked');
			}
		$("input[name='secret']").attr('disabled', true);
	});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<a href="home.do" class="logo"><img
						src="../images/kitchennote-logo.png" width="300px"
						height=150px></a>
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
				<section>
				<h2>회원 1:1 문의</h2>
				<hr>
				<form name="form1" method="post">
					<div>
						작성일자 :
						<fmt:formatDate value="${dto.reg_date }"
										pattern="yyyy-MM-dd a HH:mm:ss" />
					</div>
					<br>
					<div>조회수 : ${dto.readcount }</div><br>
					<div>
						이름 <input name="member_id" id="member_id"
										value="${dto.member_id }" readonly>
					</div>
					<br>
					<div>
						제목<input value="${dto.subject}" name="subject" id="subject"
										size="80" readonly>
					</div>
					<br>
					<div class="4u 12u$(small)" readonly>
						공개 여부 :<input type="radio" id="demo-priority-normal" name="secret"
										value="${dto.secret }"> <label
										for="demo-priority-normal">공개</label>
						<input type="radio" id="demo-priority-high" name="secret"
										value="${dto.secret }"> <label
										for="demo-priority-high">비공개</label>
					</div>
					<div>
						내용
						<textarea name="content" id="content" rows="8" cols="80" readonly>${dto.content}</textarea>
					</div>
</section>
					<div style="width: 650px; text-align: center;">
						<input type="hidden" name="num" value="${dto.num}">
						<button type="button" id="btnUpdate">답변하기</button>
						<button type="button" id="btnDelete">삭제</button>
						<button type="button" id="btnNon">확인</button>
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
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>