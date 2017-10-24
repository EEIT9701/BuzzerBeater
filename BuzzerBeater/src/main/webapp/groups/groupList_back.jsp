<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		    	
        <title>Season</title>
        <jsp:include page="/header_css.jsp" />
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>賽季名稱</td>
			                <td>賽季開始日期</td>
			                <td>賽季結束日期</td>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td>${seasonVO.seasonName}</td>
							<td>${seasonVO.seasonBeginDate}</td>
							<td>${seasonVO.seasonEndDate}</td>
						</tr>
						<tr>
							<td colspan="3">${seasonVO.descriptions}</td>
						</tr>
					</tbody>
				</table>

		        <table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>分組名稱</td>
		                    <td>隊伍數量上限</td>
		                    <td>隊伍數量下限</td>
		                    <td>目前隊伍數量</td>
		                    <td>球隊成員上限</td>
		                    <td>球隊成員下限</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="groupsSet" items="${seasonVO.groupsSet}">
			        		<tr>
			        			<td><a href="<%=request.getContextPath() %>/Groups.do?action=GET_GAMES&groupID=${groupsSet.groupID}">${groupsSet.groupName}</a></td>
			        			<td>${groupsSet.maxTeams}</td>
			        			<td>${groupsSet.minTeams}</td>
			        			<td>${groupsSet.currentTeams}</td>
			        			<td>${groupsSet.maxPlayers}</td>
			        			<td>${groupsSet.minPlayers}</td>
			        		</tr>
			        	</c:forEach>			        	
			        </tbody>
			    </table>
			    
			    
		    </div>
	    </div>
	    
	    
	    <jsp:include page="/footer.jsp" />
    </body>
	<jsp:include page="/footer_css.jsp" />
    </html>