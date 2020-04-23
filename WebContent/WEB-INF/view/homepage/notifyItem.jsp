<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/home.css" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function goBack() {

		history.go(-1);
	}
</script>
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
<body>
	<div id=wrapper>
		<div id=main>
			<div class=inner>
				<%@ include file="head.jsp"%>
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
							<input type="button" onclick="categoryAjax()" value="검색">
						</form>
					</div>
				</section>
				<hr>
				<h3>${dto.subject }</h3>

				<div class="box">${dto.content }</div>
				<div>
					<b>${dto.reg_date }</b>
				</div>

				<button onclick="goBack()">목록으로</button>
			</div>
		</div>
	</div>
</body>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>