<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>Insert title here</title>
<script>
	function goBack(){
		history.go(-1);
		}
</script>
</head>
<body>
<form action=kakaoPay.do method=post>
<input id="fork5" type="radio" name="fork" value="5"><label for="fork5">포크5 : 1000원</label><br>
<input id="fork10" type="radio" name="fork" value="10"><label for="fork10">포크10 : 2000원</label><br>
<input id="fork50" type="radio" name="fork" value="50"><label for="fork50">포크50 : 10000원</label><br>
<input id="fork100" type="radio" name="fork" value="100"><label for="fork100">포크100 : 20000원</label><br>	
<input type="submit" value="결제하기">
<input type="button" value="취소하기" onclick="goBack()">
</form>

</body>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>