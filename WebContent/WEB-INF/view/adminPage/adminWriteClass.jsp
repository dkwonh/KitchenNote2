<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script type="text/javascript" src="/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	
</script>

<script type="text/javascript">
$(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "../editor/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
});
$("#save").click(function(){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#frm").submit();
})
</script>
<title>Insert title here</title>
</head>
<body>
<form id=frm action=/insert.jsp method=post>
<textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
<input id=save type=submit value=저장>
</form>
</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>