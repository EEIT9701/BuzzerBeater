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
    	<style>
    	h3{
    	text-align:center;   	
    	}
    	thead{
    	font-size:larger;
    	font-weight:bold;
    	text-align:center;
    	}
    	tbody{
    	text-align:center;
    	}
    	</style>
    	
        <title>Season</title>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
		<div class="jumbotron">
			<div class="col-md-12">
				<table class="table table-bordered">
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
					<table class="table table-bordered">
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
	    	<!-- 網頁內容END -->
	    	<jsp:include page="/footer.jsp" />
	    </div>
	    </div>
	    <!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>