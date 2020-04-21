<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="viewport" content="width=device-width, initial-scale = 1">
<meta name="viewport" content="width=device-width, initial-scale = 1">
<meta http-equiv="Content-Type" content="text/html; charset = utf-8"
	pageEncoding="utf-8">
<link rel="stylesheet" href="../assets/css/main.css" />
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<script src='//unpkg.com/vue-chartjs@2.6.0/dist/vue-chartjs.full.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.js'></script>
<script src='//unpkg.com/hchs-vue-charts@1.2.8'></script>
<chartjs-line :labels="labels" :data="dataset" :bind="true"></chartjs-line>
<title>홈페이지 통계</title>
<!-- <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
-->
<!-- <script language="javascript" type="text/javascript">
	$(document)
			.ready(
					function() {
						var clareCalendar = {
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							weekHeader : 'Wk',
							dateFormat : 'yymmdd', //형식(20120303)
							autoSize : false, //오토리사이즈(body등 상위태그의 설정에 따른다)
							changeMonth : true, //월변경가능
							changeYear : true, //년변경가능
							showMonthAfterYear : true, //년 뒤에 월 표시
							buttonImageOnly : true, //이미지표시
							buttonText : '달력선택', //버튼 텍스트 표시
							buttonImage : 'cale_bg.jpg', //이미지주소
							showOn : "both", //엘리먼트와 이미지 동시 사용(both,button)
							yearRange : '1990:2020' //1990년부터 2020년까지
						};
						$("#fromDt").datepicker(clareCalendar);
						$("#toDt").datepicker(clareCalendar);
						$("img.ui-datepicker-trigger")
								.attr("style",
										"margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
						$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김 
					});
</script>   -->
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
</style>

<body>
	<div id="wrapper">
		<div id="main">
		<div class="inner">
			<header id="header">
				<a href="#" class="KitchenNote"><strong>Kitchen</strong>Note</a>
				<section id="search" class="alt 4u 12u$">
					<form method="post">
						<input name="search" id="query" type="text">
					</form>
				</section>
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span
							class="label">Instagram</span></a></li>
				</ul>
			</header>
			<div class="navi c">
				<input type="button" value="카테고리"> <input type="button"
					value="레시피"> <input type="button" value="이벤트"> <input
					type="button" value="고객센터"><br>
			</div>
			<div>
				<article>
					<br>
					<p>
					<h2>홈페이지 통계</h2>
					<form method="GET">
						<hr>
						<select id="statics" name="statics">
							<option value="recipe">월별 레시피 등록건수</option>
							<option value="user">월별 회원 가입자수</option>
							<option value="sale">월별 레시피 판매건수</option>
						</select>
						</form>
				</article>
			</div>
			<%--  <section>
				<table border="0">
					<tr>
						<td><input name="fromDt" type="text" id="fromDt" size="8"
							maxlength="8" value=""></td>
						<td>~</td>
						<td><input name="toDt" type="" id="toDt" size="8"
							maxlength="8" value=""></td>
					</tr>
				</table>
			</section> 
			<div id="app">
				<section class="container">
					<div class="columns">
						<div class="column">
							<chartjs-line :labels="labels" :data="dataset" :bind="true"></chartjs-line>
						</div>
					</div>
				</section>
			</div> --%>
			<script src='//cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js'></script>
			<script
				src='//unpkg.com/vue-chartjs@2.6.0/dist/vue-chartjs.full.min.js'></script>
			<script
				src='//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.js'></script>
			<script src='//unpkg.com/hchs-vue-charts@1.2.8'></script>
			<div style="width: 50%;">
				<canvas id="canvas"></canvas>
			</div>

			<script>
			$(document).ready(function(){
			 var statics = $("#statics").val();
			   
			      $.ajax({
				      type : "POST",
			    	  url : "recipeAction.do",
						data : statics,
						dataType : "json",
						error : function(error) {
							alert("에러"+error.status);
						},
			       success: function(data) {
			           var recipe = [];

			           for(var i =0 ; i < 12; i++) {
				           for(var j in data){
				           if(data[j].monthRecipe != (i+1)){
					           recipe[i] = 0;
			               }else{
			            	   recipe[i] = data[j].recipeCount;
				           }
				           }
			               /* user.push(data[i].user);
			               sale.push(data[i].sale); */
			           }

				 new Chart(
						document.getElementById("canvas"),
						{
							type : 'line',
							data : {
								labels : [ '1월', '2월', '3월',
										'4월', '5월', '6월', '7월',
										'8월', '9월', '10월',
										'11월', '12월' ],
								datasets : [
										{
											label : '레시피 판매량',
											data :recipe,
											borderColor : "rgba(255, 201, 14, 1)",
											backgroundColor : "rgba(255, 201, 14, 0.5)",
											fill : false,
											lineTension : 0
										},
										{
											label : '가입 회원 수',
											data : [
												data, data, data, data, data, data,
												 data, data, data, data, data, data
												 ],
											borderColor : "rgba(54, 162, 235, 1)",
											backgroundColor : "rgba(54, 162, 235, 0.5)",
											fill : false,
											lineTension : 0
										},
										{
											label : '레시피 등록건수',
											data : [
												data, data, data, data, data, data,
												 data, data, data, data, data, data
												 ],
											borderColor : "rgba(75, 192, 192, 1)",
											backgroundColor : "rgba(75, 192, 192, 0.5)",
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
			      });
			});
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
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										일반 사용자 관리</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										쉐프 사용자 관리 </a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										쉐프 등업 신청확인 </a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										탈퇴자 관리 </a></li>
							</ul></li>
						<li><span class="opener">레시피 관리</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										레시피 목록</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										유료 레시피 목록</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										삭제 레시피 목록 </a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										레시피 통계 </a></li>
							</ul></li>
						<li><span class="opener">결제 내역 관리</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										레시피 결제 내역</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										쿠킹 클래스 결제 내역</a></li>
							</ul></li>
						<li><span class="opener">이벤트 관리</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										쿠킹 클래스</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										강사 모집</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										종료된 이벤트 </a></li>
							</ul></li>
						<li><span class="opener">문의 사항</span>
							<ul>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/list.do">-
										자주 묻는 질문 /FAQ</a></li>
								<li><a
									href="http://localhost:8082/KitchenNote/customer/write.do">-
										1:1 문의</a></li>
							</ul></li>
						<li><a
							href="http://localhost:8082/KitchenNote/customer/write.do">홈페이지
								통계 </a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<footer id="footer">
		<p class="copyright">
			&copy; Untitled. All rights reserved. Demo Images: <a
				href="https://unsplash.com">Unsplash</a>. Design: <a
				href="https://html5up.net">HTML5 UP</a>.
		</p>
	</footer>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>