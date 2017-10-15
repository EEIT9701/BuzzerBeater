<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="eeit.season.model.*"%>
<%@ page import="java.util.*"%>

<%
	SeasonService dao = new SeasonService();
	List<HashMap<String,Object>> set = dao.getAll();
	pageContext.setAttribute("set", set);
%>

<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    	
        <title>Season</title>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="col-md-12">
		        <h2>賽季列表</h2>

		        <table class="table table-bordered" id="seasonList">
		            <thead>
			            <tr>
			                <td>賽季名稱</td>
			                <td>賽季開始日期</td>
			                <td>賽季結束日期</td>
			                <td>報名開始日期</td>
			                <td>報名結束日期</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="sVO" items="${set}">
			        		<tr>
			        			<td><a href="<%=request.getContextPath() %>/Season.do?action=GET_GROUPS&seasonID=${sVO.seasonID}">${sVO.seasonName}</a></td>
			        			<td>${sVO.seasonBeginDate}</td>
			        			<td>${sVO.seasonEndDate}</td>
			        			<td>${sVO.signUpBegin}</td>
			        			<td>${sVO.signUpEnd}</td>
			        		</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
		    </div>
	    </div>
	    
	    
	    <jsp:include page="/footer.jsp" />
    </body>

    </html>