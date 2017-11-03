<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	java.util.Date date = new java.util.Date();
	pageContext.setAttribute("date", date);
%>

<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		    	
        <jsp:include page="/header_css.jsp" />
        <jsp:include page="/font_css.jsp" />
        <style>
        thead{
	      background-color: #d62d67;
    	  color: #e9e9e9;
        }
        #pathWay {
      	  color: #666;
      	  height: 28px;
      	  line-height: 28px;
      	  border-bottom: 1px solid #c0b7b7;
      	  text-indent: 5px;
      	  font-size: 18px;
      	  font-weight: normal;
      	  margin-bottom: 10px;
      	  font-family:微軟正黑體;
        }
        </style>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
		<div class="jumbotron">
		
		<!--上層導覽列(開始) -->
		<div id="pathWay">
        	<span>
            	<a href="<%=request.getContextPath() %>/index.jsp">
            		<span>使用者功能</span>
            	</a>
        	</span>&gt;
        	        	<span>
            	<a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
            		<span>賽季管理</span>
            	</a>
        	</span>&gt;
        	<span><span>分組列表</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
			<div class="col-md-12">
			<h2>分組列表</h2>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>賽季名稱</td>
			                <td>賽季開始日期</td>
			                <td>賽季結束日期</td>
			                <td>報名開始日期</td>
			                <td>報名結束日期</td>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td>${seasonVO.seasonName}</td>
							<td>${seasonVO.seasonBeginDate}</td>
							<td>${seasonVO.seasonEndDate}</td>
							<td><fmt:formatDate value="${seasonVO.signUpBegin}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td><fmt:formatDate value="${seasonVO.signUpEnd}" pattern="yyyy-MM-dd HH:mm"/></td>
						</tr>
					</tbody>
				</table>
				<p>${seasonVO.descriptions}</p>
				
		        <table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>分組名稱</td>
		                    <td>隊伍數量上限</td>
		                    <td>隊伍數量下限</td>
		                    <td>目前隊伍數量</td>
		                    <td>球隊成員上限</td>
		                    <td>球隊成員下限</td>
		                    <td>狀態</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="groupsSet" items="${seasonVO.groupsSet}">
			        		<tr>
			        			<td><a href="<%=request.getContextPath()%>/Games.do?action=GET_GAMES&groupID=${groupsSet.groupID}">${groupsSet.groupName}</a></td>
			        			<td>${groupsSet.maxTeams}</td>
			        			<td>${groupsSet.minTeams}</td>
			        			<td>${groupsSet.currentTeams}</td>
			        			<td>${groupsSet.maxPlayers}</td>
			        			<td>${groupsSet.minPlayers}</td>
			        			<td>
			        				<c:choose>
			        					<c:when test="${groupsSet.seasonVO.seasonEndDate < date}">
			        						賽季已結束
			        					</c:when>
			        					<c:when test="${groupsSet.seasonVO.seasonEndDate > date && groupsSet.seasonVO.seasonBeginDate < date}">
			        						賽季進行中
			        					</c:when>
			        					<c:when test="${groupsSet.seasonVO.signUpEnd < date}">
			        						報名已截止
			        					</c:when>
			        					<c:when test="${groupsSet.seasonVO.signUpBegin > date}">
			        						報名尚未開始
			        					</c:when>
			        					<c:otherwise>
			        						<c:if test="${groupsSet.currentTeams < groupsSet.minTeams}">
			        							未達最低隊伍數量
			        						</c:if>
			        						<c:if test="${groupsSet.currentTeams == groupsSet.maxTeams}">
			        							已額滿
			        							<c:if test="${empty groupsSet.gamesSet}">
			        								<br><a style="color:white;"href="<%=request.getContextPath()%>/Groups.do?action=ADD_SCHEDULE&groupID=${groupsSet.groupID}"><button class="btn btn-primary">可編排賽程</button></a>
			        							</c:if>
			        						</c:if>
			        						<c:if test="${groupsSet.currentTeams < groupsSet.maxTeams && groupsSet.currentTeams >= groupsSet.minTeams}">
			        							未額滿
			        						</c:if>
			        					</c:otherwise>
			        				</c:choose>
			        			</td>
			        			<td>
			        				<form action="<%=request.getContextPath()%>/Groups.do" method="post">
			        					<input type="hidden" name="action" value="GET_ONE_TO_UPDATE">
			        					<input type="hidden" name="groupID" value="${groupsSet.groupID}">
			        					<input type="submit" class="btn btn-warning updateData" value="修改">
			        				</form>
			        			</td>
			        			<td>
			        				<form action="<%=request.getContextPath()%>/Groups.do" method="post">
			        					<input type="hidden" name="action" value="DELETE_GROUP">
			        					<input type="hidden" name="groupID" value="${groupsSet.groupID}">
			        					<input type="submit" class="btn btn-danger" value="刪除">
			        				</form>
			        			</td>
			        		</tr>
			        	</c:forEach>			        	
			        </tbody>
			    </table>
			    
			    
		    </div>
	    <jsp:include page="/footer.jsp" />
	    </div>
	    </div>
	    
	    
    </body>
	<jsp:include page="/footer_css.jsp" />
    </html>