<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="eeit.memberinfo.model.*"%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>所有會員資料</title>
</head>
<body>



<!-- 測試之資料正確性 -->
 <%
    MemberInfoService dao = new MemberInfoService();
    MemberInfoVO x = dao.findByPK(8001);
    pageContext.setAttribute("memberinfo",x);
%> 

	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>會員編號</th>
		<th>會員帳號</th>
		<th>會員名稱</th>
		<th>權限</th>
		<th>註冊時間</th>
		<th>球隊ID</th>
	</tr>
		<tr align='center' valign='middle'>
			<td>${memberinfo.memberID}</td>
			<td>${memberinfo.acc}</td>
			<td>${memberinfo.name}</td>
			<td>${memberinfo.auth}</td>
			<td>${memberinfo.registerTime}</td>
			<td>${memberinfo.teamID}</td>
		</tr>
</table>

</body>
</html>