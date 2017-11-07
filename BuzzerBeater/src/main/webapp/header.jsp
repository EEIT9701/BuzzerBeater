<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="date" scope="page" class="java.util.Date"/>
<jsp:useBean id="seasonSvc" scope="page" class="eeit.season.model.SeasonService"/>
<jsp:useBean id="teamsSvc" scope="page" class="eeit.teams.model.TeamsService"/>
<jsp:useBean id="gamesSvc" scope="page" class="eeit.games.model.GamesService"/>

<title>Buzzer Beater</title>
<!--標頭(開始)-->
<nav class="navbar navbar-default navbar-fixed navbar-transparent white bootsnav" >
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
								<li><h6><a href="<%=request.getContextPath() %>/memberInfo/memberInfoBack.jsp">權限管理</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">賽季管理</a></h6></li>
<!-- 							<li><h6><a href="">分組</a></h6></li> -->
<!-- 							<li><h6><a href="">賽程</a></h6></li> -->
								<li><h6><a href="<%=request.getContextPath() %>/teams/listAllteam_back.jsp">球隊</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/players/listAllPlayer_back.jsp">球員</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/personaldata/PersonalDataback.jsp">數據</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/gamemedia/videoBackEnd.jsp">影片</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/gamemedia/photoBackEnd.jsp">照片</a></h6></li>					 
						</c:when>
						<c:when test="${LoginOK.auth == 'parttime'}">
<%-- 							<li><h6><a href="#">${LoginOK.auth}登入使用</a></h6></li> --%>
<%-- 							<li><h6><a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">賽季管理</a></h6></li> --%>
								<li><h6><a href="<%=request.getContextPath() %>/players/listAllPlayer_back.jsp">球員</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/personaldata/PersonalDataback.jsp">數據</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/gamemedia/videoBackEnd.jsp">影片</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/gamemedia/photoBackEnd.jsp">照片</a></h6></li>
						</c:when>
						<c:when test="${LoginOK.auth == 'teams'}">
								<li><h6><a href="#">${LoginOK.auth}登入使用</a></h6></li>
								<li><h6><a href="<%=request.getContextPath() %>/Teams.do?action=GET_MY_TEAM&teamID=${LoginOK.teamID}">我的球隊</a></h6></li>
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
				<li >			
					<c:if test="${empty LoginOK}">
						<a href="#" class="cd-signin" onclick="document.getElementById('id01').style.display='block'" >
							登入
						</a>
					</c:if>								
					<c:if test="${!empty LoginOK}">		
						<a style="padding-top: 20px;">			
							<img  src="${pictureUri}"  style="width:25px; height:25px;text-decoration:none;"> 
							<c:set var="var01" value="${LoginOK.name}" />
							${var01}
						</a>
					</c:if>		
				</li>
				<li><a href="<%=request.getContextPath()%>/LoginOutServlet.do" class="cd-signup" > 
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
			<a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp" style="padding-top: 1px"> 
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
				<li><a href="<%=request.getContextPath() %>/index.jsp">首頁</a></li>
				<li class="dropdown">
					<a href="<%=request.getContextPath() %>/season/seasonList.jsp" class="dropdown-toggle" data-toggle="dropdown">賽季</a>
					<ul class="dropdown-menu">
						<c:forEach var="seasonSet" items="${seasonSvc.season}" begin="0" end="3">
							<li><a href="<%=request.getContextPath() %>/groups/groupList.jsp?seasonID=${seasonSet.seasonID}">${seasonSet.seasonName}</a></li>
						</c:forEach>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">賽程</a>
					<ul class="dropdown-menu">
						<c:forEach var="games" items="${gamesSvc.all}" begin="1" end="5">
							<li><a style="font-size: 6px;" href="<%=request.getContextPath()%>/PersonalData.do?action=Get_singlefieldData&gameID=${games.gameID}">${games.teamAVO.teamName} vs ${games.teamBVO.teamName}</a></li>
						</c:forEach>
					</ul>
				</li>
				<li class="dropdown"><a href="<%=request.getContextPath() %>/teams/listAllteam_front.jsp" class="dropdown-toggle" data-toggle="dropdown">球隊</a>
					<ul class="dropdown-menu">
						<c:forEach var="teams" items="${teamsSvc.teams}">
							<li><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${teams.teamID}">${teams.teamName}</a></li>
						</c:forEach>
					</ul>
				</li>
				<li class="dropdown"><a href="<%=request.getContextPath() %>/players/listAllPlayer_front.jsp" class="dropdown-toggle" data-toggle="dropdown">球員</a>
<!-- 					<ul class="dropdown-menu"> -->
<!-- 					</ul> -->
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">數據</a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath() %>/personaldata/personalData.jsp">個人數據<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="<%=request.getContextPath() %>/personaldata/TeamDataindex.jsp">球隊數據<!--這行的href輸入超連結頁面--></a></li>
					</ul></li>
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





