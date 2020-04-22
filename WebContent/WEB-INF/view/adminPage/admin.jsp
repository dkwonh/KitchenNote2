<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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

function deleteInfo(){
	var form = $("form[name='form']");
	form.attr("action","delete.do");
	
	form.submit();

	form.attr("action","update.do");
}

$(function(){
	$("body").append("<div id='glayLayer'></div><div id='overLayer'></div>");
	
	$("#glayLayer").click(function(){
		$(this).hide();
		$("#overLayer").hide();
	});
	
	$("tr.modal").click(function(){
		var nickname = $(this).find("td.nickname").text();
		var member_id = $(this).find("td.member_id").text();
		var join_date = $(this).find("td.join_date").text();
		
		$("input#nickBox").attr("value",nickname);
		$("input#idBox").attr("value",member_id);
		$("input#joinBox").attr("value",join_date);
		
		$("#glayLayer").show();
		$("#overLayer").show().html($("div#popupWindow").html());
		return false;
	});
	
	if($.browser.msie && $.browser.version<7){
		$(window).scroll(function(){
			$("#glayLayer").css('top',$(document).scrollTop());
			$("#overLayer").css('top',($(document).scrollTop()+$(window).height()/2) +"px");
		});
	}
})
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

#main *{
	font-family:'Cafe24Oneprettynight';
}
</style>
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
			<td class="num">${i.count+(pageNum-1)*10}</td>
			<td class="nickname">${item.nickname }</td>
			<td class="member_id">${item.member_id }</td>
			<td style="display:none" class="join_date">${item.join_date }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<ul class="pagination">
		<li>
			<c:if test="${startPage > 10 }">
			<a href="admin.do?pageNum=${startPage-10}&&filter=${filter}&&search=${search}" class="button">이전</a>
			</c:if>
			<c:if test="${startPage <= 10 }">
			<span class="button disabled">이전</span>
			</c:if>
		</li>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${pageNum==i }">
			<li><a href="admin.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page active">${i}</a></li>
			</c:if>
			<c:if test="${pageNum!=i }">
			<li><a href="admin.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page">${i}</a></li>
			</c:if>
		</c:forEach>
		
		<li>
			<c:if test="${endPage < pageCount }">
			<a href="admin.do?pageNum=${startPage+10}&&filter=${filter}&&search=${search}" class="button">다음</a>
			</c:if>
			<c:if test="${endPage >= pageCount }">
			<span class="button disabled">다음</span>
			</c:if>
		</li>
	</ul>
	<div id=popupWindow style="display:none" class="col-12">

	<form style="background:white" name="form" action="update.do" class="row gtr-uniform">
		<div class="col-12">
		<h3>닉네임</h3>
		<input type="text" name="nickname" id=nickBox>
		
		<h3>아이디</h3>
		<input type="text" name="member_id" id=idBox readonly>
		
		<h3>가입일</h3>
		<input type="text" name="join_date" id=joinBox readonly>
		
		<ul class="actions">
			<li><input type="submit" value="수정" class="special"></li>
			<li><input type="button" value="삭제" onclick="deleteInfo()"></li>
		</ul>
		</div>
	</form>
	
</div>
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