<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<div id="nangbu" style="display: none">

	
	<form method="post" action="nangbu.do" class="row gtr-uniform" style="background:white">
	<h4>냉장고를 부탁해! 재료로 레시피를 검색해보세요</h4>
		<fieldset class="field1">
			<ul id="big_sort" class="big_list">
				<c:forEach var="item" items="${nangbuCategory }">
					<li id="${item.key}" onclick="loadCategory(${item.key})">${item.value.category_name}</li>
				</c:forEach>
			</ul>
			
			<ul id="small_sort" class="small_list">
				<c:forEach var="item" items="${nangbuList }">
					<li data-ing="${item.ing_id }"
						onclick="ingredients(${item.ing_id},'${item.ing_name }')">${item.ing_name }
					</li>
				</c:forEach>
			</ul>
			
			<div id="selected" class="selected">재료를 선택하세요</div>
			<input type="submit" value="재료로검색">
		</fieldset>
		
	</form>
</div>