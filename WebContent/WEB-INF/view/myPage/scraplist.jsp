<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
<div id="content">
	<ul>
		<li>
			<div class="allcheck">
				<input type="checkbox" name="allcheck" id="allcheck"/>
				<label for="allcheck">모두 선택</label>
				
				<script>
				$("#allcheck").click(function(){
					var chk=$("#allcheck").prop("checked");
					if(chk){
						$(".chBox").prop("checked",true);
						}else {
							$(".chBox").prop("checked",false);
							}
					});
				</script>
			</div>
			<div class="delBtn">
				<button type="button" class="selectDelete_btn">선택삭제</button>
			</div>
		</li>
		
		<c:forEach items="${scraplist}" var="scraplist">
		<li>
			<div class="checkBox">
				<input type="checkbox" name="chBox" class="chBox" data-scrapNum="${scraplist.scrapNum}"/>
				<script>
				$(".chBox").click(function(){
					$("#allcheck").prop("checked",false);
					});
				</script>
			</div>
			<div class="recipeInfo">
				<p>
					<span>레시피명</span>${scraplist.recipe_name}<br>
					<span>쉐프명</span>${scraplist.chef}<br>
					<span>조회수</span>${scraplist.readcount}<br>
				</p>
				
				<div class="delete">
					<button type="button" class="delete_btn" data-scrapNum="${scraplist.scrapNum}">삭제</button>
					<script>
						$(".selectDelete_btn").click(function(){
							var confirm_val=confirm("정말 삭제하시겠습니까?");
							if(conform_val){
								var checkArr = new Array();
								$("input[class='chBox']:checked").each(function(){
									checkArr.push($(this).attr("data-scrapNum"));
									});
								$.ajax({
									url:"/mypage/deleteScrap",
									type:"post",
									data:{chbox:checkArr},
									success:function(){
										location.href="/mypage/scraplist.do";}
									});
								}
							});
					</script>
				</div>
			</div>
		</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>