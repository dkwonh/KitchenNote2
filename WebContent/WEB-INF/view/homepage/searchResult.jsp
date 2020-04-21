<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/home.css"/>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="homeJs/home.js"></script>
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
				$("h3.searchParam").html("").append(params);
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
		
		
</script>
<body>

	<div id=wrapper>

		<div id=main>
			<div class=inner>
				<%@ include file="head.jsp" %> 
				<div class="navi c">
				<button id="category">카테고리</button>
				<button id="recipe">레시피</button>
				<button id="notify">공지사항</button>
				<button id="support">고객센터</button>
				</div>
				
				<section>
				<%@ include file="category.jsp" %>
				
				<h3 class="searchParam">검색어
				</h3>
				<hr>
				<div class="posts">
					<c:forEach var="item" items="${dto }">
						<%@ include file="article.jsp"%>
					</c:forEach>
				</div>
				</section>
					
					<%@ include file="nangbu.jsp" %>
				
			</div>
		</div>
	</div>
	
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>