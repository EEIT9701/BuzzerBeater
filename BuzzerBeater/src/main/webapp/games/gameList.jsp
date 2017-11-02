<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <title>Season</title>
        <jsp:include page="/header_css.jsp" />
        <jsp:include page="/font_css.jsp" />
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="jumbotron">
			<!-- 網頁內容 -->
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>賽季名稱</td>
							<td>分組名稱</td>
			                <td>目前球隊數量</td>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td>${groupsVO.seasonVO.seasonName}</td>
							<td>${groupsVO.groupName}</td>
							<td>${groupsVO.currentTeams}</td>
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
			        			<td><fmt:formatDate value="${gamesSet.gameBeginDate}" pattern="yyyy-MM-dd HH:mm"/></td>
			        			<td><fmt:formatDate value="${gamesSet.gameEndDate}" pattern="yyyy-MM-dd HH:mm"/></td>
			        			<td>${gamesSet.locationinfoVO.locationName}</td>
			        			<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${gamesSet.teamAVO.teamID}" target="blank">${gamesSet.teamAVO.teamName}</a></td>
			        			<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${gamesSet.teamBVO.teamID}" target="blank">${gamesSet.teamBVO.teamName}</a></td>
			        		</tr>
			        	</c:forEach>			        	
			        </tbody>
			    </table>
		    </div>
		    
		    <form action="<%=request.getContextPath()%>/Games.do" method="post">
		    	<input type="hidden" name="action" value="GET_GAMES_EXCEL">
		    	<input type="hidden" name="groupID" value="${groupsVO.groupID}">
		    	<input type="submit" value="下載">
		    </form>
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>