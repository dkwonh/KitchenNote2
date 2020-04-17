<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script type="text/javascript" src="./editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<script>
	
</script>

<script type="text/javascript">
$(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",
	 sSkinURI: "./editor/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});

	$("#save").click(function(){
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#frm").submit();
	})
});

</script>
<title>Insert title here</title>
</head>
<body>
<form id=frm action="writeClass.do" method=post>
<input type="hidden" name="c_num" value="${dto.c_num }">
제목:<input type="text" name="c_name" value="${dto.c_name }">
내용:<textarea name="content" id="content" rows="10" cols="100">${dto.content}</textarea>
<input id=save type=button value=저장>
</form>
</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>