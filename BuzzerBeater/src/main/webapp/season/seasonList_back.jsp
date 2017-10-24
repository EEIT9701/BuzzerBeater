<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="seasonSvc" scope="page" class="eeit.season.model.SeasonService" />

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    	
		
        <title>Season</title>
        <jsp:include page="/header_css.jsp" />
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<!-- 網頁內容 -->
			<div class="col-md-12">
		        <h2>賽季列表</h2>
		        <h4><a href="<%=request.getContextPath() %>/season/addSeason.jsp">新增賽季</a></h4>
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
			        	<c:forEach var="sVO" items="${seasonSvc.all}">
			        		<tr>
			        			<td><a href="<%=request.getContextPath() %>/Season.do?action=GET_GROUPS&seasonID=${sVO.seasonID}">${sVO.seasonName}</a></td>
			        			<td>${sVO.seasonBeginDate}</td>
			        			<td>${sVO.seasonEndDate}</td>
			        			<td>${sVO.signUpBegin}</td>
			        			<td>${sVO.signUpEnd}</td>
			        			<td>
			        				<form action="<%=request.getContextPath() %>/Season.do" method="post">
			        					<input type="submit" value="修改">
			        					<input type="hidden" name="action" value="GET_ONE_TO_UPDATE">
			        					<input type="hidden" name="seasonID" value="${sVO.seasonID}">
			        				</form>
			        			</td>
			        			<td>
			        				<form action="<%=request.getContextPath() %>/Season.do" method="post">
			        					<input type="submit" value="刪除">
			        					<input type="hidden" name="action" value="DELETE_SEASON">
			        					<input type="hidden" name="seasonID" value="${sVO.seasonID}">
			        				</form>
			        			</td>
			        		</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
		    </div>
		
			<!-- 網頁內容END -->
	    	<jsp:include page="/footer.jsp" />
	    </div><!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>