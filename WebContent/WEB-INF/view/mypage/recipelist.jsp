<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="root">
		<nav id="nav">
			<div id="nav_box">
				<%@include file="ffcount.jsp"%>
			</div>
		</nav>
		<div>
			<c:forEach items="${list}" var="list">
				<fieldset>
					<div id="image_box">
						<div>
							<img src="${list.image}">
						</div>
					</div>
					<div id="recipe_name_box">
						<%-- <div>${list.recipe_id}</div> --%>
						<div>${list.recipe_name}</div>
					</div>
					<div id="scrap_box">
						<div>${list.readcount}</div>
						<div>${list.scrap}</div>
					</div>
					<div id="update_box">
						<div>
							<a href="modify.do">수정</a>
						</div>
						<div>
							<a href="delete.do">삭제</a>
						</div>
					</div>
				</fieldset>
			</c:forEach>
		</div>
		<aside>
			
			<%@include file="../include/aside.jsp"%>
		</aside>
	</div>
</body>
</html>