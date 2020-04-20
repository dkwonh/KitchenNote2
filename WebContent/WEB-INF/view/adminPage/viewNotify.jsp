<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function updateNotify(num){
		location.replace("updateNotify.do?num="+num);
		}
	function close(){
		location.replace("notify.do?pageNum=1");
		}
</script>
</head>
<body>
<div class="box">
${dto.member_id }
</div>
<div class=box>
${dto.subject }
</div>
<div class="box">
${dto.content }
</div>
<div class="box">
${dto.reg_date }
</div>
<c:if test="${dto.num>0 }">
<button onclick="updateNotify(${dto.num})">수정</button>
</c:if>
<button onclick="close()">목록으로</button>
</body>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>