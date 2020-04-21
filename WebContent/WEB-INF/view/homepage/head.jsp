<%@ page contentType="text/html; charset=UTF-8"%>
<header id="header">
					<a href="home.do" class="logo"><img src="images/KakaoTalk_20200420_110749263.png" width="300px" height=150px>
					KitchenNote</a>
					<section id=search class="alt 4u 12u$">
					<form method=post action=recipe.do>
					<input type=text name=search id=query placeholder="Search">
					</form>
					</section>
					<ul class="icons"> 
						<li class="out" onclick="logout()"><a href="login/loginForm.do" class="icon fa-sign-in"><span class=label>
							sign-in
						</span></a>
						<li class="in"><a href="#" class="icon fa-sign-out"><span class=label>
							sign-out
						</span></a>
						
						<li class="in"><a href=# class="icon fa-user"><span
								class="label">mypage</span></a></li>
								
						<li><a href=# class="icon fa-archive modal"><span
								class="label">nangbu</span></a></li>

						<li class="in"><a href="#" class="icon fa-edit"><span
								class="label">Facebook</span></a></li>
								
						<li class="admin"><a href="admin.do?pageNum=1&&filter=&&search=" class="icon fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
					</ul>
				
				</header> 