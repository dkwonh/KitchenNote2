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
	function close(){
		alert("!");
		history.go(-1);
		}
</script>
</head>
<body>
<div id=wrapper>
<div id=main>
<div class=inner>
<h3>
${dto.subject }
</h3>

<div class="box">
${dto.content }
</div>
<div>
<b>${dto.reg_date }</b>
</div>

<button onclick="close()">목록으로</button>
</div>
</div>
</div>
</body>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>