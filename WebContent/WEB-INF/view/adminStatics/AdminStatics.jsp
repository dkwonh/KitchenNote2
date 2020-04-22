<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="viewport" content="width=device-width, initial-scale = 1">
<meta http-equiv="Content-Type" content="text/html; charset = utf-8" pageEncoding="utf-8">
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src='//unpkg.com/vue-chartjs@2.6.0/dist/vue-chartjs.full.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.js'></script>
<script src='//unpkg.com/hchs-vue-charts@1.2.8'></script>
<chartjs-line :labels="labels" :data="dataset" :bind="true"></chartjs-line>
<title>홈페이지 통계</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

</head>
<style>
.container {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
	padding-top: 10%;
}
</style>
<style type="text/css">
.navi input {
	float: left;
}

.c input {
	width: 25%
}

.searchbtn input {
	font-size: 15px;
	padding: 10px 10px
}
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<a href="/KitchenNote2/home.do" class="logo"><img
						src="../images/kitchennote-logo.png" width="300px"
						height=150px> KitchenNote</a>
					<section id=search class="alt 4u 12u$">
						<form method=post action=recipe.do>
							<input type=text name=search id=query placeholder="Search">
						</form>
					</section>
					<ul class="icons">
						<li class="out"><a href="/KitchenNote2/login/loginForm.do"
							class="icon fa-sign-in"><span class=label> sign-in </span></a>
							<li class="in"><a href="/KitchenNote2/login/logoutOk.do"
							class="icon fa-sign-out"><span class=label>
							sign-out
						</span></a>
						
						
						<li class="in"><a href=# class="icon fa-user"><span
								class="label">mypage</span></a></li>
								
						<li><a href=# class="icon fa-archive modal"><span
								class="label">nangbu</span></a></li>

						<li class="in"><a href="#" class="icon fa-edit"><span
								class="label">Facebook</span></a></li>
								
						<li class="admin"><a
							href="/KitchenNote2/admin.do?pageNum=1&&filter=&&search="
							class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
					</ul>
				
				</header> 
				<script>
				<%
					String member_id = (String)session.getAttribute("MINFO");
					Integer level = (Integer)session.getAttribute("LEVEL");
				%>
				$(function(){
					if("<%=member_id%>"== "null"){
						$("li.out").css("display","inline-block");
						$("li.in").css("display","none");
					}
					else{
						$("li.in").css("display","inline-block");
						$("li.out").css("display","none");
					}

					if("<%=level%>"!= "0" ){
						$("li.admin").css("display","none");
					}
					else{
						$("li.admin").css("display","inline-block");
					}
				});
				</script>
				<div>
					<article>
						<br>
						<p>
						
									<h2>홈페이지 통계</h2>
						<form method="POST">
							<hr>
							<select id="statics" name="statics">
								<option value="recipe">월별 레시피 등록건수</option>
								<option value="user">월별 회원 가입자수</option>
								<option value="sale">월별 레시피 판매건수</option>
							</select>
						</form>
					</article>
				</div>
				<script src='//cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js'></script>
				<script
								src='//unpkg.com/vue-chartjs@2.6.0/dist/vue-chartjs.full.min.js'></script>
				<script
								src='//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.js'></script>
				<script src='//unpkg.com/hchs-vue-charts@1.2.8'></script>
				<div>
					<canvas id="canvas"></canvas>
				</div>

				<script>
					$(document).ready(function() {

						$('#statics').change( function(){	
										var statics = "statics="+ $("#statics").val();
										var url;

										if ($("#statics").val() == "recipe") {
											url = "recipeAction.do";
										} else if ($("#statics").val()=="user") {
											url = "userAction.do";
										} else if ($("#statics").val()=="sale") {
											url = "saleAction.do";
										}
										$.ajax({
													type : "POST",
													url : url,
													data : statics,
													dataType : "json",
													error : function(error) {
														alert("에러"+ error.status);
													},
													success : function(args) {
														var arrayData = [ 0, 0,
																0, 0, 0, 0, 0,
																0, 0, 0, 0, 0 ];
														var label = "";
														var color;

														if ($("#statics").val() == "recipe") {
															color = "rgba(255, 201, 14, 1)";
															label = "레시피 등록건수";
															for (var i = 0; i < 12; i++) {
																for ( var j in args) {
																	if (args[j].monthRecipe == (i + 1)) {
																		arrayData[i] = args[j].recipeCount;
																	}
																}

															}
														} else if ($("#statics")
																.val() == "user") {
															color = "rgba(54, 162, 235, 1)";
															label = '가입 회원 수';

															for (var i = 0; i < 12; i++) {
																for ( var j in args) {
																	if (args[j].monthUser == (i + 1)) {
																		arrayData[i] = args[j].userCount;
																	}
																}
															}
														
														} else if ($("#statics")
																.val() == "sale") {
															color = "rgba(75, 192, 192, 1)";
															label = '레시피 판매건수';

															for (var i = 0; i < 12; i++) {
																for ( var j in args) {
																	if (args[j].monthSale == (i + 1)) {
																		arrayData[i] = args[j].recipeSaleCount;
																	}
																}

															}
															
														}
														new Chart(
																document.getElementById("canvas"),
																{type : 'line',
																	data : {
																		labels : [
																				'1월',
																				'2월',
																				'3월',
																				'4월',
																				'5월',
																				'6월',
																				'7월',
																				'8월',
																				'9월',
																				'10월',
																				'11월',
																				'12월' ],
																		datasets : [ {
																			label : label,
																			data : arrayData,
																			borderColor : color,
																			backgroundColor : "rgba(255, 201, 14, 0.5)",
																			fill : false,
																			lineTension : 0
																		} ]
																	},
																	options : {
																		responsive : true,
																		title : {
																			display : true,
																			text : '홈페이지 통계'
																		},
																		tooltips : {
																			mode : 'index',
																			intersect : false,
																		},
																		hover : {
																			mode : 'nearest',
																			intersect : true
																		},
																		scales : {
																			xAxes : [ {
																				display : true,
																				scaleLabel : {
																					display : true,

																				}
																			} ],
																			yAxes : [ {
																				display : true,
																				ticks : {
																					suggestedMin : 0,
																				},
																				scaleLabel : {
																					display : true,

																				}
																			} ]
																		}
																	}
																});
													}
												});//ajax

						 					});
									});//ready
				</script>
			</div>
		</div>
		<div id="sidebar" class="inactive">
			<div class="inner">
				<nav id="menu">
					<header class="major">
						<h2>고객센터</h2>
					</header>
					<ul>
						<li><span class="opener">사용자 관리</span>
							<ul>
								<li><a href="/KitchenNote2/admin.do?pageNum=1&&filter=&&search=&&">-
										일반 사용자 관리</a></li>
								<li><a href="/KitchenNote2/adminChef.do?pageNum=1&&filter=&&search=&&">-
										쉐프 사용자 관리 </a></li>
								<li><a href="/KitchenNote2/adminChefUp.do?pageNum=1">- 쉐프 신청서 </a></li>
								<li><a href="/KitchenNote2/dropUser.do?pageNum=1&&filter=&&search=&&">-
										탈퇴자 관리 </a></li>
							</ul></li>
						<li><span class="opener">레시피 관리</span>
							<ul>
								<li><a href="/KitchenNote2/adminRecipe.do?pageNum=1&&filter=&&search=&&">-
										전체 레시피 목록</a></li>
								<li><a
									href="/KitchenNote2/adminPayRecipe.do?pageNum=1&&filter=&&search=&&">- 유료
										레시피 목록</a></li>
								<li><a
									href="/KitchenNote2/adminDropRecipe.do?pageNum=1&&filter=&&search=&&">-
										삭제 레시피 목록 </a></li>
							</ul></li>
						<li><span class="opener">결제 내역 관리</span>
							<ul>
								<li>
								<a href="/KitchenNote2/forkList.do?pageNum=1">- 포크 충전 내역</a>
								</li>
								<li>
								<a href="/KitchenNote2/purRecipe.do?pageNum=1">- 레시피 결제 내역</a>
								</li>
							</ul></li>
						<li><span class="opener">공지 사항</span>
							<ul>
								<li><a href="/KitchenNote2/notify.do?pageNum=1">- 공지 사항</a></li>
							</ul></li>
						<li><span class="opener">문의 사항</span>
							<ul>
								<li><a
									href="/KitchenNote2/admin/AdminFAQ.do?pageNum=0">-
										자주 묻는 질문 /FAQ</a></li>
								<li><a
									href="/KitchenNote2/admin/AdminList.do?pageNum=0">-
										1:1 문의</a></li>
							</ul></li>
						<li><a
							href="/KitchenNote2/adminStatics/adminStatics.do">홈페이지
								통계 </a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>