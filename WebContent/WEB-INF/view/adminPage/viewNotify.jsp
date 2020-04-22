<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#main *{
	font-family:'Cafe24Oneprettynight';
}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function deleteNotify(num){
		location.replace("deleteNotify.do?num="+num);
		}
	function updateNotify(num){
		location.replace("updateNotify.do?num="+num);
		}
	function goBack(){
		location.replace("notify.do?pageNum=1");
		}
</script>
</head>
<body>


	<div id=wrapper>

		<div id=main>
			<div class=inner>
				<%@ include file="../homepage/head.jsp"%>
				<hr>
				<h3>${dto.subject }</h3>
				<hr>
				<div class="box">${dto.content }</div>
				<h4>${dto.reg_date }</h4>
				<c:if test="${dto.num>0 }">
					<button onclick="updateNotify(${dto.num})">수정</button>
					<button onclick="deleteNotify(${dto.num})">삭제</button>
				</c:if>
				<button onclick="goBack()">목록으로</button>

			</div>
		</div>
	</div>
</body>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>