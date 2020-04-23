<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/home.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style type="text/css">
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#main * {
	font-family: 'Cafe24Oneprettynight';
}
</style>
</head>
<script>
function resultCategory(){
	location.href="searchCategory.do?"+$('form.form').serialize();
}

</script>
<script src="homeJs/home.js?v=1"></script>

<body>

	<div id=wrapper>

		<div id=main>
			<div class=inner>
				<%@ include file="head.jsp"%>
				<section id=banner>

					<div class="content">
						<header>
							<h1>WELCOME TO KITCHEN NOTE!</h1>
							<p>다양하고 참신한 레시피를 지금 만나보세요!</p>
						</header>
						<p>요리의 즐거움을 아는 회원님을 환영합니다!<br> 집에 있는 식재료를 활용한 레시피를 찾아보시고 이름 및 카테고리
							별로 원하는 레시피를 검색해보세요!<br> 또한 쉐프로 등업하여 더 많은 혜택을 만나보세요.<br> 쉐프는 자기만의 레시피를 유료로
							등록하여 수익을 창출! 할 수 있다는 사실 잊지마세요~<br>
							</p>
					</div>
					<span class="image object" style="inline: block; height: 400px">
						<img src="images/KakaoTalk_20200417_204831310.png">
					</span>
				</section>
				<div class="navi c">
					<button id="category">카테고리</button>
					<button id="recipe">레시피</button>
					<button id="notify">공지사항</button>
					<button id="support">고객센터</button>
				</div>

				<section>
					<div id="category" style="display: none">
						<form style="text-align: center" class="form">
							<%@ include file="category.jsp"%>
							<input type="button" onclick="resultCategory()" value="검색">
						</form>
					</div>
					<hr>
					<h3 onclick="searchCategory(${r1Category.category_id})">
						<a href="javascript:;">${r1Category.category_name}</a>
					</h3>

					<div class="posts">
						<c:forEach var="item" items="${recommand1 }">
							<%@ include file="article.jsp"%>
						</c:forEach>
					</div>
					<hr>
					<h3 onclick="searchCategory(${r2Category.category_id})">
						<a href="javascript:;">${r2Category.category_name}</a>
					</h3>

					<div class="posts">
						<c:forEach var="item" items="${recommand2 }">
							<%@ include file="article.jsp"%>
						</c:forEach>
					</div>
					<hr>
					<h3 onclick="searchCategory(${r3Category.category_id})">
						<a href="javascript:;">${r3Category.category_name}</a>
					</h3>

					<div class="posts">
						<c:forEach var="item" items="${recommand3 }">
							<%@ include file="article.jsp"%>
						</c:forEach>
					</div>
					<hr>
					<h3 onclick="searchCategory(${r4Category.category_id})">
						<a href="javascript:;">${r4Category.category_name}</a>
					</h3>
					<div class="posts">
						<c:forEach var="item" items="${recommand4 }">
							<%@ include file="article.jsp"%>
						</c:forEach>
					</div>
				</section>
				<%@ include file="nangbu.jsp"%>
			</div>
		</div>
	</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>