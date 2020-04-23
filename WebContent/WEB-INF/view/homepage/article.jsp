<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${item.price != 0}">
<article onclick="itemClick(${item.recipe_Id},${item.price },${MINFO })" style=" filter:opacity(25%);">
<a class="image"> 
	<c:set var="image" value="${item.image }" />
				<div>
					<c:if test="${fn:contains(image,'okdab') }">
						<c:set var="mainImg" value="${item.image }" />
						
						<img id="main_img" src="${item.image }" width=500 height=300>
						
					</c:if>
					
					
					<c:if test="${fn:contains(image,'note')}">
						<c:set var="mainImg"
							value="${pageContext.request.scheme}://192.168.0.108:${pageContext.request.serverPort}/img/${item.image }" />
						<img id="main_img" src="/img/${item.image }" width=500 height=300>
					</c:if>
					<div style="position:absolute;top:25%;left:25%; font-size:100px;color:black ">유료</div>
				</div>
	</a>
	<h3>${item.recipe_Name }</h3>
	<p>${item.recipe_Exp}</p>
	<span><a class="icon fa-clock-o"></a>${item.duration}</span> <span><a
		class="icon fa-eye"></a>${item.readcount}</span> <span><a
		class="icon fa-pencil"></a>${item.nickname}</span>
</article>


</c:if>
<c:if test="${item.price == 0 }">
<article onclick="itemClick(${item.recipe_Id},${item.price },'${MINFO }')">


	<a class="image"> 
	<c:set var="image" value="${item.image }" />
				
					<c:if test="${fn:contains(image,'okdab') }">
						<c:set var="mainImg" value="${item.image }" />
						<img id="main_img" src="${item.image }" width=500 height=300>
					</c:if>
					
					
					<c:if test="${fn:contains(image,'note')}">
						<c:set var="mainImg"
							value="${pageContext.request.scheme}://192.168.0.108:${pageContext.request.serverPort}/img/${item.image }" />
						<img id="main_img" src="/img/${item.image }" width=500 height=300>
					</c:if>
					
	</a>
	<h3>${item.recipe_Name }</h3>
	<p>${item.recipe_Exp}</p>
	<span><a class="icon fa-clock-o"></a>${item.duration}</span> <span><a
		class="icon fa-eye"></a>${item.readcount}</span> <span><a
		class="icon fa-pencil"></a>${item.nickname}</span>
</article>
</c:if>