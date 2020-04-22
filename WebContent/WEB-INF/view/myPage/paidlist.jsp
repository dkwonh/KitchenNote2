<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div id="paidlist_main">
		<div id="paidlist">
			<div id="recipe_info">
				<c:forEach items="${paidlist}" var="list">
					<img src="${list.image}">
				<div id="recipe_image">
				</div>
				<div id="recipe_exp">
					<div id="recipe_name">
						${list.recipe_name}
					</div>
					<div id="recipe_member_id">
						${list.member_id}
					</div>
					<div id="recipe_scrap">
						${list.scrap}
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>