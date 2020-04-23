function closeCategory() {
	$("div#category").css('display', "none");
}

function searchCategory(category) {
	location.href = "/KitchenNote2/searchCategory.do?category1=" + category;
}

function resultCategory() {
	location.href = "/KitchenNote2/searchCategory.do?" + $('form.form').serialize();
}

function loadCategory(ing_category) {
	var url = "/KitchenNote2/category.do"
	var params = "ing_category=" + ing_category
	$.ajax({
		type : "get",
		url : url,
		data : params,
		dataType : "json"
	}).done(
			function(args) { // 응답이 성공 상태 코드를 반환하면 호출되는 함수
				$(".small_list").each(function() {
					$(".small_list input").remove();
					$(".small_list").text("");
				});
				for (var i = 0; i < args.length; i++) {
					$(".small_list").append(
							"<li data-ing=" + args[i].ing_id
									+ " onclick=ingredients(" + args[i].ing_id
									+ ",'" + args[i].ing_name + "')>"
									+ args[i].ing_name + "</li>");
				}
			}).fail(function(e) {
		alert(e.responseText);
	})
}

function infoAjax(item) {
	var url = "/KitchenNote2/confirmRecipe.do"
	var params = "recipe_id=" + item;
	$.ajax({
		type : "get",
		url : url,
		data : params,
		dataType : "json"
	}).done(function(args) {
		// 응답이 성공 상태 코드를 반환하면 호출되는 함수
		if (args == null) {
			alert("사용가능한 포크가 없으므로 구매페이지로 이동합니다.");
			location.href = "/KitchenNote2/buyRecipe.do?recipe_id=" + item;
		} else {
			alert("기존 구매내역이 있습니다.");
			location.href = "/KitchenNote2/recipe/read.do?recipe_id=" + item;
		}
	}).fail(function(e) {
		alert(e.responseText);
		return;
	})
}

function nangbu() {
	location.href = "/KitchenNote2/nangbu.do";
}

$(function() {

	$("button#category").on('click', function() {
		var s = $("div#category").css('display')
		if ($("div#category").css('display') == 'none') {
			$("div#category").css('display', 'block');
		} else {
			$("div#category").css('display', 'none');
		}
	});

	$("button#recipe").on('click', function() {
		location.href = "/KitchenNote2/recipe.do"
	});

	$("button#notify").on('click', function() {
		location.href = "/KitchenNote2/notifyList.do?pageNum=1"
	});

	$("button#support").on('click', function() {
		location.href = "/KitchenNote2/customer/FAQ.do?pageNum=0"
	});

	$("body").append("<div id='glayLayer'></div><div id='overLayer'></div>");

	$("#glayLayer").click(function() {
		$(this).hide()
		$("#overLayer").hide();
	});

	$("a.modal").click(function() {
		$("#glayLayer").show();
		$("#overLayer").show().html($("div#nangbu").html());
		return false;
	});

	if ($.browser.msie && $.browser.version < 7) {
		$(window).scroll(
				function() {
					$("#glayLayer").css('top', $(document).scrollTop());
					$("#overLayer").css(
							'top',
							($(document).scrollTop() + $(window).height() / 2)
									+ "px");
				});
	}

});

function itemClick(item, price, member_id) {
	if (price > 0) {
		if (!member_id) {
			if (confirm("로그인이 필요한 서비스 입니다. 로그인 하시겠습니까?")) {
				location.href = "/KitchenNote2/login/loginForm.do";
			} else {
			}
		} else {
			if (confirm(price + "포크로 구매하시겠습니까?")) {
				infoAjax(item);
			} else {

			}
		}
	} else {
		location.href = "/KitchenNote2/recipe/read.do?recipe_id=" + item;
	}

}

function ingredients(id, name) {
	var str = String(id);
	if ($(".selected li[data-ing=" + str + "]").length == 0) {
		$(".selected").append(
				"<li data-ing=" + id + " id=" + id
						+ " onclick='diselectIngredients(" + id
						+ ")'><input type='hidden' name='ingredients[]' value="
						+ id + ">" + name + "</li>");
	} else {
		$(".selected li[data-ing=" + str + "]").remove();
	}
}

function diselectIngredients(id) {
	var str = String(id);
	$(".selected li[data-ing=" + str + "]").remove();
}