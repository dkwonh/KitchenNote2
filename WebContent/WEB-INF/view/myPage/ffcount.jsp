<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Remember to include jQuery :) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<style>
 ul.tabs {
            margin: 0;
            padding: 0;
            float: left;
            list-style: none;
            height: 32px; /*--Set height of tabs--*/
            border-bottom: 1px solid #999;
            border-left: 1px solid #999;
            width: 100%;
        }
        ul.tabs li {
            float: left;
            margin: 0;
            padding: 0;
            height: 31px; /*--Subtract 1px from the height of the unordered list--*/
            line-height: 31px; /*--Vertically aligns the text within the tab--*/
            border: 1px solid #999;
            border-left: none;
            margin-bottom: -1px; /*--Pull the list item down 1px--*/
            overflow: hidden;
            position: relative;
            background: #e0e0e0;
        }
        ul.tabs li a {
            text-decoration: none;
            color: #000;
            display: block;
            font-size: 1.2em;
            padding: 0 20px;
            /*--Gives the bevel look with a 1px white border inside the list item--*/
            border: 1px solid #fff; 
            outline: none;
        }
        ul.tabs li a:hover {
            background: #ccc;
        }
        html ul.tabs li.active, html ul.tabs li.active a:hover  {
             /*--Makes sure that the active tab does not listen to the hover properties--*/
            background: #fff;
            /*--Makes the active tab look like it's connected with its content--*/
            border-bottom: 1px solid #fff; 
        }

        /*Tab Conent CSS*/
        .tab_container {
            border: 1px solid #999;
            border-top: none;
            overflow: hidden;
            clear: both;
            float: left; 
            width: 100%;
            background: #fff;
        }
        .tab_content {
            padding: 20px;
            font-size: 1.2em;
        }
    </style>
<script>
$(document).ready(function() {

    
    $(".tab_content").hide();
    $("ul.tabs li:first").addClass("active").show();
    $(".tab_content:first").show();

    //On Click Event
    $("ul.tabs li").click(function() {

        $("ul.tabs li").removeClass("active");
        $(this).addClass("active");
        $(".tab_content").hide();

        var activeTab = $(this).find("a").attr("href");
        $(activeTab).fadeIn();
        return false;
    });

});
</script>
<body>
	<!-- Modal HTML embedded directly into document -->
	<div id="modal_open" class="modal">
		<div id="classify">
			<ul class="tabs">
				<li><a href="#tab1">팔로워</a></li>
				<li><a href="#tab2">팔로우</a></li>
			</ul>
			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<table border="1">
						<c:forEach items="${followerlist}" var="follower">
							<tr>
								<td>${follower.nickname}</td>
							</tr>
							<tr>
								<td>${follower.member_id}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="tab2" class="tab_content">
				<table border="1">
					<c:forEach items="${followinglist}" var="following">
						<tr>
							<td>${following.nickname}</td>
						</tr>
						<tr>
							<td>${following.member_id}</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
		<!-- <a href="#" rel="modal:close">Close</a> -->
	</div>

	<!-- Link to open the modal -->
	<p>
		<!-- <a href="#modal_open" rel="modal:open"> -->
		<a href="#modal_open" rel="modal:open"> <!-- </a> -->
			팔로워${followersize} 팔로우${followingsize}
		</a>
	</p>
</body>
</html>