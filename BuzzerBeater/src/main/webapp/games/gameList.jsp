<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
							<td>分組名稱</td>
			                <td>目前球隊數量</td>
						</tr>
					<thead>
					<tbody>
						<tr>
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
			        			<td>${gamesSet.gameBeginDate}</td>
			        			<td>${gamesSet.gameEndDate}</td>
			        			<td>${gamesSet.locationinfoVO.locationName}</td>
			        			<td>${gamesSet.teamAVO.teamName}</td>
			        			<td>${gamesSet.teamBVO.teamName}</td>
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