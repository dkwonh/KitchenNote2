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
$(function(){
	$("body").append("<div id='glayLayer'></div><div id='overLayer'></div>");
	$(document).ready(function () { $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .8) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>'); });
		$("#glayLayer").click(function(){
		$(this).hide()
		$("#overLayer").hide();
	});
	
	$("tr.modal").click(function(){
		var nickname = $(this).find("td.nickname").text();
		var member_id = $(this).find("td.member_id").text();
		var join_date = $(this).find("td.join_date").text();
		var tel = $(this).find("td.tel").text();
		var sns = $(this).find("td.sns_address").text();
		$("input#nickBox").attr("value",nickname);
		$("div#idBox").text(member_id);
		$("div#joinBox").text(join_date);
		$("div#telBox").text(tel);
		$("div#snsBox").text(sns);
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
</head>
<body>
<div id="wrapper">
<div id="main">
	<div class="inner">
	<header id=header></header>
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
		<tr onclick="popUpInfo('${item.nickname}','${item.member_id}','${item.join_date}')" class="modal">
			<td class="num">${i.count+(pageNum-1)*10}</td>
			<td class="nickname">${item.nickname }</td>
			<td class="member_id">${item.member_id }</td>
			<td class="sns_address">${item.sns_address }</td>
			<td class="tel">${item.tel }</td>
			<td style="display:none" class="join_date">${item.join_date }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<ul class="pagination">
		<li>
			<c:if test="${startPage > 10 }">
			<a href="adminChef.do?pageNum=${startPage-10}&&filter=${filter}&&search=${search}" class="button">이전</a>
			</c:if>
			<c:if test="${startPage <= 10 }">
			<span class="button disabled">이전</span>
			</c:if>
		</li>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<li><a href="adminChef.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page">${i}</a></li>
		</c:forEach>
		
		<li>
			<c:if test="${endPage < pageCount }">
			<a href="adminChef.do?pageNum=${startPage+10}&&filter=${filter}&&search=${search}" class="button">다음</a>
			</c:if>
			<c:if test="${endPage >= pageCount }">
			<span class="button disabled">다음</span>
			</c:if>
		</li>
	</ul>
	</div>
</div>

<div id="sidebar">
<div class="inner">
<nav id=menu>
<ul>
	<li>
		<span class="opener">사용자 관리</span>
		<ul>
			<li><a href="admin.do?pageNum=1&&filter=&&search=&&">일반 사용자 관리</a></li>
			<li><a href="adminChef.do?pageNum=1&&filter=&&search=&&">셰프 사용자 관리</a></li>
			<li>셰프 등업 신청 확인</li>
			<li>탈퇴자 관리</li>
		</ul>
	</li>
	
	<li>
		<span class="opener">레시피 관리</span>
		<ul>
			<li>일반 사용자 관리</li>
			<li>셰프 사용자 관리</li>
			<li>셰프 등업 신청 확인</li>
			<li>탈퇴자 관리</li>
		</ul>
	</li>
	
	<li>
		<span class="opener">결제 내역 관리</span>
		<ul>
			<li>일반 사용자 관리</li>
			<li>셰프 사용자 관리</li>
			<li>셰프 등업 신청 확인</li>
			<li>탈퇴자 관리</li>
		</ul>
	</li>
	
	<li>
		<span class="opener">이벤트 관리</span>
		<ul>
			<li>일반 사용자 관리</li>
			<li>셰프 사용자 관리</li>
			<li>셰프 등업 신청 확인</li>
			<li>탈퇴자 관리</li>
		</ul>
	</li>
	
	<li>
		<span class="opener">문의 사항</span>
		<ul>
			<li>일반 사용자 관리</li>
			<li>셰프 사용자 관리</li>
			<li>셰프 등업 신청 확인</li>
			<li>탈퇴자 관리</li>
		</ul>
	</li>
	
	<li>
		<span class="opener">홈페이지 통계</span>
		<ul>
			<li>일반 사용자 관리</li>
			<li>셰프 사용자 관리</li>
			<li>셰프 등업 신청 확인</li>
			<li>탈퇴자 관리</li>
		</ul>
	</li>
	
</ul>
</nav>
</div>
</div>
</div>
<div id=popupWindow style="display:none">

	<form style="background:white">
	<div class="row uniform modal-dialog">
		<div class="12u$ modal-body">
		<h5>닉네임</h5>
		<input type="text" name="nickname" id=nickBox><br>
		
		<h5>아이디</h5>
		<div class="box" id=idBox>
		
		</div>
		
		<h5>SNS주소</h5>
		<div class="box" id="snsBox">
		
		</div>
		
		<h5>연락처</h5>
		<div class="box" id="telBox">
		
		</div>
		
		<h5>가입일</h5>
		<div class="box" id=joinBox>
		
		</div>
		<ul class="actions">
			<li><input type="submit" value="수정" class="special"></li>
			<li><input type="button" value="삭제"></li>
			<li><input type="button" value="취소"></li>
		</ul>
		</div>
		</div>
	</form>
	
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>