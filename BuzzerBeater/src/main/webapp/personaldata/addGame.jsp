<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	Integer gameID = Integer.valueOf(request.getParameter("gameID"));
	eeit.games.model.GamesService gameSvc = new eeit.games.model.GamesService();
	request.setAttribute("gamesVO", gameSvc.findByGameID(gameID));
%>


<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <jsp:include page="/header_css.jsp" />
        <jsp:include page="/font_css.jsp" />
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="jumbotron">
			<!-- 網頁內容 -->
			<table>
				<thead>
					<tr>
						<td>分組名稱</td>
						<td>主隊</td>
						<td>客隊</td>
						<td>賽事開始時間</td>
						<td>賽事開始時間</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${gamesVO.groupsVO.groupName}</td>
						<td>${gamesVO.teamAVO.teamName}</td>
						<td>${gamesVO.teamBVO.teamName}</td>
						<td><fmt:formatDate value="${gamesVO.gameBeginDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td><fmt:formatDate value="${gamesVO.gameEndDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
				</tbody>
			</table>
			
			
			<h3>${gamesVO.teamAVO.teamName}</h3>
			<table id="teamA">
				<thead>
					<tr>
						<td>球員姓名</td>
						<td>兩分球出手</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tcVO" items="${gamesVO.teamAVO.teamCompositionSet}">
					<tr>
						<input type="hidden" name="teamID" value="${tcVO.teamsVO.teamID}">
						<input type="hidden" name="playerID" value="${tcVO.playersVO.playerID}">
						<td>${tcVO.playersVO.playerName}</td>
						<td><input type="number" name="twoPointShot"></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			<button type="button" class="btn btn-lg btn-success" id="addGame">送出</button>
		
		
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
	    
	    <script type="text/javascript">
		$(function(){
			
			$('#addGame').click(function(){
				
				var twoPointShot = $('#teamA tr input').val();
				console.log(twoPointShot);
			})
		})
	    </script>
    </body>

    </html>