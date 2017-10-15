<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*"%>
<%@ page import="eeit.games.model.*"%>
<%
	GamesDAO_Hibernate dao = new GamesDAO_Hibernate();
	Set<GamesVO> set = dao.getAll();
	pageContext.setAttribute("set", set);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<table border="1">
		<c:forEach var="games" items="${set}">
			<tr>
				<td>${games.gameID}</td>
				<td>${games.locationID}</td>
				<td>${games.groupsVO.groupName}</td>
			</tr>
		</c:forEach>

	</table>



</body>

</html>