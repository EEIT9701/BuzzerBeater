<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <jsp:include page="/header_css.jsp" />
        <jsp:include page="/font_css.jsp" />
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="jumbotron">
			<!-- 網頁內容 -->
			<table class="table table-bordered">
				<thead>			
					<tr>
						<td>賽季</td>
						<td>分組</td>
						<td>報名截止時間</td>
						<td>隊伍上限</td>
						<td>隊伍下限</td>
						<td>現在隊伍數量</td>
						<td>人數下限</td>
						<td>人數上限</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="groupList" items="${signUpList}">
						<tr>
							<td>${groupList.seasonName}</td>
							<td>${groupList.groupName}</td>
							<td><fmt:formatDate value="${groupList.signUpEnd}" pattern="yyyy-MM-dd HH:mm:ss"/><br></td>
							<td>${groupList.maxTeams}</td>
							<td>${groupList.minTeams}</td>
							<td>${groupList.currentTeams}</td>
							<td>${groupList.maxPlayer}</td>
							<td>${groupList.minPlayer}</td>
							<td>
								<c:choose>
									<c:when test="${not empty groupList.teamStat}">
										<c:if test="${groupList.teamStat eq 0}">報名成功待繳費</c:if>
									</c:when>
									<c:otherwise>
										<form action="<%=request.getContextPath()%>/Groups.do" method="post">
											<input type="hidden" name="action" value="GET_ONE_TO_SIGNUP">
											<input type="hidden" name="groupID" value="${groupList.groupID}">
											<input type="hidden" name="teamID" value="3001">
											<input type="submit" value="報名">
										</form>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>