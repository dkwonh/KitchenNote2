<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>

<table border="1">
		<c:forEach items="${followerlist}" var="follower">
			<tr>
				<td>${follower.nickname}</td>
			</tr>
			<tr>
				<td>${follower.member_id}</td>
			</tr>
		</c:forEach>
	</table>
	<table border="1">
		<c:forEach items="${followinglist}" var="following">
		<tr>
				<td>${following.nickname}</td>
			</tr>
			<tr>
				<td>${following.member_id}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>