<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="seasonSvc" scope="page" class="eeit.season.model.SeasonService" />
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/normalize.css" /> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/component.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/content.css" />
<script src="<%=request.getContextPath()%>/js/modernizr.custom.js"></script>
<!--標頭(開始)-->
<nav class="navbar navbar-default navbar-fixed navbar-transparent white bootsnav" style="font-size: larger">				
	<div class="container">
		<div class="attr-nav" style="padding-left:40px">
			<ul>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
					<i class="glyphicon glyphicon-pencil"></i></a>
					<!--  新刪修"按鈕"(開始)-->
					<ul class="dropdown-menu cart-list" id="functionButton">
					 <!-- 未登入使用 --> 	
					 <c:choose>
					   <c:when test="${empty LoginOK}">
						<li><h6>
							<a href="#">未登入使用</a>	
						</h6></li>
					   </c:when> 
					    <c:when test="${LoginOK.auth == 'admin'}">
<%-- 							<li><h6><a href="#">${LoginOK.auth}登入使用</a></h6></li> --%>
								<li><h6><a href="<%=request.getContextPath() %>/memberInfo/memberInfoI_U_D.jsp">權限管理</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">賽季管理</a></h6></li>
<!-- 							<li><h6><a href="">分組</a></h6></li> -->
<!-- 							<li><h6><a href="">賽程</a></h6></li> -->
								<li><h6><a href="<%=request.getContextPath() %>/teams/listAllteam_back.jsp">球隊</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/players/listAllPlayer_back.jsp"">球員</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/personaldata/PersonalDataback.jsp">數據</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/gamemedia/videoBackEnd.jsp">影片</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/gamemedia/photoBackEnd.jsp">照片</a></h6></li>					 
						</c:when>
						<c:when test="${LoginOK.auth == 'parttime'}">
<%-- 							<li><h6><a href="#">${LoginOK.auth}登入使用</a></h6></li> --%>
<%-- 							<li><h6><a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">賽季管理</a></h6></li> --%>
								<li><h6><a href="<%=request.getContextPath() %>/personaldata/PersonalDataback.jsp">數據</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/gamemedia/videoBackEnd.jsp">影片</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/gamemedia/photoBackEnd.jsp">照片</a></h6></li>
						</c:when>
						<c:when test="${LoginOK.auth == 'teams'}">
								<li><h6><a href="#">${LoginOK.auth}登入使用</a></h6></li>
								<li><h6><a href="#">我的球隊</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/Groups.do?action=GET_GROUP_SINGUP">分組報名</a></h6></li>
								<li><h6><a href="#">繳費</a></h6></li>
						</c:when>
						<c:otherwise>
						   <li><h6>
								<a href="#">${LoginOK.auth}登入使用</a>
						   </h6></li>
						</c:otherwise>
						</c:choose>	
					</ul> 
				</li>
<!-- 				新刪修"按鈕"(結束) -->
				<!--登入登出"按鈕"(開始)-->
				<li>
					<div class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
					<c:if test="${empty LoginOK}">
<%-- 						<a href="<%=request.getContextPath() %>/images/cas_test.png"></a> --%>
<!-- 						<button type="button" >登入</button> -->
						<button type="button" class="glyphicon glyphicon-cog"></button>
					</c:if>								
						<div class="morph-content">
							<div>
								<div class="content-style-form content-style-form-1">
									<span class="icon icon-close">Close the dialog</span>
									<H3>Login</H3>
									<jsp:include page="/header_login.jsp" />
								</div>
							</div>
						</div>
					</div>

				</li>
				<li><a href="LoginOutServlet.do" class="cd-signup"" > 
				         <c:choose>
							<c:when test="${empty LoginOK}">

							</c:when>
							<c:otherwise>
								<c:set var="var02" value="登出" />
							</c:otherwise>
						</c:choose> ${var02}
				 </a></li>

				<!--登入登出"按鈕"(結束)-->
			</ul>
		</div>

		<jsp:include page="/header_login.jsp" />

		<div class="navbar-header">
			<!-- 縮小視窗(左列)(開始) -->
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-menu">
				<i class="fa fa-bars"></i>
			</button>
			<!-- 縮小視窗(左列)(結束) -->
			<!-- logo(開始) -->
			<a class="navbar-brand" href="#brand" style="padding-top: 1px"> 
			<img src="<%=request.getContextPath()%>/images/700_700.png"
				class="logo logo-display" alt="" > 
			<img src="<%=request.getContextPath()%>/images/700_700.png"
				class="logo logo-scrolled" alt="" >
			</a>
			<!-- logo(結束) -->
		</div>
		<!-- 選單列表(開始) -->
		<div class="collapse navbar-collapse" id="navbar-menu">
			<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" style="margin-right: 15px">
				<li><a href="<%=request.getContextPath() %>/index.jsp">Home</a></li>
				<li class="dropdown"><a href="<%=request.getContextPath() %>/season/seasonList.jsp" class="dropdown-toggle"
					data-toggle="dropdown">賽季<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<c:forEach var="seasonSet" items="${seasonSvc.all}" begin="0" end="3">
							<li><a href="<%=request.getContextPath() %>/Season.do?action=GET_GROUPS&seasonID=${seasonSet.seasonID}">${seasonSet.seasonName}</a></li>
						</c:forEach>
					</ul>
				</li>
				<li class="dropdown"><a href="<%=request.getContextPath() %>/groups/groupFront.jsp" class="dropdown-toggle"
					data-toggle="dropdown">分組<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="#">分組子頁1<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">分組子頁2<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">分組子頁3<!--這行的href輸入超連結頁面--></a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">賽程<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="#">賽程子頁1<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">賽程子頁2<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">賽程子頁3<!--這行的href輸入超連結頁面--></a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="<%=request.getContextPath() %>/teams/listAllteam_front.jsp" class="dropdown-toggle"
					data-toggle="dropdown">球隊<!--這行的href輸入超連結頁面--></a>
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li><a href="#">球隊子頁1這行的href輸入超連結頁面</a></li> -->
<!-- 						<li><a href="#">球隊子頁2這行的href輸入超連結頁面</a></li> -->
<!-- 						<li><a href="#">球隊子頁3這行的href輸入超連結頁面</a></li> -->
<!-- 					</ul> -->
					</li>
				<li class="dropdown"><a href="<%=request.getContextPath() %>/players/listAllPlayer_front.jsp" class="dropdown-toggle"
					data-toggle="dropdown">球員<!--這行的href輸入超連結頁面--></a>
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li><a href="#">球員子頁1這行的href輸入超連結頁面</a></li> -->
<!-- 						<li><a href="#">球員子頁2這行的href輸入超連結頁面</a></li> -->
<!-- 						<li><a href="#">球員子頁3這行的href輸入超連結頁面</a></li> -->
<!-- 					</ul> -->
					</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">數據<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath() %>/personaldata/PersonalDataindex.jsp">個人數據<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="<%=request.getContextPath() %>/personaldata/TeamDataindex.jsp">球隊數據<!--這行的href輸入超連結頁面--></a></li>
					</ul></li>
<!-- 					影音本身沒有超聯結 -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"    
					data-toggle="dropdown">影音<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath() %>/gamemedia/photo.jsp">照片<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="<%=request.getContextPath() %>/gamemedia/video.jsp">影片<!--這行的href輸入超連結頁面--></a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- 選單列表(結束) -->
	</div>
</nav>
<!--標頭(結束)-->


<!--至頂空白(開始)-->
<div class="pageheader fixed-demo dark">
	<div class="container"></div>
</div>
<!--至頂空白(結束)-->
<div class="clearfix"></div>
<script src="<%=request.getContextPath() %>/js/classie.js"></script>
		<script src="<%=request.getContextPath() %>/js/uiMorphingButton_fixed.js"></script>
		<script>
			(function() {
				var docElem = window.document.documentElement, didScroll, scrollPosition;

				// trick to prevent scrolling when opening/closing button
				function noScrollFn() {
					window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
				}

				function noScroll() {
					window.removeEventListener( 'scroll', scrollHandler );
					window.addEventListener( 'scroll', noScrollFn );
				}

				function scrollFn() {
					window.addEventListener( 'scroll', scrollHandler );
				}

				function canScroll() {
					window.removeEventListener( 'scroll', noScrollFn );
					scrollFn();
				}

				function scrollHandler() {
					if( !didScroll ) {
						didScroll = true;
						setTimeout( function() { scrollPage(); }, 60 );
					}
				};

				function scrollPage() {
					scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
					didScroll = false;
				};

				scrollFn();

				[].slice.call( document.querySelectorAll( '.morph-button' ) ).forEach( function( bttn ) {
					new UIMorphingButton( bttn, {
						closeEl : '.icon-close',
						onBeforeOpen : function() {
							// don't allow to scroll
							noScroll();
						},
						onAfterOpen : function() {
							// can scroll again
							canScroll();
						},
						onBeforeClose : function() {
							// don't allow to scroll
							noScroll();
						},
						onAfterClose : function() {
							// can scroll again
							canScroll();
						}
					} );
				} );

				// for demo purposes only
				[].slice.call( document.querySelectorAll( 'form button' ) ).forEach( function( bttn ) { 
					bttn.addEventListener( 'click', function( ev ) { ev.preventDefault(); } );
				} );
			})();
		</script>




