<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<script>
$(function(){
	alert("포크를 구매해 주셔서 감사합니다.");
})
	function goHome(){
		location.replace("/KitchenNote2/home.do");
		
	}
</script>
</head>
<body>
<h3>결제 성공</h3>

주문 총액: ${item.amount.total}<br>
주문 이름: ${item.item_name}<br>
주문 수량: ${item.quantity}<br>
주문 시간: ${item.created_at}<br>

<button onclick="goHome()">확인</button>
</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>