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

</head>
<style type="text/css">
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#main *{
	font-family:'Cafe24Oneprettynight';
}
</style>
<script>
	function attatch(args) {
		var img = ""+args.image+"";
		if(img.indexOf('okdab')>=0){
			img = "<img src="+args.image+" width=500 height=300>";
		}
		else{
			img = "<img src=/img/"+args.image+" width=500 height=300>";
		}
		$("div.posts").append(
				"<article onclick=itemClick(" + args.recipe_Id + ","+args.price+","+sessionStorage.getItem("MINFO")+")>"
						+ "<a class=image>"
						+ img
						+ "</a>" + "<h3>" + args.recipe_Name + "</h3>" + "<p>"
						+ args.recipe_Exp + "</p>"
						+ "<span><a class='icon fa-clock-o'></a>"
						+ args.duration + "</span>"
						+ "<span><a class='icon fa-eye'></a>" + args.readcount
						+ "</span>" + "</article>");
	}

	function categoryAjax() {
		var url = "searchCategoryAjax.do";
		var params = $('form.form').serialize();
		$.ajax({
			type : "get",
			url : url,
			data : params,
			dataType : "json"
		}).done(function(args) { //응답이 성공 상태 코드를 반환하면 호출되는 함수
			$("h3.searchParam").html("").append(params);
			$("div.posts").html("");
			for (i = 0; i < args.length; i++) {
				attatch(args[i]);
			}
		}).fail(function(e) {
			alert(e.responseText);
		});
	}

	function searchNangbuAjax() {
		var url = "searchNangbu.do";
		var params = $('form.nangbu').serialize();
		$.ajax({
			type : "get",
			url : url,
			data : params,
			dataType : "json"
		}).done(function(args) { //응답이 성공 상태 코드를 반환하면 호출되는 함수
			$("h3.searchParam").html("").append(params);
			$("div.posts").html("");
			$("#glayLayer").hide();
			$("#overLayer").hide();
			$(".selected").html("");

			for (i = 0; i < args.length; i++) {
				attatch(args[i]);
			}
		}).fail(function(e) {
			alert(e.responseText);
		});
	}

	
</script>
<script src="homeJs/home.js?v=1"></script>
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
					<h3 class="searchParam">검색어</h3>
					<hr>
					<div class="posts">
						<c:forEach var="item" items="${dto }">
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