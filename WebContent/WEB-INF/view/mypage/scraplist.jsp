<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="allCheck">
					<input type="checkbox" name="allCheck" id="allCheck" />
					<label for="allCheck">모두 선택</label>
				</div>
				<script>
					$("#allCheck").click(function(){
						var chk=$("#allCheck").prop("checked");
						if(chk){
							$(".chBox").prop("checked",true);
						} else{$(".chBox").prop("checked",false);
						}
					});
				</script>
				<div class="delBtn">
					<button type="button" class="selectDelete_btn">선택삭제</button>
				</div>
				<script>
				$(".selectDelete_btn").click(function(){
					var confirm_val=confirm("스크랩 취소 하시겠어요?");
					if(confirm_val){
						var checkArr = new Array();
						$("input[class='chBox']:checked").each(function(){
							checkArr.push($(this).attr("data-recipe_id"));
							});
						$.ajax({
							url:"mypage/deleteScrap.do",
							type:"post",
							data:{chbox:checkArr},
							success:function(result){
								if(result==1){
									location.href="scraplist.do";
									}else {
										alert("삭제실패");
										}
								}
							});
						}
					});
				</script>
			</li>

			<c:forEach items="${scraplist}" var="scraplist">
				<li>
					<div class="checkBox">
						<input type="checkbox" name="chBox" class="chBox" data-recipe_id="${scraplist.recipe_id}"/>
					</div>
					<script>
						$(".chBox").click(function(){
							$("#allCheck").prop("checked",false);
						});
					</script>
					<div class="recipeInfo">
						<div class="recipe_image">
							<span><img src="${scraplist.image}"></span>
						</div>
						<div class="recipe_c">
							<ul>
								<li>${scraplist.recipe_name}</li>
								<li>조회수${scraplist.readcount}</li>
								<li>${scraplist.scrap}</li>
							</ul>
						</div>

						<div class="delete">
							<button type="button" class="delete_btn${scraplist.recipe_id}btn" data-recipe_id="${scraplist.recipe_id}">삭제</button>
						</div>
						<script>
						$("delete_btn${scraplist.recipe_id}btn").click(function(){
							var confirm_val=confirm("스크랩을 취소하시겠어요?");

							if(confirm_val){
								var checkArr = new Array();
								checkArr.push($(this).attr("data-recipe_id"));
								$.ajax({
									url:"mypage/deleteScrap.do",
									type:"post",
									data:{chbox:checkArr},
									success:function(result){
										if(result==1){
											location.href="scraplist.do";
											}else{
												alert("삭제 실패");
												}
										}
									});
								}
							});
						</script>
						
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>