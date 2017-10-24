<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	<jsp:include page="/header_css.jsp" />
    	
        <title>Season</title>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
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
						<tr>
							<td colspan="3">${seasonVO.descriptions}</td>
						</tr>
					</tbody>
				</table>
				
				<c:forEach var="groupsSet" items="${seasonVO.groupsSet}">
					<h3>${groupsSet.groupName}</h3>
					<table class="table table-bordered">
						<thead>

						</thead>
						<tbody>
							<c:forEach var="gamesSet" items="${groupsSet.gamesSet}">
								<tr>
									<td>${gamesSet.gameBeginDate}</td>
									<td><a href="<%=request.getContextPath()%>/teams/teamInformation.jsp?teamID=${gamesSet.teamAVO.teamID}">${gamesSet.teamAVO.teamName}</a></td>
									<td><a href="<%=request.getContextPath()%>/games/gameInfo.jsp?gameID=${gamesSet.gameID}">${gamesSet.teamAScore} - ${gamesSet.teamBScore}</a></td>
									<td><a href="<%=request.getContextPath()%>/teams/teamInformation.jsp?teamID=${gamesSet.teamBVO.teamID}">${gamesSet.teamBVO.teamName}</a></td>
									<td><a href="<%=request.getContextPath()%>/location/locationinfo.jsp?locationID=${gamesSet.locationinfoVO.locationID}">${gamesSet.locationinfoVO.locationName}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:forEach>
		        
			    
			    
		    </div>
	    	<!-- 網頁內容END -->
	    	<jsp:include page="/footer.jsp" />
	    </div><!-- End of container -->
	    
	    
	    <jsp:include page="/footer.jsp" />
    </body>

    </html>