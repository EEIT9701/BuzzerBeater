<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 



<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	<jsp:include page="/header_css.jsp" />
    	<jsp:include page="/font_css.jsp" />
    	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
        <title>Season</title>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
		<div class="container">
		<div class="jumbotron">
			<div class="col-md-12">
				<h3>賽季起迄</h3>
				<table class="table table-bordered" id="season_cycle">
					<thead>
						<tr>
							<td>賽季名稱</td>
			                <td>賽季開始日期</td>
			                <td>賽季結束日期</td>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td>${seasonVO.seasonName}</td>
							<td>${seasonVO.seasonBeginDate}</td>
							<td>${seasonVO.seasonEndDate}</td>
						</tr>
					</tbody>
				</table>
				<p>${seasonVO.descriptions}</p>
				
				<c:forEach var="groupsSet" items="${seasonVO.groupsSet}">
					<h3>${groupsSet.groupName}</h3>
					<table class="table table-bordered test" id="season_group">
						<thead>
							<tr>
							  <td>比賽時間</td>
			              	  <td>比賽地點</td>
			              	  <td>主隊</td>
			              	  <td>比分</td>
			              	  <td>客隊</td>
			                </tr>
						</thead>
						<tbody>
							<c:forEach var="gamesSet" items="${groupsSet.gamesSet}">
								<tr>
									<td><fmt:formatDate value="${gamesSet.gameBeginDate}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td><a href="<%=request.getContextPath() %>/Locationinfo.do?action=GET_ONE_LOCATION&locationID=${gamesSet.locationinfoVO.locationID}">${gamesSet.locationinfoVO.locationName}</a></td>
									<td><a href="<%=request.getContextPath() %>/Teams.do?action=GET_ONE_TEAM&teamID=${gamesSet.teamAVO.teamID}">${gamesSet.teamAVO.teamName}</a></td>
									<td><a href="<%=request.getContextPath() %>/Groups.do?action=GET_GAME&gameID=${gamesSet.gameID}">${gamesSet.teamAScore} - ${gamesSet.teamBScore}</a></td>
									<td><a href="<%=request.getContextPath() %>/Teams.do?action=GET_ONE_TEAM&teamID=${gamesSet.teamBVO.teamID}">${gamesSet.teamBVO.teamName}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:forEach>
		        
			    
			    
		    </div>
		    <jsp:include page="/footer.jsp" />
		    </div>
	    	<!-- 網頁內容END -->
	    </div>
	    <!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
	    <script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	    <script>
// 	    $(document).ready(function() {
// 	    	$('#season_cycle').DataTable();
// 	    	});
	    $(document).ready(function() {
	    	$('.test').DataTable();
	    	});
	    </script>
    </body>

    </html>