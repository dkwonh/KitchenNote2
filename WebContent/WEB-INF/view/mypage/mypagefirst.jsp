<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
body, input, select, textarea {
	color: #7f888f;
	font-family: "Open Sans", sans-serif;
	font-size: 13pt;
	font-weight: 400;
	line-height: 1.65;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

body {
	background: #ffffff;
}

ul, li {
	list-style: none;
}

#main {
	-moz-flex-grow: 1;
	-webkit-flex-grow: 1;
	-ms-flex-grow: 1;
	flex-grow: 1;
	-moz-flex-shrink: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-shrink: 1;
	flex-shrink: 1;
	width: 100%;
}

#main>.inner {
	padding: 0 6em 0.1em 6em;
	margin: 0 auto;
	max-width: 110em;
}

.posts article {
	-moz-flex-grow: 0;
	-webkit-flex-grow: 0;
	-ms-flex-grow: 0;
	flex-grow: 0;
	-moz-flex-shrink: 1;
	-webkit-flex-shrink: 1;
	-ms-flex-shrink: 1;
	flex-shrink: 1;
	margin: 0 0 6em 6em;
	position: relative;
	width: calc(33.33333% - 6em);
}

.button.primary {
	background-color: #f56a6a;
	box-shadow: none;
	color: #ffffff !important;
}
</style>

<body>

	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<section>
					<header>
						<ul class="actions">
							<li><a href="mypagefirst.do" class="button primary">내가
									작성한 레시피</a>
							<li><a href="paidlist.do" class="button primary">구매한 레시피</a>
						</ul>
					</header>
				</section>
				<section>
					<div class="posts">
						<c:forEach items="${list}" var="list">
							<article>
								<img src="${list.image}" width="290" height="280" class="image">
								<h3>${list.recipe_name}</h3>
								<div class="reicpe_readcount">조회수 : ${list.readcount}</div>
								<div class="recipe_scrap">스크랩 수 : ${list.scrap}</div>
								<ul class="actions">
									<li><a href="modify.jsp">수정</a></li>
									<li><a href="delete.jsp">삭제</a></li>
								</ul>
							</article>
						</c:forEach>
					</div>
				</section>
			</div>
		</div>
		<!-- Sidebar -->
		<div id="sidebar" class="inactive">
			<div class="inner">
				<!-- 팔로워/팔로우 수 -->
				<section id="count">
					<%@include file="ffcount.jsp"%>
				</section>
				<nav id="menu">
					<%@include file="aside.jsp"%>
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