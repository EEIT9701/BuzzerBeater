<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="eeit.personaldata.model.*"%>
<%@ page import="eeit.players.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	PersonalDataService playerSvc = new PersonalDataService();
	List<PersonalDataVO> list = playerSvc.getAll();
	pageContext.setAttribute("list1", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
					   <table class="table table-bordered">
					   <thead>
									<tr>
									
									<tr>
					  </thead>
					    <c:set var="pointmaxA" value="0"/>
					    <c:set var="assistmaxA" value="0"/>
					    <c:set var="rebmaxA" value="0"/>
					    <c:set var="addaxA" value="0"/>
					    <c:set var="nameA" value=""/>
					    <c:set var="photoA" value=""/>
					    <c:set var="assistnameA" value=""/>
					    <c:set var="assistphotoA" value=""/>
					    <c:set var="rebnameA" value=""/>
					    <c:set var="rebphotoA" value=""/>
						<c:forEach var="singlefieldVO" items="${list1}" >
						   <c:if test="${singlefieldVO.points>pointmaxA}">			   
								<c:set var="pointmaxA" value="${singlefieldVO.points}"/>
								<c:set var="nameA" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="photoA" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
						    <c:if test="${singlefieldVO.assist>assistmaxA}">
								<c:set var="assistmaxA" value="${singlefieldVO.assist}"/>
								<c:set var="assistnameA" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="assistphotoA" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
						   <c:if test="${singlefieldVO.defReb+singlefieldVO.offReb>rebmaxA}">
								<c:set var="rebmaxA" value="${singlefieldVO.defReb+singlefieldVO.offReb}"/>
								<c:set var="rebnameA" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="rebphotoA" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
                        </c:forEach>
                        
                       
                        
					  <tbody>
						<tr>
						  <td>得分王					  
						    <img src="data:image/png;base64,${photoA}" height="135" width="90">
						    <c:out value="${nameA}"/>
						    <c:out value="${pointmaxA}"/>
						  </td>
						  
					
					      <td>助功王					  
						    <img src="data:image/png;base64,${assistphotoA}" height="135" width="90">
						    <c:out value="${assistnameA}"/>
						    <c:out value="${assistmaxA}"/>
						  </td>
						
					   
					 
					      <td>籃板王					  
						    <img src="data:image/png;base64,${rebphotoA}" height="135" width="90">
						    <c:out value="${rebnameA}"/>
						    <c:out value="${rebmaxA}"/>
						  </td>
						
					    </tr>
					    
					    
					    
                      </tbody>   
			           </table>

</body>
</html>