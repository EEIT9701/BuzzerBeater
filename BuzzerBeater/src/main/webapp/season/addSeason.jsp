<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<input type="hidden" name="seasonID" value="${sVO.seasonID}">
				
				<table class="table table-bordered" id="seasonList">
			        <tbody>
						<tr>
							<td>賽季名稱</td>
							<td><input type="text" name="seasonName" value="${sVO.seasonName}"></td>
						</tr>
						<tr>
							<td>賽季開始日期</td>
							<td><input type="date" name="seasonBeginDate" value="${sVO.seasonBeginDate}"></td>
						</tr>
						<tr>
							<td>賽季結束日期</td>
							<td><input type="date" name="seasonEndDate" value="${sVO.seasonEndDate}"></td>
						</tr>
						<tr>
							<td>報名開始時間</td>
							<td><input type="text" name="signUpBegin" value="${sVO.signUpBegin}"></td>
						</tr>
						<tr>
							<td>報名結束時間</td>
							<td><input type="text" name="signUpEnd" value="${sVO.signUpEnd}"></td>
						</tr>
						<tr>
							<td>備註</td>
							<td><textarea name="descriptions" >${sVO.descriptions}</textarea></td>
						</tr>
			        </tbody>
			        
			    </table>
			    <input type="submit" value="送出">
				<input type="reset" value="重置">
			</form>
		    </div>
	    </div>
	    
	    
	    <jsp:include page="/footer.jsp" />
    </body>

    </html>