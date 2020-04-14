<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
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
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
 $(document).ready(function(){
	 $("#btnWrite").click(function(){
		 location.href = "chefApply.do"
		 });
	 });
</script>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<header id="header">
				<a href="#" class="KitchenNote"><strong>Kitchen</strong>Note</a>
				<section id="search" class="alt 4u 12u$">
					<form method="post">
						<input name="search" id="query" type="text">
					</form>
				</section>
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span
							class="label">Instagram</span></a></li>
				</ul>
			</header>
			<div class="navi c">
				<input type="button" value="카테고리"> <input type="button"
					value="레시피"> <input type="button" value="이벤트"> <input
					type="button" value="고객센터"><br>
			</div>
			<hr>
			<section>
			
			<h2>회원 정보 수정</h2>
			<image src="${picture }"></image>
			<form method="GET">
				사진 바꾸기
				<button type="submit" value="첨부">첨부</button>
					<button type="submit" id="btnWrite" value="쉐프 신청">쉐프 신청</button><br>
				<%-- 	<c:forEach var="row" items="${dto}"> --%>
							<div>
								닉네임 : <input type="text" id="nickname" value="${dto.nickname}"> 
							</div>
							<div>
								이메일 : <input type="text" id="email" value="${dto.chef }">
							</div>
							<div>
							연락처 : <input type="text" id="tel" value="${dto.tel }">
							</div>
							<div>
							개인 SNS주소 : <input type="text" id="SNS" value="${dto.sns_address }">
							</div>
						<%-- 	</c:forEach> --%>
							<hr>
							<button type="submit">개정 정보 변경</button>
							<button type="submit">비밀번호 바꾸기</button>
							<button type="submit">탈퇴 하기</button>
							</form>
							</section>
							<div id="sidebar">
								<div class="inner">
									<nav id="menu">
										<h2>고객센터</h2>
										<ul>
											<li><a
												href="http://localhost:8082/KitchenNote/customer/FAQ.do">
												- 레시피</a></li>

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
														href="http://localhost:8082/KitchenNote/customer/write.do">-
															회원 정보 수정</a></li>

										</ul>
									</nav>
								</div>
							</div>
		</div>
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script></body>
</html>