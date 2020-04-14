<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	fieldset {
		display : inline-block;
	}
</style>
<script>
	function itemClick(item){
		alert("레시피 읽기 기능 ID :"+ item);
	}
</script>
</head>
<body>
<form method="post">
	<input type="text" name="search">
	<input type="submit" value="검색">
</form>
<c:forEach var="item" items="${dto }">
<fieldset onclick="itemClick('${item.recipe_Id}')">
<img src="${item.image}"><br>
${item.recipe_Name }<br>
${item.recipe_Exp}<br>
${item.nickname }<br>
<p>
시간:${item.duration }, 조회수:${item.readcount }
</p>
</fieldset>
</c:forEach>


</body>
</html>