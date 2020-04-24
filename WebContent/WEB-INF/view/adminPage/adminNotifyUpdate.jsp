<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script type="text/javascript" src="./editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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
<script>
$("#save").click(function() {
	var subject = $("#subject").val();
	
	if (subject == "") {
		alert("제목을 입력하세요.");
		document.form1.subject.focus();
		return;
	}
	
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
    var ir1 = $("#content").val();

    if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
         alert("내용을 입력하세요.");
         oEditors.getById["ir1"].exec("FOCUS"); //포커싱
         return;
    }

	
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#frm").submit();
});

$("#cancel").click(function(){
history.go(-1);
});
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

	$("#save").click(function() {
		var subject = $("#subject").val();
		
		if (subject == "") {
			alert("제목을 입력하세요.");
			document.form1.subject.focus();
			return;
		}
		
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
        var ir1 = $("#content").val();

        if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
             alert("내용을 입력하세요.");
             oEditors.getById["ir1"].exec("FOCUS"); //포커싱
             return;
        }

		
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#frm").submit();
});

$("#cancel").click(function(){
	history.go(-1);
	});
});

</script>
<title>Insert title here</title>
</head>
<body>
<form id=frm action="updateNotify.do" method=post>
<input type="hidden" name=num value="${dto.num }">
제목:<input type="text" name="subject" value="${dto.subject }" id="subject" required>
내용:<textarea name="content" id="content" rows="10" cols="100" required>${dto.content}</textarea>
<input type="hidden" name="num" value="${dto.num }">
<input id=save type=button value=저장>
<input id=cancel type=button value=취소>
</form>
</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</html>