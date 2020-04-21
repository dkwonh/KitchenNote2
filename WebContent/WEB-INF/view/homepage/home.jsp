<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/home.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<script>
<%String member_id = (String) session.getAttribute("MINFO");
			String level = (String) session.getAttribute("LEVEL");

			if (member_id == null) {
				member_id = "guest";
}%>
function logout(){
<%session.invalidate();%>
location.replace("home.do");
}

$(function(){
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
})
<%-- 
function closeCategory(){
	$("div#category").css('display',"none");
}

function searchCategory(category){
	location.href="searchCategory.do?category1="+category;
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
			location.href="recipe.do"
			});

		$("button#notify").on('click',function(){
			location.href="notifyList.do?pageNum=1"
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

	 --%>
</script>
<script src="./homeJs/home.js"></script>
<body>

	<div id=wrapper>

		<div id=main>
			<div class=inner>
				<%@ include file="head.jsp"%>
				<section id=banner>

					<div class="content">
						<header>
							<h1>WELCOME TO KITCHEN NOTE!</h1>
							<p>다양하고 참신한 레시피를 지금 만나보세요!</p>
						</header>
						<p>
							재료, 이름, 카테고리 별로 원하는 레시피를 검색할 수 있습니다.<br> 또한 셰프로 등업하여 더 많은
							혜택을 만나보세요.<br> 셰프는 유료 레시피를 등록하여 수익을 벌어들일수 있다는 사실!<br>
							뭔가 내용이 더있어야 할것 같다.<br> ㅁㄴㅇㅁㄴ아아ㅏㅇ라ㅏ아아 맘ㄴ임ㄴ아머ㅔ리탗ㅍㅌㅊㅍ,틏ㅍ<br>
							ㄴ이라먼리남어랴기ㅗ헬히ㅏㅓ<br>
						</p>
					</div>
					<span class="image object" style="inline: block; height: 400px">
						<img src="images/KakaoTalk_20200417_204831310.png">
					</span>
				</section>
				<div class="navi c">
					<button id="category">카테고리</button>
					<button id="recipe">레시피</button>
					<button id="notify">공지사항</button>
					<button id="support">고객센터</button>
				</div>

				<section>
					<%@ include file="category.jsp"%>

					<hr>
					<h3 onclick="searchCategory(${r1Category.category_id})">
						<a href="javascript:;">${r1Category.category_name}</a>
					</h3>

					<div class="posts">
						<c:forEach var="item" items="${recommand1 }">
							<%@ include file="article.jsp"%>
						</c:forEach>
					</div>
					<hr>
					<h3 onclick="searchCategory(${r2Category.category_id})">
						<a href="javascript:;">${r2Category.category_name}</a>
					</h3>

					<div class="posts">
						<c:forEach var="item" items="${recommand2 }">
							<%@ include file="article.jsp"%>
						</c:forEach>
					</div>
					<hr>
					<h3 onclick="searchCategory(${r3Category.category_id})">
						<a href="javascript:;">${r3Category.category_name}</a>
					</h3>

					<div class="posts">
						<c:forEach var="item" items="${recommand3 }">
							<%@ include file="article.jsp"%>
						</c:forEach>
					</div>
					<hr>
					<h3 onclick="searchCategory(${r4Category.category_id})">
						<a href="javascript:;">${r4Category.category_name}</a>
					</h3>
					<div class="posts">
						<c:forEach var="item" items="${recommand4 }">
							<%@ include file="article.jsp"%>
						</c:forEach>
					</div>
				</section>
				<%@ include file="nangbu.jsp"%>
			</div>
		</div>
	</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>