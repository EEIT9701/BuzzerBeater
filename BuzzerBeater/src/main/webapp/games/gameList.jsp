<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    	
        <title>Season</title>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>分組名稱</td>
			                <td>目前球隊數量</td>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td>${groupsVO.groupName}</td>
							<td>${groupsVO.currentTeams}</td>
						</tr>
						<tr>
							<td colspan="2">${seasonVO.descriptions}</td>
						</tr>
					</tbody>
				</table>

		        <table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>賽事開始時間</td>
		                    <td>賽事結束時間</td>
		                    <td>比賽地點</td>
		                    <td>隊伍</td>
		                    <td>隊伍</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="gamesSet" items="${groupsVO.gamesSet}">
			        		<tr>
			        			<td>${gamesSet.gameBeginDate}</td>
			        			<td>${gamesSet.gameEndDate}</td>
<<<<<<< HEAD
			        			<td>${gamesSet.locationID}</td>
			        			<td>${gamesSet.teamAID}</td>
			        			<td>${gamesSet.teamBID}</td>
=======
			        			<td>${gamesSet.locationinfoVO.locationName}</td>
			        			<td>${gamesSet.teamAVO.teamName}</td>
			        			<td>${gamesSet.teamBVO.teamName}</td>
>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git
			        		</tr>
			        	</c:forEach>			        	
			        </tbody>
			    </table>
			    
			    
		    </div>
	    </div>
	    
	    
	    <jsp:include page="/footer.jsp" />
    </body>

    </html>