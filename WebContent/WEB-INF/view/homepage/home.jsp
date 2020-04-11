<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style type="text/css">
	.field1>ul {
    height: 270px;
    border: 1px solid #a73f40;
    background: #fff;
    float: left;
    overflow-x: hidden;
    overflow-y: visible;
}

}
.big_sort {
    width: 190px;
    margin-right: 9px;
    box-sizing: border-box;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.small_sort {
    width: 396px;
    height: 270px;
    float: left;
    padding: 10px 13px;
    box-sizing: border-box;
    font-family: Microsoft YaHei,'NS';
    box-sizing: border-box;
}

div#glayLayer{
	display:none;
	position:fixed;
	left:0;
	top:0;
	height:100%;
	width:100%;
	background:black;
	filter:alpha(opacity=60);
	opacity: 0.60;
}
* html div#glayLayer{
	position:absolute;
}
#overLayer{
	display:none;
	position: fixed;
	top:50%;
	left:50%;
	margin-top:-244px;
	margin-left:-325px;
}
* html #overLayer{
	position: absolute;
}
.float {
float:left;
}

.navi button{
float: left;
}
.c button 
{width:25%}
ul li {
	list-style-type:none;
}
</style>
</head>
<script>
function loadCategory(ing_category){
	var url = "category.do"
	var params = "ing_category="+ing_category
	$.ajax({
		type:"get"		
		,url:url
		,data:params		
		,dataType:"json" })
		.done(function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			$(".small_list").each(function() {	
				$(".small_list input").remove();
				$(".small_list").text("");
			});
			 for(var i=0; i < args.length; i++) {
				  $(".small_list").append("<li data-ing="+args[i].ing_id+" onclick=ingredients("+args[i].ing_id+",'"+args[i].ing_name+"')>"+args[i].ing_name +"</li>");
			 }
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
	}

	function itemClick(item) {
		alert("레시피 읽기 기능 ID :" + item);
	}

	function nangbu() {
		location.href = "nangbu.do";
	}

	$(function(){
		$("button#category").on('click',function(){
				var s = $("div#category").css('display')
				if($("div#category").css('display')=='none'){
					$("div#category").css('display','block');
				} else{
					$("div#category").css('display','none');
					}
			});

		$("button#recipe").on('click',function(){
			alert("레시피 보기");
			});

		$("button#event").on('click',function(){
			alert("이벤트 보기");
			});
			
		$("button#support").on('click',function(){
			alert("고객센터 보기");
			});



		$("body").append("<div id='glayLayer'></div><div id='overLayer'></div>");
		
		$("#glayLayer").click(function(){
			$(this).hide()
			$("#overLayer").hide();
		});
		
		$("a.modal").click(function(){
			$("#glayLayer").show();
			$("#overLayer").show().html($("div#nangbu").html());
			return false;
		});
		
		if($.browser.msie && $.browser.version<7){
			$(window).scroll(function(){
				$("#glayLayer").css('top',$(document).scrollTop());
				$("#overLayer").css('top',($(document).scrollTop()+$(window).height()/2) +"px");
			});
		}

		
		});

	function ingredients(id,name){
		var str = String(id);
		if($(".selected li[data-ing="+str+"]").length==0){
			$(".selected").append("<li data-ing="+id+" id="+id+" onclick='diselectIngredients("+id+")'><input type='hidden' name='ingredients[]' value="+id+">"+name+"</li>");
		}
		else{
			$(".selected li[data-ing="+str+"]").remove();
		}
	}

	function diselectIngredients(id){
		$(".selected li[data-ing="+str+"]").remove();
	}

	
</script>
<body>

	<div id=wrapper>

		<div id=main>
			<div class=inner>
				<header id="header">
					<a href="index.html" class="logo"><strong>Editorial</strong>
					KitchenNote</a>
					<form action="home.do" method="post">
						<input type="text" name="search">
						<input type=submit value=검색> 
					</form>	
					<ul class="icons"> 
						<li><a  class="icon fa-twitter modal"><span
								class="label">twitter</span></a></li>
						<li><a href="kakaoPay.do" class="icon fa-facebook"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
					</ul>
					
				</header>
				
				<div class="navi c">
				<button id="category">카테고리</button>
				<button id="recipe">레시피</button>
				<button id="event">이벤트</button>
				<button id="support">고객센터</button>
				</div>
				<section>
				<div id="category" class="4u 12u$(small)" style="display:none">
					<form action="searchCategory.do">
						<ul>
							<li style="display:inline-block">
								<h3>상황별 요리</h3>
								<ul class="first">
									<c:forEach var="item" items="${category1}">
										<li><input id="${item.category_id }" type="radio" name="category1" value="${item.category_id }"><label for="${item.category_id }">${item.category_name }</label></li>
									</c:forEach>
									<li><input id="no1" type="radio" name="category1" value="0"><label for="no1">선택안함</label></li>
								</ul>
							</li>
							<li style="display:inline-block">
								<h3>나라별 요리</h3>
								<ul class="second">
								<c:forEach var="item" items="${category2}">
										<li><input id="${item.category_id }" type="radio" name="category2" value="${item.category_id }"><label for="${item.category_id }">${item.category_name }</label></li>
									</c:forEach>
									<li><input id="no2" type="radio" name="category2" value="0"><label for="no2">선택안함</label></li>
									</ul>
							</li>
							<li style="display:inline-block">
								<h3>재료별 요리</h3>
								<ul class="third">
								<c:forEach var="item" items="${category3}">
										<li><input id="${item.category_id }" type="radio" name="category3" value="${item.category_id }"><label for="${item.category_id }">${item.category_name }</label></li>
									</c:forEach>
									<li><input id="no3" type="radio" name="category3" value="0"><label for="no3">선택안함</label></li>
									</ul>
							</li>
							<li style="display:inline-block">
								<h3>조리별 요리</h3>
								<ul class=last>
								<c:forEach var="item" items="${category4}">
										<li><input id="${item.category_id }" type="radio" name="category4" value="${item.category_id }"><label for="${item.category_id }">${item.category_name }</label></li>
									</c:forEach>
									<li><input id="no4" type="radio" name="category4" value="0"><label for="no4">선택안함</label></li>
								</ul>
							</li>
						</ul>
						
						<input type="submit" value="검색">
					</form>
				</div>
			
					기준1:<br>
					<c:forEach var="item" items="${dto }">
						<fieldset class=float onclick="itemClick(${item.recipe_Id})">
							<img src="${item.image}"><br> ${item.recipe_Name }<br>
							${item.recipe_Exp}<br> ${item.nickname }<br>
							<p>시간:${item.duration }, 조회수:${item.readcount }</p>
						</fieldset>
					</c:forEach>
					<button id="recipe">더보기</button>
					</section>
					
					<div id="nangbu" style="display:none">
					<form method="post" action="nangbu.do">
					<input type="submit" value="재료로검색">
					<fieldset class="field1">
						<ul id="big_sort" class="big_list">
							<c:forEach var="item" items="${nangbuCategory }">
								<li id="${item.key}" onclick="loadCategory(${item.key})">${item.value.category_name}</li>
							</c:forEach>
						</ul>
						<ul id="small_sort" class="small_list">
							<c:forEach var="item" items="${nangbuList }">
							<li data-ing="${item.ing_id }" onclick="ingredients(${item.ing_id},'${item.ing_name }')">${item.ing_name } </li>
							</c:forEach>
						</ul>
						<div id="selected" class="selected">
						재료를 선택하세요
						</div>
					</fieldset>
					</form>
					</div>
				
			</div>
		</div>
	</div>
	
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>