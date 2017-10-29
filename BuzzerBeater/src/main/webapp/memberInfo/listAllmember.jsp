<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="eeit.memberinfo.model.*"%>   
<%@ page import="java.util.*"%>

<%
//   MemberInfoService dao = new MemberInfoService();
//   List<MemberInfoVO> list = dao.getAll();
//   pageContext.setAttribute("list",list);
%> 
<jsp:useBean id="memberInfoSvc" scope="page" class="eeit.memberinfo.model.MemberInfoService" />

<!DOCTYPE >
<html>
<head>
<title>所有會員資料</title>
</head>
<body>
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>會員編號</th>
		<th>會員帳號</th>
		<th>會員名稱</th>
		<th>權限</th>
		<th>註冊時間</th>
		<th>球隊ID</th>
	</tr>
	<c:forEach var="MemberInfoVO" items="${memberInfoSvc.all}">
		<tr align='center' valign='middle'>
			<td>${MemberInfoVO.memberID}</td>
			<td>${MemberInfoVO.acc}</td>
			<td>${MemberInfoVO.name}</td>
			<td>${MemberInfoVO.auth}</td>
			<td>${MemberInfoVO.registerTime}</td>
			<td>${MemberInfoVO.teamID}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>