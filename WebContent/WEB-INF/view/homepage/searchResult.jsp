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

.view{
    width:300px;
	height:250px;
	overflow: hidden;
}
.scrollBlind{
	height:100%;
	overflow-y:scroll;
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

.first, .second, .third, .last{
	text-align:left;
}

.navi button{
float: left;
}
.c button 
{width:25%}
ul li {
	list-style-type:none;
}

.menu_over{
	clear: both;
    border-bottom: 1px solid #adadad;
    position: absolute;
    top: 300px;
    left:4em;
    right:4em;
    background-color: rgba(255,255,255,0.95);
    z-index: 30;
   
}

.posts article{
	cursor:pointer;
}

</style>
</head>
<script>
<%
	String member_id = (String)session.getAttribute("MINFO");
	String level = (String)session.getAttribute("LEVEL");
	
	if(member_id == null){
		member_id = "guest";
	}
%>
function logout(){
<%
	session.invalidate();
%>
location.replace("home.do");
}

function closeCategory(){
	$("div#category").css('display',"none");
}

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

	function attatch(args){
		$("div.posts").append("<article onclick=itemClick("+args.recipe_Id+")>"
				+"<a class=image>"+
		"<img src="+args.image+" width=500 height=300>"+
	"</a>"+
	"<h3>"+args.recipe_Name +"</h3>"+
	"<p>"+
		args.recipe_Exp+
	"</p>"+
	"<span><a class='icon fa-clock-o'></a>"+args.duration+"</span>"+
	"<span><a class='icon fa-eye'></a>"+args.readcount+"</span>"+
	"</article>");
	}
	

	function searchCategory(){
		var url = "searchCategoryAjax.do";
		var params = $('form.form').serialize();
		$.ajax({
			type:"get"		
			,url:url
			,data:params		
			,dataType:"json" })
			.done(function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
				$("h3.searchParam").html("").append("검색 결과");
				$("div.posts").html("");
				for(i = 0; i < args.length; i++){
					attatch(args[i]);
			}
	 			})
		    .fail(function(e) {
		    	alert(e.responseText);
		    })
		}

	function searchNangbu(){
		var url = "searchNangbu.do";
		var params = $('form.nangbu').serialize();
		$.ajax({
			type:"get"		
			,url:url
			,data:params		
			,dataType:"json" })
			.done(function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
				$("h3.searchParam").html("").append(params);
				$("div.posts").html("");
				$("#glayLayer").hide();
				$("#overLayer").hide();
				$(".selected").html("");
				
				for(i = 0; i < args.length; i++){
				attatch(args[i]);
			}
	 			})
		    .fail(function(e) {
		    	alert(e.responseText);
		    })
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
			});

		$("button#notify").on('click',function(){
			alert("공지사항 보기");
			});
			
		$("button#support").on('click',function(){
			alert("고객센터 보기");
			});
		
		if("<%=member_id%>"=="guest"){
			$("li.out").css("display","inline-block");
			$("li.in").css("display","none");
		}
		else{
			$("li.in").css("display","inline-block");
			$("li.out").css("display","none");
		}

		if("<%=level%>"!="0"){
			$("li.admin").css("display","none");
		}
		else{
			$("li.admin").css("display","inline-block");
		}


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
					<a href="home.do" class="logo"><img src="images/KakaoTalk_20200420_110749263.png" width="300px" height=150px>
					KitchenNote</a>
					<section id=search class="alt 4u 12u$">
					<form method=post>
					<input type=text name=search id=query placeholder="Search">
					</form>
					</section>
					<ul class="icons"> 
						<li class="out" onclick="logout()"><a href="login/loginForm.do" class="icon fa-sign-in"><span class=label>
							sign-in
						</span></a>
						<li class="in"><a href="#" class="icon fa-sign-out"><span class=label>
							sign-out
						</span></a>
						
						<li class="in"><a href=# class="icon fa-user"><span
								class="label">mypage</span></a></li>
								
						<li><a href=# class="icon fa-archive modal"><span
								class="label">nangbu</span></a></li>

						<li class="in"><a href="#" class="icon fa-edit"><span
								class="label">Facebook</span></a></li>
								
						<li class="admin"><a href="admin.do?pageNum=1&&filter=&&search=" class="icon fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
					</ul>
				
				</header> 
				<div class="navi c">
				<button id="category">카테고리</button>
				<button id="recipe">레시피</button>
				<button id="notify">공지사항</button>
				<button id="support">고객센터</button>
				</div>
				
				<section>
				<div id="category">
					<form style="text-align:center" class="form">
						<ul style="text-align:center">
							<li style="display:inline-block;vertical-align:top">
								<h3>상황별 요리</h3>
								<div class="view">
								<div class="scrollBlind">
								<ul class="first">
									<c:forEach var="item" items="${category1}">
										<li><input id="${item.category_id }" type="radio" name="category1" value="${item.category_id }"><label for="${item.category_id }">${item.category_name }</label></li>
									</c:forEach>
									<li><input id="no1" type="radio" name="category1" value="0"><label for="no1">선택안함</label></li>
								</ul>
								</div>
								</div>
							</li>
							<li style="display:inline-block;vertical-align:top">
								<h3>나라별 요리</h3>
								<div class="view">
								<div class="scrollBlind">
								<ul class="second">
								<c:forEach var="item" items="${category2}">
										<li><input id="${item.category_id }" type="radio" name="category2" value="${item.category_id }"><label for="${item.category_id }">${item.category_name }</label></li>
									</c:forEach>
									<li><input id="no2" type="radio" name="category2" value="0"><label for="no2">선택안함</label></li>
									</ul>
									</div>
									</div>
							</li>
							<li style="display:inline-block;vertical-align:top">
								<h3>재료별 요리</h3>
								<div class="view">
								<div class="scrollBlind">
								<ul class="third">
								<c:forEach var="item" items="${category3}">
										<li><input id="${item.category_id }" type="radio" name="category3" value="${item.category_id }"><label for="${item.category_id }">${item.category_name }</label></li>
									</c:forEach>
									<li><input id="no3" type="radio" name="category3" value="0"><label for="no3">선택안함</label></li>
									</ul>
									</div>
									</div>
							</li>
							<li style="display:inline-block;vertical-align:top">
								<h3>조리별 요리</h3>
								<div class="view">
								<div class="scrollBlind">
								<ul class=last>
								<c:forEach var="item" items="${category4}">
										<li><input id="${item.category_id }" type="radio" name="category4" value="${item.category_id }"><label for="${item.category_id }">${item.category_name }</label></li>
									</c:forEach>
									<li><input id="no4" type="radio" name="category4" value="0"><label for="no4">선택안함</label></li>
								</ul>
								</div>
								</div>
							</li>
						</ul>
						<input type="button" value="검색" onclick="searchCategory()">
					</form>
				</div>
				
				<h3 class="searchParam">검색어
				</h3>
				<hr>
				<div class="posts">
					<c:forEach var="item" items="${dto }">
						<article onclick="itemClick(${item.recipe_Id})">
							<a class="image">
								<img src="${item.image}" width=500 height=300>
							</a>
							<h3>${item.recipe_Name }</h3>
							<p>
								${item.recipe_Exp}
							</p>
							<span><a class="icon fa-clock-o"></a>${item.duration}</span>
							<span><a class="icon fa-eye"></a>${item.readcount}</span>
						</article>
					</c:forEach>
				</div>
				</section>
					
					<div id="nangbu" style="display:none">
					<form class="nangbu">
					<input type="button" value="검색" onclick="searchNangbu()">
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