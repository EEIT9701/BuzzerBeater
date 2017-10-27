<%@ page contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setHeader("Content-disposition", "attachment; filename=gogogo.xlsx");
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
		        <table>
			            <tr>
                    		<td>賽事開始時間</td>
		                    <td>賽事結束時間</td>
		                    <td>比賽地點</td>
		                    <td>隊伍</td>
		                    <td>隊伍</td>
			            </tr>
			
			        	<c:forEach var="gamesSet" items="${groupsVO.gamesSet}">
			        		<tr>
			        			<td>${gamesSet.gameBeginDate}</td>
			        			<td>${gamesSet.gameEndDate}</td>
			        			<td>${gamesSet.locationinfoVO.locationName}</td>
			        			<td>${gamesSet.teamAVO.teamName}</td>
			        			<td>${gamesSet.teamBVO.teamName}</td>
			        		</tr>
			        	</c:forEach>			        	
			    </table>
</body>
</html>