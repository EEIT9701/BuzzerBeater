<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>


<!--標頭(開始)-->
<nav
	class="navbar navbar-default navbar-fixed navbar-transparent white bootsnav">
	<div class="container">
		<div class="attr-nav">
			<ul>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 
					<i class="glyphicon glyphicon-pencil"></i></a>
					<!--新刪修"按鈕"(開始)-->
					<ul class="dropdown-menu cart-list">
						<li><h6>
								<a href="#">新增<!--這行的href輸入超連結頁面--></a>
							</h6></li>
						<li><h6>
								<a href="#">刪除<!--這行的href輸入超連結頁面--></a>
							</h6></li>
						<li><h6>
								<a href="#">修改<!--這行的href輸入超連結頁面--></a>
							</h6></li>
					</ul> <!--新刪修"按鈕"(結束)--></li>

				<!--登入登出"按鈕"(開始)-->
				<li><a href="#" class="cd-signin" onclick="document.getElementById('id01').style.display='block'"><c:choose>
							<c:when test="${empty LoginOK}">
<!-- 								<i class="glyphicon glyphicon-log-in"></i> -->	 
								<c:set var="var01" value="登入" />
							</c:when>
							<c:otherwise>
							    <img src="${pictureUri}"  width="25" height="25"> 
								<c:set var="var01" value="${LoginOK.name}" />
							</c:otherwise>
						</c:choose> ${var01}
				</a></li>
				<li><a href="GoogleLoginOutServlet" class="cd-signup"" > 
<!-- 				<i class="glyphicon glyphicon-user"></i>  -->
				         <c:choose>
							<c:when test="${empty LoginOK}">
								<c:set var="var02" value="" />
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
			<a class="navbar-brand" href="#brand"> <img
				src="<%=request.getContextPath()%>/images/700_700.png"
				class="logo logo-display" alt=""> <img
				src="<%=request.getContextPath()%>/images/700_700.png"
				class="logo logo-scrolled" alt="">
			</a>
			<!-- logo(結束) -->
		</div>
		<!-- 選單列表(開始) -->
		<div class="collapse navbar-collapse" id="navbar-menu">
			<ul class="nav navbar-nav navbar-right" data-in="fadeInDown">
				<li><a href="#">Home</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">賽季<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="#">賽季子頁1<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">賽季子頁2<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">賽季子頁3<!--這行的href輸入超連結頁面--></a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">分組<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="#">分組子頁1<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">分組子頁2<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">分組子頁3<!--這行的href輸入超連結頁面--></a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">賽程<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="#">賽程子頁1<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">賽程子頁2<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">賽程子頁3<!--這行的href輸入超連結頁面--></a></li>
					</ul></li>
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
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">影片<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="#">影片子頁1<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">影片子頁2<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">影片子頁3<!--這行的href輸入超連結頁面--></a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">照片<!--這行的href輸入超連結頁面--></a>
					<ul class="dropdown-menu">
						<li><a href="#">照片子頁1<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">照片子頁2<!--這行的href輸入超連結頁面--></a></li>
						<li><a href="#">照片子頁3<!--這行的href輸入超連結頁面--></a></li>
					</ul></li>
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





