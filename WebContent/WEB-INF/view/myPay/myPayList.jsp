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
<script src="../homepage/home.jsp"></script>
<script>
function buyFork(){
	location.href="/KitchenNote2/kakaoPay.do";
	
}
</script>
</head>
<body>
	<div id=wrapper>

		<div id=main>
			<div class=inner>
				<%@ include file="../homepage/head.jsp"%>
				<section>
				<h3>결제내역</h3>
				<hr>
				<button onclick="buyFork()">포크구매</button>
				
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<c:forEach var="item" items="${type }">
									<th>${item}</th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${userList }" varStatus="i">
								<tr>
									<td class="num">${i.count+(pageNum-1)*10}</td>
									<td class="fork">포크 ${item.fork } 개</td>
									<td class="purchase_amount">${item.purchase_amount }</td>
									<td class="fork_date">${item.fork_date }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<ul class="pagination">
					<li><c:if test="${startPage > 10 }">
							<a
								href="/KitchenNote2/pageMine/payList.do?pageNum=${startPage-10}&&filter=${filter}&&search=${search}"
								class="button">이전</a>
						</c:if> <c:if test="${startPage <= 10 }">
							<span class="button disabled">이전</span>
						</c:if></li>

					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${pageNum==i }">
							<li><a
								href="/KitchenNote2/pageMine/payList.do?pageNum=${i}&&filter=${filter}&&search=${search}"
								class="page active">${i}</a></li>
						</c:if>
						<c:if test="${pageNum!=i }">
							<li><a
								href="/KitchenNote2/pageMine/payList.do?pageNum=${i}&&filter=${filter}&&search=${search}"
								class="page">${i}</a></li>
						</c:if>
					</c:forEach>

					<li><c:if test="${endPage < pageCount }">
							<a
								href="/KitchenNote2/pageMine/payList.do?pageNum=${startPage+10}&&filter=${filter}&&search=${search}"
								class="button">다음</a>
						</c:if> <c:if test="${endPage >= pageCount }">
							<span class="button disabled">다음</span>
						</c:if></li>
				</ul>

			</section>
			</div>
		</div>
		<div id="sidebar" class="inactive">
			<div class="inner">
				<!-- 팔로워/팔로우 수 -->
				<section id="count">
					<%@include file="../pageMine/ffcount.jsp"%>
				</section>
				<nav id="menu">
					<%@include file="../pageMine/aside.jsp"%>
				</nav>
			</div>
		</div>
	</div>
</body>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>