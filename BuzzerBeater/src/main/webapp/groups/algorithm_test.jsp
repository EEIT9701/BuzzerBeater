<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="goAlgorithm" method="post"
		action="<%=request.getContextPath()%>/Groups.do">
		<input type="hidden" name="action" value="ALGORITHM_COUNT">
		<input type="hidden" name="groupID" value="2001">
		<input type="submit">
	</form>
	<c:if test="${not empty teamsCount}">
		共有${teamsCount}隊，需打${result}場比賽
	</c:if>
</body>
</html>