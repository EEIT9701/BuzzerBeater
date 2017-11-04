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
<style>
.st2#td{width:100px
}
</style>
    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container-fluid">
			<div class="jumbotron">
			<!-- 網頁內容 -->
			<table id="st1">
				<thead>
					<tr>
						<td style=width:150px>分組名稱</td>
						<td style=width:150px>主隊</td>
						<td style=width:150px>客隊</td>
						<td style=width:150px>賽事開始時間</td>
						<td style=width:150px>賽事開始時間</td>
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
						<td>兩分球命中</td>
						<td>兩分球出手</td>
						<td>三分球命中</td>
						<td>三分球出手</td>
						<td>罰球命中</td>
						<td>罰球出手</td>
						<td>進攻籃板</td>
						<td>防守籃板</td>
						<td>助攻</td>
						<td>抄截</td>
						<td>阻攻</td>
						<td>失誤</td>
						<td>犯規</td>
						<td>得分</td>
						<td>先發</td>
					</tr>
				</thead>
				<tbody id="st2">
					<c:forEach var="tcVO" items="${gamesVO.teamAVO.teamCompositionSet}">
					<tr>
						<input type="hidden" name="teamID" value="${tcVO.teamsVO.teamID}">
						<input type="hidden" name="playerID" value="${tcVO.playersVO.playerID}">
						<td><nobr>${tcVO.playersVO.playerName}</nobr></td>
						<td><input style=width:100px type="number" name="twoPoint" value="0"></td>
						<td><input style=width:100px type="number" name="twoPointShot" value="0"></td>
						<td><input style=width:100px type="number" name="threePoint" value="0"></td>
						<td><input style=width:100px type="number" name="threePointShot" value="0"></td>
						<td><input style=width:100px type="number" name="fg" value="0"></td>
						<td><input style=width:100px type="number" name="fgShot" value="0"></td>
						<td><input style=width:100px type="number" name="offreb" value="0"></td>
						<td><input style=width:100px type="number" name="defreb" value="0"></td>
						<td><input style=width:100px type="number" name="blocks" value="0"></td>
						<td><input style=width:100px type="number" name="assist" value="0"></td>
						<td><input style=width:100px type="number" name="steal" value="0"></td>
						<td><input style=width:100px type="number" name="turnover" value="0"></td>
						<td><input style=width:100px type="number" name="personalFouls" value="0"></td>
						<td><input style=width:100px type="number" name="points" readonly value="0"></td>
						<td><input style=width:100px type="checkbox" name="startingPlayer"></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<h3>${gamesVO.teamBVO.teamName}</h3>
			<table id="teamB">
				<thead>
					<tr>
						<td>球員姓名</td>
						<td>兩分球命中</td>
						<td>兩分球出手</td>
						<td>三分球命中</td>
						<td>三分球出手</td>
						<td>罰球命中</td>
						<td>罰球出手</td>
						<td>進攻籃板</td>
						<td>防守籃板</td>
						<td>助攻</td>
						<td>抄截</td>
						<td>阻攻</td>
						<td>失誤</td>
						<td>犯規</td>
						<td>得分</td>
						<td>先發</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tcVO" items="${gamesVO.teamBVO.teamCompositionSet}">
					<tr>
						<input type="hidden" name="teamID" value="${tcVO.teamsVO.teamID}">
						<input type="hidden" name="playerID" value="${tcVO.playersVO.playerID}">
						<td>${tcVO.playersVO.playerName}</td>
						<td><input style=width:100px type="number" name="twoPoint"></td>
						<td><input style=width:100px type="number" name="twoPointShot"></td>
						<td><input style=width:100px type="number" name="threePoint"></td>
						<td><input style=width:100px type="number" name="threePointShot"></td>
						<td><input style=width:100px type="number" name="fg"></td>
						<td><input style=width:100px type="number" name="fgShot"></td>
						<td><input style=width:100px type="number" name="offreb"></td>
						<td><input style=width:100px type="number" name="defreb"></td>
						<td><input style=width:100px type="number" name="blocks"></td>
						<td><input style=width:100px type="number" name="assist"></td>
						<td><input style=width:100px type="number" name="steal"></td>
						<td><input style=width:100px type="number" name="turnover"></td>
						<td><input style=width:100px type="number" name="personalFouls"></td>
						<td><input style=width:100px type="number" name="points"></td>
						<td><input style=width:100px type="number" name="startingPlayer"></td>
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
				
				var JSONstr = '';
				var teamA = $('#teamA>tbody tr');
				
				$.each(teamA, function(index,tr){
					var perData = "";
					
					var playerID = $(this).find('input[name="playerID"]').val();
					var twoPoint = $(this).find('input[name="twoPoint"]').val();
					
					perData = JSON.stringify({"playerID":playerID,"twoPoint":twoPoint});
					JSONstr = JSONstr + perData +",";
				})
				
				JSONstr ='['+ JSONstr.substring(0,JSONstr.length-1)+']';
				
				$.post('<%=request.getContextPath()%>/Games.do',
						{'action':'ADD_GAME_JSON','gameData':JSONstr},function(data){
							console.log(data);
						})
				
			})
			
		})
	    </script>
	    
	    
    </body>

    </html>