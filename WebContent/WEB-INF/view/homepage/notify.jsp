<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/home.css"/>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="homeJs/home.js"></script>
<script>
<%
String member_id = (String)session.getAttribute("MINFO");
String level = (String)session.getAttribute("LEVEL");

if(member_id == null){
	member_id = "guest";
}
%>
function logout(){
<%
session.invalidate();
%>
location.replace("home.do");
}

	$(function(){
	
	if("<%=member_id%>"=="guest"){
		$("li.out").css("display","inline-block");
		$("li.in").css("display","none");
	}
	else{
		$("li.in").css("display","inline-block");
		$("li.out").css("display","none");
	}

	if("<%=level%>"!="0"){
		$("li.admin").css("display","none");
	}
	else{
		$("li.admin").css("display","inline-block");
	}
	})
function itemClick(num){
	location.href="notifyItem.do?num="+num
}
</script>
</head>
<body>
<div id="wrapper">
<div id="main">
	<div class="inner">
	<%@ include file="head.jsp" %>
				<div class="navi c">
				<button id="category">카테고리</button>
				<button id="recipe">레시피</button>
				<button id="notify">공지사항</button>
				<button id="support">고객센터</button>
				</div>
				
				<section>
				<%@include file="category.jsp" %>
				</section>
	<section id=search class="alt 4u 12u$">
	
	<form>
	<select name="filter">
		<option value="subject">제목</option>
		<option value="content">내용</option>
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
		<c:forEach var="item" items="${list }" varStatus="i">
		<tr onclick="itemClick(${item.num})">
			<td class="num">${item.num}</td>
			<td class="subject">${item.subject }</td>
			<td class="reg_date">${item.reg_date }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<ul class="pagination">
		<li>
			<c:if test="${startPage > 10 }">
			<a href="notifyList.do?pageNum=${startPage-10}&&filter=${filter}&&search=${search}" class="button">이전</a>
			</c:if>
			<c:if test="${startPage <= 10 }">
			<span class="button disabled">이전</span>
			</c:if>
		</li>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${pageNum==i }">
			<li><a href="notifyList.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page active">${i}</a></li>
			</c:if>
			<c:if test="${pageNum!=i }">
			<li><a href="notifyList.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page">${i}</a></li>
			</c:if>
		</c:forEach>
		
		<li>
			<c:if test="${endPage < pageCount }">
			<a href="notifyList.do?pageNum=${startPage+10}&&filter=${filter}&&search=${search}" class="button">다음</a>
			</c:if>
			<c:if test="${endPage >= pageCount }">
			<span class="button disabled">다음</span>
			</c:if>
		</li>
	</ul>
	
	<%@ include file="nangbu.jsp" %>
	</div>
</div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>