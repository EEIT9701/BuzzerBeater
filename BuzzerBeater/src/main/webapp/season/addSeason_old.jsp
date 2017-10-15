<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>新增賽季</title>

</head>

<body>
	<h1>新增賽季</h1>
	
	<c:if test="${not empty errorMsgs}">
                        請修正以下錯誤:
        <ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li>${message}</li>
			</c:forEach>
		</ul>
	</c:if>


	<form method="post" action="<%=request.getContextPath()%>/Season.do">
		<input type="hidden" name="action" value="ADD_SEASON">
		<input type="hidden" name="season_ID" value="${sVO.season_ID}">
		
		<table>
			<tr>
				<td>賽季名稱</td>
				<td><input type="text" name="season_Name" id="season_Name" value="${sVO.season_Name}"></td>
			</tr>
			<tr>
				<td>賽季開始日期</td>
				<td><input type="date" name="season_BeginDate" id="season_BeginDate" value="${sVO.season_BeginDate}"></td>
			</tr>
			<tr>
				<td>賽季結束日期</td>
				<td><input type="date" name="season_EndDate" id="season_EndDate" value="${sVO.season_EndDate}"></td>
			</tr>
			<tr>
				<td>報名開始時間</td>
				<td><input type="text" name="signUp_BeginDate" id="signUp_BeginDate" value="${sVO.signUp_BeginDate}"></td>
			</tr>
			<tr>
				<td>報名結束時間</td>
				<td><input type="text" name="signUp_EndDate" id="signUp_EndDate" value="${sVO.signUp_EndDate}"></td>
			</tr>
			<tr>
				<td>備註</td>
				<td><textarea name="descriptions" id="descriptions">${sVO.descriptions}</textarea></td>
			</tr>
		</table>
		
		<input type="submit" value="送出">
		<input type="reset" value="重置">
	</form>




</body>

</html>