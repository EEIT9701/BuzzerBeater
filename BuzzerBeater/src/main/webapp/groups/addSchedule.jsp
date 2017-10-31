<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="locSvc" class="eeit.locationinfo.model.LocationinfoService" scope="page"/>

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
				<table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>賽季名稱</td>
                    		<td>分組名稱</td>
		                    <td>隊伍數量上限</td>
		                    <td>隊伍數量下限</td>
		                    <td>目前隊伍數量</td>
		                    <td>球隊成員上限</td>
		                    <td>球隊成員下限</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<tr>
			        		<td>${groupsVO.seasonVO.seasonName}</td>
			        		<td>${groupsVO.groupName}</td>
			        		<td>${groupsVO.maxTeams}</td>
			        		<td>${groupsVO.minTeams}</td>
			        		<td>${groupsVO.currentTeams}</td>
			        		<td>${groupsVO.maxPlayers}</td>
			        		<td>${groupsVO.minPlayers}</td>
			        	</tr>
			        </tbody>
			    </table>
			    
			    <table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>隊伍名稱</td>
		                    <td>報隊成員數量</td>
                    		<td>報名時間</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="groupRegVO" items="${groupsVO.groupRegSet}">
				        	<tr>
				        		<td>${groupRegVO.teamsVO.teamsName}</td>
				        		<c:forEach var="playersVO" items="${groupRegVO.teamsVO.playersSet}" varStatus="index">
				        			<td>${index}</td>
				        		</c:forEach>
				        		<td>${groupRegVO.registerDate}</td>
				        	</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
			    
			    <p>有 ${groupsVO.currentTeams} 隊，循環賽共需打 ${gamesNeeded} 場比賽</p>
			    
			    <table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>地點</td>
                    		<td>日期</td>
                    		<td>時間</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<tr>
			        		<td></td>
                    		<td></td>
                    		<td></td>
			        	</tr>
			        </tbody>
			        <tfoot>
			        	<tr>
			        		<td>
			        			<select>
				        			<c:forEach var="locVO" items="${locSvc.allList}">
				        				<option value="${locVO.locationID}">${locVO.locationName}</option>
				        			</c:forEach>
			        			</select>
			        		</td>
			        		<td>
			        			<input type="date" name="beginDate"> ~ <input type="date" name="endDate">
			        		</td>
			        		<td>
			        			<input type="time" name="beginTime"> ~ <input type="time" name="endTime">
			        		</td>
			        		<td>
			        			<input type="time" name="timeUnit">
			        		</td>
			        	</tr>
			        </tfoot>
			    </table>
			
		
		
		
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>