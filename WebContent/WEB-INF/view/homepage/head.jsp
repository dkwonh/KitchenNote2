

<header id="header">
					<a href="/KitchenNote2/home.do" class="logo"><img src="/KitchenNote2/images/KakaoTalk_20200422_111639302.png" width="300px" height=100px></a>
					<section id=search class="alt 4u 12u$">
					<form method=post action=recipe.do>
					<input type=text name=search id=query placeholder="Search">
					</form>
					</section>
					<ul class="icons"> 
		
						<li class="out" ><a href="login/loginForm.do" class="icon fa-sign-in"><span class=label>
							sign-in
						</span></a>
						<li class="in"><a href="login/logoutOk.do" class="icon fa-sign-out"><span class=label>
							sign-out
						</span></a>
						
						<li class="in"><a href=mypage/mypagefirst.do class="icon fa-user"><span
								class="label">mypage</span></a></li>
								
						<li><a class="icon fa-archive modal"><span
								class="label">nangbu</span></a></li>

						<li class="in"><a href="recipe/write.do" class="icon fa-edit"><span
								class="label">Facebook</span></a></li>
								
						<li class="admin"><a href="admin.do?pageNum=1&&filter=&&search=" class="icon fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
					</ul>
				
				</header>
				
				<script>
				<%
					String member_id = (String)session.getAttribute("MINFO");
					Integer level = (Integer)session.getAttribute("LEVEL");
					String nick = (String)session.getAttribute("NICK");
				%>
				$(function(){
					if(${MINFO== null}){
						$("li.out").css("display","inline-block");
						$("li.in").css("display","none");
					}
					else{
						$("li.in").css("display","inline-block");
						$("li.out").css("display","none");
					}

					if(${LEVEL != 0} ){
						$("li.admin").css("display","none");
					}
					else{
						$("li.admin").css("display","inline-block");
					}
				});
			</script>
				 