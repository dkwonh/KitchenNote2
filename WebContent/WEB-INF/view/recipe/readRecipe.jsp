<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>test</title>
<meta property="og:title" id="meta_title" content="KitchenNote" />
<meta property="og:site_name" content="KitchenNote">
<meta property="og:type" content="website">
<meta property="og:image" id="meta_image" content="">
<meta property="og:description" id="meta_des" content="">

<link rel="stylesheet" type="text/css"
	href="/KitchenNote2/assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
//댓글가져오기
function getComments(page){
	$.ajax({
		type:"get",
		url:"comment.do",
		data:"recipe_id="+${info.recipe_id}+"&page="+page,
		dataType:"json",			
		}).done(function(data){
				$("#commentList ul").empty();
				$("#commentPage ul").empty();
				if(data[4].length>0){
				for(var i = 0;i<data[4].length;i++){
					var str = "";
					 str += '<li><div class="comment">'
					+ '<div>'
					+ '<img src="/img/'+data[4][i].picture+'" class="profileimg">'
				+ '</div>'
				+ '<div class="content">'
				+ '<div class="com-info">'
					+ '<strong>'+data[4][i].nickname+'</strong>  '
					+'<span>'+data[4][i].commentDate+'</span>'
				+ '</div>'
				+ '<p class="message">'+data[4][i].comment+'</p>'						
				+'</div>'
			+'</div></li>' 
			$("#commentList ul").append(str);
					}
				}else{
					var str = "";
					str += '<li id="nocomment"><div> <p>첫 댓글을 입력해주세요.</p> </div></li>'
					$("#commentList ul").append(str);
					}
				var pagenum="";
				if(data[4].length>0){
			if(data[1]>10){
				pagenum += '<li><a href="javascript:;" onclick="getComments('+(data[1]-10)+')" class="button">이전</a></li> '
				}
			for(var i = data[1];i<=data[2];i++){
				if(data[i]==page){
					pagenum += ' <li><a href="javascript:;" onclick="getComments('+data[i]+')" class="page active">'+data[i]+'</a></li> '
					}else{
					pagenum += ' <li><a href="javascript:;" onclick="getComments('+data[i]+')" class="page">'+data[i]+'</a></li> '
					}
				
				}
			if(data[2]<data[0]){
				pagenum += ' <li><a href="javascript:;" onclick="getComments('+(data[1]+10)+')" class="button">다음</li>'
				}
				}
			$("#commentPage ul").append(pagenum);
			}).fail(function(e) {
				$(".error").append(e.responseText);
			})
	}
	$(function() {
		Kakao.init('2d6ead3571220ebaa318aebee1163694');

		$("#meta_title").attr("content",
				$("#share_info").attr("recipe_name"));
		$("#meta_des").attr("content",
				$("#share_info").attr("des"));
		$("#meta_image").attr("content",
				$("#share_info").attr("img_url"));
		
		getComments(1);

		//스크랩
		$("#scrap").on("submit",".create-scrap",function(){
				if($("#scrap_member_id").val()==""){
						alert("로그인 후 스크랩 가능합니다.");
					}else{
						 $.ajax({
							type:"post",
							url:"bookmark.do",
							data:$(this).serialize(),
							dataType:"json"
							}).done(function(data){
								if(data[0] == 0){
									alert("스크랩 실패");
									}else{
										alert("스크랩 성공");
										$("#scrapForm").toggleClass("create-scrap delete-scrap");
										$("#scrapForm input[type=submit]").val("스크랩취소");
										$("#scrapcount").text(data[1]);
										}
								}).fail(function(e) {
									alert(e.responseText);
								}) 
						}
				return false;
			})
			
		//스크랩 취소
		$("#scrap").on("submit",".delete-scrap",function(){
				$.ajax({
					type:"post",
					url:"bookmark/destroy.do",
					data:$(this).serialize(),
					dataType:"json"
					}).done(function(data){
						if(data == 0){
							alert("스크랩 취소 실패");
							}else{
								alert("스크랩 취소 성공");
								$("#scrapForm").toggleClass("create-scrap delete-scrap");
								$("#scrapForm input[type=submit]").val("스크랩");
								$("#scrapcount").text(data[1]);
								}
						}).fail(function(e) {
							alert(e.responseText);
						})
					return false;
			})
			
		
		//댓글쓰기
		$("#new_comment").submit(function(e){
			e.preventDefault();
			if($("input[name=com_member_id]").val()==""){
				alert("로그인 후 댓글을 쓸 수 있습니다.");
				return false;
				}else{
					$.ajax({
						type:"post",
						url:"newComment.do",
						data:$(this).serialize(),
						dataType:"json"
						}).done(function(data){
							if(data > 0){
								alert("댓글쓰기 성공");
								}else{
									alert("댓글쓰기 실패");
									}
							$("textarea[name=comment]").val("");
							$("#commentList ul").empty();
							$(".paging ul").empty();
							getComments(1);
							}).fail(function(e) {
								alert(e.responseText);
							})
					}
			
			})
		//댓글삭제
		$(".delCom").click(function(){
			if(confirm("삭제하시겠습니까?")){
				var recipe_id;
				var com_member_id;
				var comment_date;
				var param = "recipe_id="+recipe_id+"com_member_id="+com_member_id+"comment_date="+comment_date;
				$.ajax({
					type:"post",
					url:"deleteComment.do",
					data:param,
					dataType:"json"
					}).done(function(data){
						$("#commentList ul").empty();
						$(".paging ul").empty();
						getComments(1);
						}).fail(function(e) {
							alert(e.responseText);
						})
				}
			})
		

		//url복사
		$(".url_share").click(
				function() {
					prompt("아래 URL을 복사하여(Ctrl+c) 원하는 곳에 붙여넣기(Ctrl+v) 해보세요",
							window.location.href);
				});
		//트위터공유
		$(".twt_share")
				.on(
						"click",
						function() {
							$(this).attr("data-url", window.location.href);

							var url = ($(this).attr("data-url") != null) ? encodeURIComponent($(
									this).attr("data-url"))
									: "";
							var text = $(this).attr("data-text");

							if (url != "" && url != null) {
								window.open("https://twitter.com/share?text="
										+ text + "&url=" + url);
							}

						})

		//페이스북
		$(".fb_share").on("click", function() {
			
			var url = $(this).attr("data-url");
			if (url != "" && url != null) {
				fb_share(url);
			}
		});
		function fb_share(url) {
			var count = 0;

			FB.ui({
				method : 'share',
				href : url
			}, function(response) {
				if (response && !response.error_code) {
				}
			});
		}
		//카카오톡
		$(".ka_share").on("click", function() {
			Kakao.Link.createDefaultButton({
				container : '.ka_share',
				objectType : 'feed',
				content : {
					title : $("#share_info").attr("recipe_name"),
					description : $("#share_info").attr("des"),
					imageUrl : $("#share_info").attr("img_url"),
					link : {
						webUrl : window.location.href,
					}
				},buttons : [ {
					title : 'KitchenNote',
					link : {
						webUrl : window.location.href
					}
				} ]
			});
		});

		

	})//ready
	
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

@font-face {
	font-family: 'MapoFlowerIsland';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#wrapper * {
	font-family: 'Cafe24Oneprettynight';
}

#main {
	background-color: #FFF;
}

.inner div {
	margin: 1em 0;
	box-sizing: border-box;
}

#wrapper {
	position: relative;
	margin: 0px auto;
	overflow: hidden;
}

#mainimage {
	padding-top: 50px;
}

#main_img {
	width: 600px;
	height: auto;
}

.pro_img {
	width: 600px;
	height: auto;
}

.proNum {
	font-size: 25px;
	font-weight: bold;
}

.proCon {
	font-family: 'MapoFlowerIsland' !important;
	font-size: 20px;
}
/* ============== 댓글 ================ */
#new_comment {
	background-color: #f7f7f7;
	box-sizing: border-box;
	padding: 13px 18px;
	border: 1px solid #e6e6e6;
}

#new_comment textarea {
	margin-right: 5px;
	height: 71px;
	box-sizing: border-box;
	border: 1px solid #e6e6e6;
	resize: none;
	float: left;
	color: #c7c7c7;
	font-size: 17px;
	text-align: center;
	padding-top: 20px;
	color: #313131;
	overflow: auto;
}

#new_comment input[type=submit] {
	display: block;
	width: 100%;
	height: 71px;
	border: none;
	font-size: 20px;
	float: right;
}

#commentList ul li {
	position: relative;
	border-bottom: 1px solid #e6e6e6;
	padding: 20px 0 20px 84px;
	clear: left;
	min-height: 64px;
}

#commentList div {
	margin: 0;
}

#commentPage {
	margin: 0px auto;
}

#commentPage ul li {
	display: inline-block;
}

#commentList ul #nocomment {
	color: #c7c7c7;
	font-size: 20px;
	text-align: center;
	padding: 30px 0;
	min-height: inherit;
}

.profileimg {
	position: absolute;
	top: 20px;
	left: 0;
	width: 64px;
	height: 64px;
	border-radius: 50%;
	overflow: hidden;
}

#commentList ul li .com-info strong {
	color: #f56a6a;
	font-size: 20px;
	overflow: hidden;
	margin-right: 13px;
	clear: left;
}

.com-info span {
	color: #c1c1c1;
	font-size: 16px;
}

.message {
	color: #6d6e71;
	font-size: 16px;
	margin-top: 5px;
	line-height: 1.5;
}

ul.pagination {
	text-align: center;
}

/* ============== 사이드 ================ */
#sidebar .inner div {
	width: 100%;
}

#user_info {
	padding-top: 20px;
	font-size: 20px;
}

#profile_pic {
	display: block;
	width: 75px;
	height: 75px;
	border-radius: 70%;
	overflow: hidden;
	margin: auto;
}

#username, #userSNS {
	display: block;
	text-align: center;
}

#sidebar .inner div#info_basic {
	width: 100%;
	border-bottom: 0;
	padding-bottom: 0;
	font-size: 20px;
}

#info_basic * {
	text-align: center;
}

#info_basic dl * {
	margin: 0;
	padding: 0 3em;
}

#info_basic dt {
	float: left;
}

#scrapForm .btn_scrap {
	width: 200px;
	display: block;
	margin: 0 auto;
	border: none;
	color: #ff6d00;
	background-color: #fff;
	font-size: 20px;
	border-radius: 35px;
	background-repeat: no-repeat;
	background-position: 20% center;
}

#share ul.icons li a {
	font-size: 3em;
}

#share>ul>li:nth-child(1) {
	padding-left: 1em;
}

#category span, #tag span {
	cursor: pointer;
	background-color: #f56a6a;
	color: #fff;
	padding: 2px 5px;
	margin: 2px 2px;
	border-radius: 0.375em;
	display: inline-block;
	padding: 2px 5px;
}

#ingList {
	font-size: 16px;
}

ul {
	list-style: none;
}

a {
	border: 0;
}
</style>
</head>
<body>
	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : '519535785402679',
				xfbml : true,
				version : 'v2.3'
			});
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<div id="wrapper">

		<div id="main">
			<div class="inner">
				<!-- 사진 구분 : 서버,공공 -->
				<div id="mainimage">
					<c:set var="image" value="${info.image }" />
					<c:if test="${fn:contains(image,'okdab') }">
						<c:set var="mainImg" value="${info.image }" />
						<img id="main_img" src="${info.image }">
						<br>
					</c:if>
					<c:if test="${fn:contains(image,'note')}">
						<c:set var="mainImg"
							value="${pageContext.request.scheme}://${ipaddr}:${pageContext.request.serverPort}/img/${info.image }" />
						<img id="main_img" src="/img/${info.image }">
						<br>
					</c:if>
				</div>
				<h1>${info.recipe_name }</h1>
				<p style="font-size: 25px;">${info.recipe_exp }</p>
				<hr class="major">
				<div id="category">
					<h2>카테고리/태그</h2>
					<c:forEach var="cat" items="${category }">
						<span>${cat }</span>
					</c:forEach>
					<br>
					<c:forEach var="t" items="${tag }">
						<span class="icon fa-hashtag"> ${t }</span>
					</c:forEach>
				</div>
				<hr class="major">
				<div id="pro">
					<h2>레시피</h2>
					<ul>
						<c:forEach var="pro" items="${process }">

							<c:set var="proimg" value="${pro.process_image }" />
							<c:if test="${fn:contains(proimg,'okdab') }">
								<c:set var="process_image" value="${pro.process_image }" />
							</c:if>
							<c:if test="${fn:contains(proimg,'default') }">
								<c:set var="process_image" value="" />
							</c:if>
							<c:if test="${fn:contains(proimg,'note')}">
								<c:set var="process_image" value="/img/${pro.process_image }" />
							</c:if>

							<li><img class="pro_img" src="${process_image }"><br>
								<span class="proNum">${pro.process_num }.</span>&nbsp;&nbsp;<span
								class="proCon">${pro.process_content }</span></li>
						</c:forEach>
					</ul>
				</div>
				<hr class="major">
				<!-- 댓글 -->
				<div id="comment">
					<form method="post" id="new_comment">
						<div class="row uniform">
							<input type="hidden" name="recipe_id" value="${info.recipe_id }">
							<input type="hidden" name="com_member_id" value="${MINFO }">
							<div class="9u 12u$(small)">
								<textarea name="comment" placeholder="한 줄 댓글을 남겨주세요."
									maxlength="200"></textarea>
							</div>
							<div class="3u 12u$(small)">
								<input type="submit" value="댓글남기기" class="special">
							</div>
						</div>
					</form>

					<div id="commentList">
						<ul>

						</ul>
					</div>

					<div id="commentPage">
						<ul class="pagination">

						</ul>
					</div>
				</div>
			</div>
		</div>



		<div id="sidebar">
			<div class="inner">
				<div id="user_info" style="padding-bottom: 2em">
					<!-- 사용자정보 -->
					<img alt="프로필" src="/img/${writer.picture }" id="profile_pic">
					<a id="userSNS" href="${sns }">${sns }</a> <span id="username">${writer.nickname }</span>
				</div>
				<div id="info_basic">
					<dl>
						<dt class="icon fa-clock-o">조리시간</dt>
						<dd>${info.duration }</dd>
						<dt class="icon fa-heart">스크랩</dt>
						<dd id="scrapcount">${info.scrap }</dd>
					</dl>

				</div>
				<!-- 스크랩 -->
				<div id="scrap">
					<c:if test="${scrap == 1 }">
						<form method="post" id="scrapForm" class="delete-scrap">
							<input type="hidden" value="${info.recipe_id }" name="recipe_id">
							<input type="hidden" value="${MINFO }" name="scrap_member_id"
								id="scrap_member_id"> <input type="submit"
								class="btn_scrap" value="스크랩취소">
						</form>
					</c:if>
					<c:if test="${scrap != 1 }">
						<form method="post" id="scrapForm" class="create-scrap">
							<input type="hidden" value="${info.recipe_id }" name="recipe_id">
							<input type="hidden" value="${MINFO }" name="scrap_member_id"
								id="scrap_member_id"> <input type="submit"
								class="btn_scrap" value="스크랩">
						</form>
					</c:if>

				</div>

				<!-- 공유버튼 -->
				<div id="share">
					<div id="share_info" style="display: hidden" img_url="${mainImg }"
						recipe_name="${info.recipe_name }" des="${info.recipe_exp }"
						like_cnt="${info.scrap}"></div>
					<ul class="icons">
						<li><a href="javascript:;" class="url_share icon fa-link"
							title="링크"> </a></li>
						<li style="margin-right: 10px"><a href="javascript:;"
							class="fb_share icon fa-facebook" title="페이스북"
							data-url="${pageContext.request.scheme}://${ipaddr}:${pageContext.request.serverPort}/${pageContext.request.contextPath}/recipe/read.do?recipe_id=${info.recipe_id }">
						</a></li>
						<li><a href="javascript:;" class="twt_share icon fa-twitter"
							title="트위터" data-text="[${info.recipe_name }] ${info.recipe_exp}"
							data-url=""> </a></li>
						<li><a href="javascript:;" class="ka_share icon fa-comment"
							title="카카오톡"> </a></li>
					</ul>
				</div>
				<div id="ingList" style="padding: 5px; background-color: #FFF; border-radius: 0.375em;">
				<header class="major"><h2>재료리스트</h2></header>
					<table>
						<tbody>
							<!-- 재료 리스트 -->
							<c:forEach var="i" items="${ing }">
								<tr>
									<td>${i.ing_name }</td>
									<td>${i.capacity }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

	<div class="error"></div>
	<script src="/KitchenNote2/assets/js/skel.min.js"></script>
	<script src="/KitchenNote2/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/KitchenNote2/assets/js/main.js"></script>
</body>
</html>