<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style type="text/css">
div#glayLayer{
	display:none;
	position:fixed;
	left:0;
	top:0;
	height:100%;
	width:100%;
	background:black;
	filter:alpha(opacity=60);
	opacity: 0.60;
}
* html div#glayLayer{
	position:absolute;
}
#overLayer{
	display:none;
	position: fixed;
	top:50%;
	left:50%;
	margin-top:-244px;
	margin-left:-325px;
}
* html #overLayer{
	position: absolute;
}

</style>
<script>
function replacePage(url){
	location.replace(url);
}
})
</script>
</head>
<body>
<div id="wrapper">
<div id="main">
	<div class="inner">
	<%@include file="../homepage/head.jsp" %>
	<section id=search class="alt 4u 12u$">
	
	<form>
	<select name="filter">
		<option selected value="nickname">닉네임</option>
		<option value="member_id">아이디</option>
	</select>
	<input type=text name=search id=query placeholder="Search">
	<input type=hidden name="pageNum" value="1">
	</form>
	</section>
	<div class="table-wrapper">
	<table>
		<thead>
			<tr>
			<c:forEach var="item" items="${type }">
					<td>${item}</td>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${userList }" varStatus="i">
		<tr class="modal">
			<td class="recipe_id">${item.recipe_id}</td>
				<c:set var="image" value="${item.image }" />
				<td class="image">
					<c:if test="${fn:contains(image,'okdab') }">
						<c:set var="mainImg" value="${item.image }" />
						<img width="100px" height="100px" id="main_img" src="${item.image }" width=500 height=300>
					</c:if>
					
					
					<c:if test="${fn:contains(image,'note')}">
						<c:set var="mainImg"
							value="${pageContext.request.scheme}://192.168.0.108:${pageContext.request.serverPort}/img/${item.image }" />
						<img width="100px" height="100px" id="main_img" src="/img/${item.image }" width=500 height=300>
					</c:if>			


			<td class="recipe_name">${item.recipe_name }</td>
			<td class="member_id">${item.member_id}</td>
			<td class="del_date">${item.del_date }</td>
			<td class="reason">${item.reason }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<ul class="pagination">
		<li>
			<c:if test="${startPage > 10 }">
			<a href="adminDropRecipe.do?pageNum=${startPage-10}&&filter=${filter}&&search=${search}" class="button">이전</a>
			</c:if>
			<c:if test="${startPage <= 10 }">
			<span class="button disabled">이전</span>
			</c:if>
		</li>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${pageNum==i }">
			<li><a href="adminDropRecipe.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page active">${i}</a></li>
			</c:if>
			<c:if test="${pageNum!=i }">
			<li><a href="adminDropRecipe.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page">${i}</a></li>
			</c:if>
		</c:forEach>
		
		<li>
			<c:if test="${endPage < pageCount }">
			<a href="adminDropRecipe.do?pageNum=${startPage+10}&&filter=${filter}&&search=${search}" class="button">다음</a>
			</c:if>
			<c:if test="${endPage >= pageCount }">
			<span class="button disabled">다음</span>
			</c:if>
		</li>
	</ul>
	</div>
</div>
<%@ include file="sideMenu.jsp" %>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>