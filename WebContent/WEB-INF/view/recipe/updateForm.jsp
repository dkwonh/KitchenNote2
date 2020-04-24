<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>레시피 수정</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/KitchenNote2/assets/css/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
$(function(){

	$("input:text").keydown(function(e) {
		if (e.which == 13)
			return false;
	})
	
	//메인사진 미리보기
		$("input[name=imagefile]").change(function(e) {
			$("#mainImg").empty();
			var files = e.target.files;

			if(!files[0].type.match("image.*")){
				alert("이미지를 업로드해주세요");
				$("input[name=imagefile]").val("");
				return;
				}

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#mainImg").append('<img src='+e.target.result+'>');
			}

			reader.readAsDataURL(files[0]);
		});
	//과정사진 미리보기
		$("#process").on("change","input[name=process_imagefile]",function(e){
			var inputimg = $(this);
			$(this).parent().siblings(".proImg").empty();
			var files = e.target.files;
			
			if(!files[0].type.match("image.*")){
				alert("이미지를 업로드해주세요");
				$("input[name=process_imagefile]").val("");
				return;
				}

			var reader = new FileReader();
			reader.onload = function(e){
				inputimg.parent().siblings(".proImg").append('<img src="'+e.target.result+'">')
				}

			reader.readAsDataURL(files[0]);	
			})
	
	//카테고리 선택
	$.ajax({
		type:"post",
		url:"getCategoryId.do",
		data:"recipe_id="+${info.recipe_id},
		dataType:"json"
		}).done(function(data){
			for(var i = 0;i<data.length;i++){
				$("select[name=category_id]").each(function(){
					$("option",this).each(function(){
						if($(this).val()==data[i]){
							$(this).attr("selected","selected");
							}
						})
				})
				}
		}).fail(function(e) {
			alert("카테고리를 가져오는데 실패했습니다.");
		}) 
	
	//태그추가
	$("#tag_input")
			.on(
					"keyup",
					function(e) {
						var tag = "";
						var existed = false;

						if (e.which == 188 || e.which == 13) {

							tag = $(this).val().replace(/[\s,]/g, "");
							$(this).val("");

							$("#hash_inbox span").each(
									function() {
										var name = $(this).find(
												".htag_name").val();
										if (name == tag)
											existed = true;
									})

							if (tag != "" && !existed) {
								$("#hash_inbox")
										.append(
												'<span class="added_tag icon fa-hashtag"> '
														+ tag
														+ ' <a href="javascript:;">X</a>'
														+ '<input type="hidden" class="htag_name" name="tag_name" value="'+tag+'"></span>')
							}
						}

					});//keyup
	//태그삭제
	$("#hash_inbox").on("click", ".added_tag", function() {
		$(this).remove();
	})

	//재료 자동완성
		$("#ingredient").on("keyup", "input[name=ing_name]", function() {
			var param = "ing_name=" + $(this).val();
			$(this).autocomplete({
				source : function(request, response) {
					$.ajax({
						type : "post",
						url : "search_ing.do",
						data : param,
						dataType : "json",
						success : function(data) {
							response($.map(data, function(item) {
								return {
									label : item,
									value : item
								}
							}))
						}
					})
				},
				focus : function(event, ui) {
					return false;
				},
				delay : 100
			})
		})//자동완성

		$("input[name=price]").keyup(function(e) {
			if (e.which == 189 || e.which == 109) {
				$(this).val("0");
			}
		})
		
		//메인사진지우기
		$("#delMainImg").click(function(){
			$(this).siblings("input[type=file]").val("");
			$("#mainImg img").attr("src","/img/"+$("input[name=image]").val());
			})
		
		//과정사진 지우기
		$("#process").on("click",".delProImg",function(){
			$(this).siblings("input[name=process_imagefile]").val("");
			if($(this).siblings("input[name=process_image]").val()){
			$(this).parent().siblings(".proImg").find("img").attr("src","/img/"+$(this).siblings("input[name=process_image]").val());
			}else{
				$(this).parent().siblings(".proImg").find("img").hide();
				}
			})
		

		$("#updateForm").on("submit",function(){
			var flag = 1;
				$("#process li").each(function(){
					if($("input[name=process_image]",this).val()==""){
						if($("input[name=process_imagefile]",this).val()==""){
								alert("과정 사진을 추가해주세요");
								flag = -1;
								return false;
							}
					}
					})
					if(flag < 0){
							return false;
					}
			})
	
})//ready

//재료삭제
function del_in(obj) {
	if ($("#ingredient li").length == 1) {
		alert('최소 한가지 이상의 재료를 등록해주세요.');
	} else {
		$(obj).parent().remove();
	}
}

//재료추가
function add_in() {
	$("#ingredient")
			.append(
					'<li><input type="text" name="ing_name" placeholder="재료명" required>&nbsp;&nbsp;'
							+ '<input type="text" name="capacity" placeholder="분량">'
							+ '&nbsp;&nbsp;<a class="button icon fa-remove" onclick="del_in(this)"></a></li>')
}

//순서맞추기
function set_num() {
	var index = 1;
	$("#process li").each(function() {
		$("input[name=process_num]", this).val(index++);
	})
}

//과정추가
function add_pro() {
	$("#process")
			.append(
					'<li class="box"><input type="hidden" value="1" name="process_num">'
							+ '<div class="9u 12u$(small)">'
							+ '<textarea name="process_content" placeholder="설명" required></textarea><br>'
							+ '<input name="process_imagefile" type="file" accept="image/*"><a class="icon fa-trash delProImg">사진삭제</a><input type="hidden" name="process_image" value="">'
							+ '</div>'
							+ '<div class="proImg 2u 10u(small)"></div> <a class="button icon fa-remove" onclick="del_pro(this)" style="margin: auto"></a></li>');
	set_num();
}

//과정삭제
function del_pro(obj) {
	if ($("#process li").length == 1) {
		alert('레시피 조리과정을 등록해주세요.');
	} else {
		$(obj).parent().remove();
		set_num();
	}
}

</script>
<style>
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#main * {
	font-family: 'Cafe24Oneprettynight';
}

#mainImg {
	padding:0;
	height: 200px;
	background: #f5f6f7;
	float: right;
	text-align: center;
	border-radius: 0.375em;
}

#mainImg img {
	height: 100%;
	display: inline-block;
}

#delMainImg, .delProImg{
font-size: larger;
cursor: pointer;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

input[type=number] {
	-webkit-appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	outline: 0;
	padding: 0 1em;
	text-decoration: none;
	height: 2.75em;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

select {
	padding-bottom: 2px;
}

#form2 .row {
	margin: 0;
}

li {
	display: flex;
}

#ingredient li, #process li {
	margin-bottom: 0.5em;
	align-items: center;
}

.icon.fa-remove {
	border-radius: 50%;
	padding: 0 1.3em;
}

.button.icon:before {
	margin: 0;
}

.plusbtn {
	text-align: center;
}

.icon.fa-plus {
	font-size: 1.2em;
	margin: 2em auto 0;
}

#process li>* {
	margin-right: 0.5em;
}

#process textarea {
	height: 140px;
}

.proImg {
	width: 200px;
	height: 200px;
	background-color: #f5f6f7;
	flex-shrink: 0;
	border-radius: 0.375em;
}

.proImg img {
	border-radius: 0.375em;
	width: 100%;
	height: 100%;
}

#tag_input {
	margin-bottom: 0.5em;
}

#hash_inbox {
	background-color: #f5f6f7;
	padding: 10px;
	border-radius: 0.375em;
}

#hash_inbox strong{
font-size: 20px;
}

#hash_inbox span {
	margin-bottom: 10px;
}

.added_tag {
	font-size:17px;
	font-weight:bolder;
	cursor: pointer;
	background-color: #f56a6a;
	color:#FFF;
	padding: 2px 5px;
	margin: 2px 2px;
	border-radius: 0.375em;
	display: inline-block;
}

.added_tag a {
	color: black;
	border-bottom: 0;
	font-weight: normal;
}

input[type=submit] {
	font-size: 1.2em;
	float: right;
	margin-left: 1em;
}
</style>
</head>
<body>
<c:if test="${MINFO != info.member_id }">
<script>alert("수정할 수 없는 레시피입니다.");
location.replace("/KitchenNote2/home.do");
</script>
</c:if>
	<div id="main">
		<div class="inner">
		<%@ include file="../homepage/head.jsp"%>
		<div class="10u" style="margin: 1em auto;">
			<header class="main">
				<h1 style="margin-top: 0.5em;">레시피 수정하기</h1>
			</header>
			<hr class="major">
			<form method="post" enctype="multipart/form-data" id="updateForm">
				<input type="hidden" name="recipe_id" value="${info.recipe_id }">
				<div class="form1 row">
					<h2 class="3u">레시피 제목</h2>
					<div class="9u$">
						<input type="text" name="recipe_name" value="${info.recipe_name }">
					</div>
					<h2 class="3u">요리소개</h2>
					<div class="9u$">
						<input type="text" name="recipe_exp" value="${info.recipe_exp }">
					</div>
					<h2 class="3u">요리 대표사진</h2>
					<div class="9u$">
						<input type="file" name="imagefile" accept="image/*"><a class="icon fa-trash" id="delMainImg">사진삭제</a><input
							name="image" type="hidden" value="${info.image }">
					</div>
					<div id="mainImg" class="6u">
						<img src="/img/${info.image }">
					</div>


					<c:if test="${LEVEL ==2 }">
						<div class="row" style="width: 100%;">
							<h2 class="3u">가격</h2>
							<div class="6u">
								<input name="price" type="number" min="0" required value="${info.price }" />
							</div>
							<br>
						</div>
					</c:if>
				</div>
				<hr class="major">
				<h2>카테고리</h2>
				<div class="form2 row" style="margin: 0;">
					<select name="category_id" class="3u 12u$(small)">
						<option value="-1">:: 상황 ::</option>
						<option value="1">면역력강화</option>
						<option value="2">간식/야식</option>
						<option value="3">술안주</option>
						<option value="4">해장요리</option>
						<option value="5">손님 접대 요리</option>
						<option value="6">나들이 요리</option>
						<option value="7">파티/명절요리</option>
						<option value="8">실생활요리</option>
					</select> <select name="category_id" class="3u 12u$(small)">
						<option value="-1">:: 나라 ::</option>
						<option value="9">한식 요리</option>
						<option value="10">중식 요리</option>
						<option value="11">일식 요리</option>
						<option value="12">동남아/인도 요리</option>
						<option value="13">멕시칸 요리</option>
						<option value="14">양식 요리</option>
						<option value="15">퓨전 요리</option>
						<option value="16">이국적인맛</option>
					</select> <select name="category_id" class="3u 12u$(small)">
						<option value="-1">:: 재료 ::</option>
						<option value="17">육류 요리</option>
						<option value="18">채소류 요리</option>
						<option value="19">해산물 요리</option>
						<option value="20">콩/두부 요리</option>
						<option value="21">과일 요리</option>
						<option value="22">달걀/유제품 요리</option>
						<option value="23">면/만두 요리</option>
						<option value="24">김치 요리</option>
						<option value="25">제철재료 요리</option>
						<option value="26">가공식품 요리</option>
					</select> <select name="category_id" class="3u$ 12u$(small)">
						<option value="-1">:: 조리법 ::</option>
						<option value="27">밥요리</option>
						<option value="28">면요리</option>
						<option value="29">국물요리</option>
						<option value="30">찜/조림/구이요리</option>
						<option value="31">볶음/튀김/부침요리</option>
						<option value="32">나물/샐러드요리</option>
						<option value="33">김장/절임요리</option>
						<option value="34">베이킹/디저트요리</option>
						<option value="35">양념/소스/잼</option>
						<option value="36">음료/차/커피</option>
					</select>
				</div>
				<hr class="major">

				<h2>재료</h2>
				<ul id="ingredient">
					<c:forEach var="i" items="${ing }">
						<li><input type="text" name="ing_name" value="${i.ing_name }"
							placeholder="재료명">&nbsp;&nbsp;<input type="text"
							name="capacity" value="${i.capacity }" placeholder="분량">&nbsp;&nbsp;<a
							class="button icon fa-remove" onclick="del_in(this)"></a></li>
					</c:forEach>
				</ul>
				<div class="plusbtn">
					<a class="button icon special fa-plus" onclick="add_in()">요리재료추가</a>
				</div>

				<hr class="major">
				<h2>요리순서</h2>
				<p>
					조리시간 총 <input name="duration" type="number"
						placeholder="조리시간(숫자만 입력)" required value="${info.duration }">분
					소요
				</p>

				<ul id="process">
					<c:forEach var="p" items="${process }">
						<li class="box"><input type="hidden" value="${p.process_num }"
							name="process_num">
							<div class="9u 12u$(small)">
								<textarea name="process_content" placeholder="설명" required>${p.process_content }</textarea>
								<br>
								<input name="process_imagefile" type="file" accept="image/*"><a class="icon fa-trash delProImg">사진삭제</a><input type="hidden" name="process_image"
							value="${p.process_image }">
							</div>
							<div class="proImg">
								<img src="/img/${p.process_image }">
							</div> <a class="button icon fa-remove delPro" onclick="del_pro(this)" style="margin: auto"></a></li>
					</c:forEach>
				</ul>
				<div class="plusbtn">
					<a class="button special icon fa-plus" onclick="add_pro()">조리과정추가</a>
				</div>
				<hr class="major">
				<div class="row">
					<h2 class="3u">태그</h2>
					<div id="hashtag" class="9u$">
						<input type="text" id="tag_input" placeholder="태그 입력">
						<div id="hash_inbox">
							<strong>입력된 해시태그</strong><br>
							<c:forEach var="t" items="${tag }">
								<span class="added_tag icon fa-hashtag"> ${t } <a href="javascript:;">X</a><input
									type="hidden" class="htag_name" name="tag_name" value="${t}"></span>
							</c:forEach>
						</div>
					</div>
				</div>
				<hr class="major">
				<input type="submit" value="수정">

			</form>
			</div>
		</div>
	</div>
	<script src="/KitchenNote2/assets/js/skel.min.js"></script>
	<script src="/KitchenNote2/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/KitchenNote2/assets/js/main.js"></script>
</body>
</html>