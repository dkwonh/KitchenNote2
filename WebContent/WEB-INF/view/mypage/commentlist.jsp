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
	<div id="comment_Main_Page">
		<div id="comment_content_Page">
			<div id="comment_content_content">
				<c:forEach items="${commentlist}" var="comment">
					<div>
						<ul>
							<li>
								<div id="content_image">
									<img src="${comment.image}">
								</div>
							</li>
							<li>
								<div id="content_recipe_id" style="display: none">
									${comment.recipe_name}</div>
							</li>
							<li>
								<div id="content_recipe_name">${comment.recipe_name}</div>
							</li>
							<li>
								<div id="content_com_member_id">${comment.com_member_id}</div>
							</li>
							<li>
								<div id="content_comment">${comment.comment}</div>
							</li>
							<li>
								<div id="content_date">${comment.comment_date}</div>
							</li>
						</ul>
					</div>
					<span id="delete_btn" class="delete_btn" onclick="deleteComment">Close </span>
					<script>
					function deleteComment(){
						alert("스크랩을 취소하시겠서요?");
						
						}
					</script>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>