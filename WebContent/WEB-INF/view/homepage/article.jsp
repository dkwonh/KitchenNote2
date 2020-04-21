<%@ page contentType="text/html; charset=UTF-8"%>
<article onclick="itemClick(${item.recipe_Id})">
	<a class="image"> <img src="${item.image}" width=500 height=300>
	</a>
	<h3>${item.recipe_Name }</h3>
	<p>${item.recipe_Exp}</p>
	<span><a class="icon fa-clock-o"></a>${item.duration}</span> <span><a
		class="icon fa-eye"></a>${item.readcount}</span> <span><a
		class="icon fa-pencil"></a>${item.nickname}</span>
</article>