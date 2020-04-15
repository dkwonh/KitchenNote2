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
		<c:if test="${p=='class'}">
		<option selected value="className">클래스 이름</option>
		</c:if>
		<option value="member_id">구매자</option>
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
			<c:if test="${p=='fork' }">
			
			<td class="member_id">${item.member_id }</td>
			<td class="fork">${item.fork }</td>
			<td class="price">${item.purchase_amount }</td>
			<td class="fork_date">${item.fork_date }</td>
			</c:if>
			<c:if test="${p=='class' }">
			<td class="num">${i.count+(pageNum-1)*10}</td>
			<td class="member_id">${item.member_id }</td>
			<td class="nickname">${item.nickname }</td>
			<td class="chef">${item.chef }</td>
			<td class="c_name">${item.c_name }</td>
			<td class="class_price">${item.class_price }</td>
			<td class="class_date">${item.class_date }</td>
			</c:if>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<ul class="pagination">
		<li>
			<c:if test="${startPage > 10 }">
			<a href="adminPayRecipe.do?pageNum=${startPage-10}&&filter=${filter}&&search=${search}" class="button">이전</a>
			</c:if>
			<c:if test="${startPage <= 10 }">
			<span class="button disabled">이전</span>
			</c:if>
		</li>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${pageNum==i }">
			<li><a href="adminPayRecipe.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page active">${i}</a></li>
			</c:if>
			<c:if test="${pageNum!=i }">
			<li><a href="adminPayRecipe.do?pageNum=${i}&&filter=${filter}&&search=${search}" class="page">${i}</a></li>
			</c:if>
		</c:forEach>
		
		<li>
			<c:if test="${endPage < pageCount }">
			<a href="adminPayRecipe.do?pageNum=${startPage+10}&&filter=${filter}&&search=${search}" class="button">다음</a>
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
			<li><a href="adminChefUp.do?pageNum=1">셰프 신청서</a></li>
			<li><a href="dropUser.do?pageNum=1&&filter=&&search=&&">탈퇴자 관리</a></li>
		</ul>
	</li>
	
	<li>
		<span class="opener">레시피 관리</span>
		<ul>
			<li><a href="adminRecipe.do?pageNum=1&&filter=&&search=&&">전체 레시피 목록</a></li>
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

	<form style="background:white;" action="deleteRecipe.do">
	<div class="row uniform">
		<div >
		<h3>레시피 이름</h3>
		<input type="text" name="recipe_name" id=nameBox readonly>
		
		<h3>작성자</h3>
		<input type="text" name="member_id" id=idBox readonly>
		<input type="hidden" name="recipe_id" id=ridBox >
		<input type="hidden" name="image" id=imageBox>
		
		<h3>삭제 사유</h3>
		<select class="reason" name="reason" onChange="showReasonBox()">
			<option value="부적절한 내용">부적절한 내용</option>
			<option value="불량 레시피 신고">불량 레시피 신고</option>
			<option value="기타">기타</option>
		</select>
		
		<input type="text" name=reasonText class="reasonBox" style="display:none">
				
		<ul class="actions">
			<li><input type="submit" value="삭제" class="special"></li>
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