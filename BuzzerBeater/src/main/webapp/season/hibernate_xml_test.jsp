<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@ page import="eeit.season.model.*"%>
<%
	SeasonDAO_Hibernate dao = new SeasonDAO_Hibernate();
	Set<SeasonVO> seasonSet = dao.getAll();
	pageContext.setAttribute("seasonSet",seasonSet);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<c:forEach var="season" items="${seasonSet}">
			<c:forEach var="group" items="${season.groupsSet}">
				<c:forEach var="game" items="${group.gamesSet}">
					<tr>
						<td>${game.gameID}</td>
						<td>${game.teamAVO.teamName}</td>
						<td>${game.teamBVO.teamName}</td>
						<c:forEach var="personalData" items="${game.personalDataSet}">
							<td>${personalData.quarters}</td>
							<td>${personalData.playersVO.playerName}</td>
							<c:forEach var="teamComposition" items="${personalData.playersVO.teamCompositionSet}">
								<td>${teamComposition.joinTeamDate}</td>
							</c:forEach>
						</c:forEach>
					</tr>
				</c:forEach>
			</c:forEach>
		</c:forEach>
	</table>


</body>

</html>