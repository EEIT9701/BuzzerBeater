<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ page import="java.util.*"%>
<%@ page import="eeit.players.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<c:forEach var = "playerVO" items = "${playerVO}" >
  <Form method="post" action="<%=request.getContextPath() %>/PlayerServlet">
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="playerID" value="${playerVO.playerID}">
            <table border="0">
        <tr>
            <td>球員編號:</td>
            <td>${playerVO.playerID}</td>
            
        </tr>
        <tr>
            <td>球員姓名:</td>
            <td><input type="text" name="player_name" size="30" value="${playerVO.playerName}"></td>
        </tr>
        <tr>
            <td>身分證ID:</td>
            <td><input type="text" name="id_number" size="30" value="${playerVO.id}"></td>
        </tr>
        <tr>
            <td>身高:</td>
            <td><input type="text" name="height" size="30" value="${playerVO.height}"></td>
        </tr>
        <tr>
            <td>體重:</td>
            <td><input type="text" name="weights" size="30" value="${playerVO.weights}"></td>
        </tr>
        <tr>
            <td>生日:</td>
            <td><input type="text" name="birthday" size="30" value="${playerVO.birthday}"></td>
        </tr>
        <tr>
            <td>國籍:</td>
            <td><input type="text" name="nationality" size="30" value="${playerVO.nationality}"></td>
        </tr>
    </table> 
       <input type="submit" value="送出">    
       </Form>
    </c:forEach>
 
</body>
</html>