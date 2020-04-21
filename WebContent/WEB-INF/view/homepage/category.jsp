<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="category" style="display:none">
	<form style="text-align: center" class="form">
		<ul style="text-align: center">
			<li style="display: inline-block; vertical-align: top">
				<h3>상황별 요리</h3>
				<div class="view">
					<div class="scrollBlind">
						<ul class="first">
							<c:forEach var="item" items="${category1}">
								<li><input id="${item.category_id }" type="radio"
									name="category1" value="${item.category_id }"><label
									for="${item.category_id }">${item.category_name }</label></li>
							</c:forEach>
							<li><input id="no1" type="radio" name="category1" value="0"><label
								for="no1">선택안함</label></li>
						</ul>
					</div>
				</div>
			</li>
			<li style="display: inline-block; vertical-align: top">
				<h3>나라별 요리</h3>
				<div class="view">
					<div class="scrollBlind">
						<ul class="second">
							<c:forEach var="item" items="${category2}">
								<li><input id="${item.category_id }" type="radio"
									name="category2" value="${item.category_id }"><label
									for="${item.category_id }">${item.category_name }</label></li>
							</c:forEach>
							<li><input id="no2" type="radio" name="category2" value="0"><label
								for="no2">선택안함</label></li>
						</ul>
					</div>
				</div>
			</li>
			<li style="display: inline-block; vertical-align: top">
				<h3>재료별 요리</h3>
				<div class="view">
					<div class="scrollBlind">
						<ul class="third">
							<c:forEach var="item" items="${category3}">
								<li><input id="${item.category_id }" type="radio"
									name="category3" value="${item.category_id }"><label
									for="${item.category_id }">${item.category_name }</label></li>
							</c:forEach>
							<li><input id="no3" type="radio" name="category3" value="0"><label
								for="no3">선택안함</label></li>
						</ul>
					</div>
				</div>
			</li>
			<li style="display: inline-block; vertical-align: top">
				<h3>조리별 요리</h3>
				<div class="view">
					<div class="scrollBlind">
						<ul class=last>
							<c:forEach var="item" items="${category4}">
								<li><input id="${item.category_id }" type="radio"
									name="category4" value="${item.category_id }"><label
									for="${item.category_id }">${item.category_name }</label></li>
							</c:forEach>
							<li><input id="no4" type="radio" name="category4" value="0"><label
								for="no4">선택안함</label></li>
						</ul>
					</div>
				</div>
			</li>
		</ul>
		<input type="button" value="검색" onclick="searchCategory()">
	</form>
</div>