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
        
		<style>
		
		td input{
		 	width:90%;
		 	text-align:left;
		}
		</style>
		
    </head>
    <body>
    
	    <jsp:include page="/header.jsp" />
	
		<div class="container-fluid">
			<div class="jumbotron">
			<!-- 網頁內容 -->
			<table class="table table-bordered" >
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
			
			<input type="hidden" name="gameID" value="${gamesVO.gameID}">
			<h3>${gamesVO.teamAVO.teamName}</h3>
			<table id="teamA" class="table table-bordered">
				<thead>
					<tr>
						<td id="st1">球員姓名</td>
						<td>上場時間</td>
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
				<tbody >
					<c:forEach var="tcVO" items="${gamesVO.teamAVO.teamCompositionSet}">
					<tr>
						<input type="hidden" name="teamID" value="${tcVO.teamsVO.teamID}">
						<input type="hidden" name="playerID" value="${tcVO.playersVO.playerID}">
						<td><nobr>${tcVO.playersVO.playerName}</nobr></td>
						<td><input type="number" class="form-control" name="gameTime" value="0"></td>
						<td><input type="number" class="form-control" name="twoPoint" value="0"></td>
						<td><input type="number" class="form-control" name="twoPointShot" value="0"></td>
						<td><input type="number" class="form-control" name="threePoint" value="0"></td>
						<td><input type="number" class="form-control" name="threePointShot" value="0"></td>
						<td><input type="number" class="form-control" name="fg" value="0"></td>
						<td><input type="number" class="form-control" name="fgShot" value="0"></td>
						<td><input type="number" class="form-control" name="offreb" value="0"></td>
						<td><input type="number" class="form-control" name="defreb" value="0"></td>
						<td><input type="number" class="form-control" name="blocks" value="0"></td>
						<td><input type="number" class="form-control" name="assist" value="0"></td>
						<td><input type="number" class="form-control" name="steal" value="0"></td>
						<td><input type="number" class="form-control" name="turnover" value="0"></td>
						<td><input type="number" class="form-control" name="personalFouls" value="0"></td>
						<td><input type="number" class="form-control" name="points" readonly value="0"></td>
						<td><input type="checkbox" class="form-control" name="startingPlayer"></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<br><br><br><br>
			<h3>${gamesVO.teamBVO.teamName}</h3>
			<table id="teamB" class="table table-bordered">
				<thead>
					<tr>
						<td id="st1">球員姓名</td>
						<td>上場時間</td>
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
						<td><nobr>${tcVO.playersVO.playerName}</nobr></td>
						<td><input type="number" class="form-control" name="gameTime" value="0"></td>
						<td><input type="number" class="form-control" name="twoPoint" value="0"></td>
						<td><input type="number" class="form-control" name="twoPointShot" value="0"></td>
						<td><input type="number" class="form-control" name="threePoint" value="0"></td>
						<td><input type="number" class="form-control" name="threePointShot" value="0"></td>
						<td><input type="number" class="form-control" name="fg" value="0"></td>
						<td><input type="number" class="form-control" name="fgShot" value="0"></td>
						<td><input type="number" class="form-control" name="offreb" value="0"></td>
						<td><input type="number" class="form-control" name="defreb" value="0"></td>
						<td><input type="number" class="form-control" name="blocks" value="0"></td>
						<td><input type="number" class="form-control" name="assist" value="0"></td>
						<td><input type="number" class="form-control" name="steal" value="0"></td>
						<td><input type="number" class="form-control" name="turnover" value="0"></td>
						<td><input type="number" class="form-control" name="personalFouls" value="0"></td>
						<td><input type="number" class="form-control" name="points" readonly value="0"></td>
						<td><input type="checkbox" class="form-control" name="startingPlayer"></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/PersonalData.do" name="action" enctype="multipart/form-data">
<input type="hidden" name="action" value="from1">
<input type="hidden" name="gameID" value="${gamesVO.gameID}">
<input type="hidden" name="seasonID" value="${gamesVO.groupsVO.seasonVO.seasonID}">
<div>
<input type="file" name="updatefile" class="col-md-2">
<input type="submit" value="上傳檔案" class="btn btn-info">
<input type="submit" value="送出" class="btn btn-success btn-lg col-md-offset-8">
</div>
</FORM>


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
					
					var gameTime = $(this).find('input[name="gameTime"]').val();
					var teamID = $(this).find('input[name="teamID"]').val();
					var playerID = $(this).find('input[name="playerID"]').val();
					var twoPoint = $(this).find('input[name="twoPoint"]').val();
					var twoPointShot = $(this).find('input[name="twoPointShot"]').val();
					var threePoint = $(this).find('input[name="threePoint"]').val();
					var threePointShot = $(this).find('input[name="threePointShot"]').val();
					var fg = $(this).find('input[name="fg"]').val();
					var fgShot = $(this).find('input[name="fgShot"]').val();
					var offreb = $(this).find('input[name="offreb"]').val();
					var defreb = $(this).find('input[name="defreb"]').val();
					var blocks = $(this).find('input[name="blocks"]').val();
					var assist = $(this).find('input[name="assist"]').val();
					var steal = $(this).find('input[name="steal"]').val();
					var turnover = $(this).find('input[name="turnover"]').val();
					var personalFouls = $(this).find('input[name="personalFouls"]').val();
					
					if( $(this).find('input[name="startingPlayer"]').prop('checked')) {
						var startingPlayer = "1";
					} else {
						var startingPlayer = "0";
					}
					
					perData = JSON.stringify({"gameTime":gameTime,"teamID":teamID,"playerID":playerID,"twoPoint":twoPoint,"twoPointShot":twoPointShot,"threePoint":threePoint,"threePointShot":threePointShot,"fg":fg,"fgShot":fgShot,"offReb":offreb,"defReb":defreb,
						"blocks":blocks,"assist":assist,"steal":steal,"turnover":turnover,"personalFouls":personalFouls,"startingPlayer":startingPlayer
					});
					JSONstr = JSONstr + perData +",";
				})
				
				var teamB = $('#teamB>tbody tr');
				$.each(teamB, function(index,tr){
					var perData = "";
					
					var gameTime = $(this).find('input[name="gameTime"]').val();
					var teamID = $(this).find('input[name="teamID"]').val();
					var playerID = $(this).find('input[name="playerID"]').val();
					var twoPoint = $(this).find('input[name="twoPoint"]').val();
					var twoPointShot = $(this).find('input[name="twoPointShot"]').val();
					var threePoint = $(this).find('input[name="threePoint"]').val();
					var threePointShot = $(this).find('input[name="threePointShot"]').val();
					var fg = $(this).find('input[name="fg"]').val();
					var fgShot = $(this).find('input[name="fgShot"]').val();
					var offreb = $(this).find('input[name="offreb"]').val();
					var defreb = $(this).find('input[name="defreb"]').val();
					var blocks = $(this).find('input[name="blocks"]').val();
					var assist = $(this).find('input[name="assist"]').val();
					var steal = $(this).find('input[name="steal"]').val();
					var turnover = $(this).find('input[name="turnover"]').val();
					var personalFouls = $(this).find('input[name="personalFouls"]').val();
					if( $(this).find('input[name="startingPlayer"]').prop('checked')) {
						var startingPlayer = "1";
					} else {
						var startingPlayer = "0";
					}
					
					perData = JSON.stringify({"gameTime":gameTime,"teamID":teamID,"playerID":playerID,"twoPoint":twoPoint,"twoPointShot":twoPointShot,"threePoint":threePoint,"threePointShot":threePointShot,"fg":fg,"fgShot":fgShot,"offReb":offreb,"defReb":defreb,
						"blocks":blocks,"assist":assist,"steal":steal,"turnover":turnover,"personalFouls":personalFouls,"startingPlayer":startingPlayer
					});
					JSONstr = JSONstr + perData +",";
				})
				
				
				JSONstr ='['+ JSONstr.substring(0,JSONstr.length-1)+']';
				console.log(JSONstr);
				
				var gameID = $('input[name="gameID"]').val();
				
				$.post('<%=request.getContextPath()%>/Games.do',
						{'action':'ADD_GAME_JSON','gameID':gameID,'gameData':JSONstr},function(data){
					
						
						
						
				})
				
			})
			
		})
		
	    </script>




	    
    </body>

    </html>