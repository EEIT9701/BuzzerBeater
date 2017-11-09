<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	java.util.Date date = new java.util.Date();
	pageContext.setAttribute("date", date);
	
	try {
		eeit.season.model.SeasonService seasonSvc = new eeit.season.model.SeasonService();
		Integer seasonID = Integer.valueOf(request.getParameter("seasonID"));
		pageContext.setAttribute("seasonVO", seasonSvc.findBySeasonID(seasonID));
		// 若有錯誤導向首頁可避免500
	} catch(Exception e) {
		response.sendRedirect(request.getContextPath());
	}
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
            	<a class="blockUI" href="<%=request.getContextPath() %>/index.jsp">
            		<span>使用者功能</span>
            	</a>
        	</span>
        	&gt;
        	<span>
            	<a class="blockUI" href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
            		<span>賽季管理</span>
            	</a>
        	</span>
        	&gt;
        	<span>${seasonVO.seasonName}</span>
    	</div>
    	<!--上層導覽列(結束) -->
			<div class="col-md-12">
			<h2>${seasonVO.seasonName}</h2>
				<table class="table table-bordered">
					<thead>
						<tr>
			                <td>賽季開始日期</td>
			                <td>賽季結束日期</td>
			                <td>報名開始日期</td>
			                <td>報名結束日期</td>
						</tr>
					<thead>
					<tbody>
						<tr>
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
			        			<td><a href="<%=request.getContextPath()%>/games/gameList_back.jsp?groupID=${groupsSet.groupID}">${groupsSet.groupName}</a></td>
			        			<td>${groupsSet.maxTeams}</td>
			        			<td>${groupsSet.minTeams}</td>
			        			<td>${groupsSet.currentTeams}</td>
			        			<td>${groupsSet.maxPlayers}</td>
			        			<td>${groupsSet.minPlayers}</td>
			        			<td>
			        				<c:choose>
			        					<c:when test="${groupsSet.seasonVO.seasonEndDate < date}">
			        						<nobr>賽季已結束</nobr>
			        					</c:when>
			        					<c:when test="${groupsSet.seasonVO.seasonEndDate > date && groupsSet.seasonVO.seasonBeginDate < date}">
			        						<nobr>賽季進行中</nobr>
			        					</c:when>
			        					<c:when test="${groupsSet.seasonVO.signUpEnd < date}">
			        						<nobr>報名已截止</nobr>
			        					</c:when>
			        					<c:when test="${groupsSet.seasonVO.signUpBegin > date}">
			        						<nobr>報名尚未開始</nobr>
			        					</c:when>
			        					<c:otherwise>
			        						<c:if test="${groupsSet.currentTeams < groupsSet.minTeams}">
			        							<nobr>未達最低隊伍數量</nobr>
			        						</c:if>
			        						<c:if test="${groupsSet.currentTeams == groupsSet.maxTeams && empty groupsSet.gamesSet}">
			        							<a style="color:white;"href="<%=request.getContextPath()%>/Groups.do?action=ADD_SCHEDULE&groupID=${groupsSet.groupID}"><button class="btn btn-primary blockUI">前往賽程安排系統</button></a>
			        						</c:if>
			        						<c:if test="${groupsSet.currentTeams == groupsSet.maxTeams && not empty groupsSet.gamesSet}">
			        							<nobr>賽程已安排完成</nobr>
			        						</c:if>
			        						<c:if test="${groupsSet.currentTeams < groupsSet.maxTeams && groupsSet.currentTeams >= groupsSet.minTeams}">
			        							<nobr>未額滿</nobr>
			        						</c:if>
			        					</c:otherwise>
			        				</c:choose>
			        			</td>
			        			<td>
			        				<a href="<%=request.getContextPath()%>/groups/updateGroup.jsp?groupID=${groupsSet.groupID}">
			        					<input type="submit" class="btn btn-warning updateData blockUI" value="修改">
			        				</a>
			        			</td>
			        			<td>
			        				<form action="<%=request.getContextPath()%>/Groups.do" method="post">
			        					<input type="hidden" name="action" value="DELETE_GROUP">
			        					<input type="hidden" name="groupID" value="${groupsSet.groupID}">
			        					<input type="hidden" name="seasonID" value="${seasonVO.seasonID}">
			        					<input type="submit" class="btn btn-danger blockUI" value="刪除">
			        				</form>
			        			</td>
			        		</tr>
			        	</c:forEach>			        	
			        </tbody>
			        
			        <tfoot>
			        	<form action="<%=request.getContextPath()%>/Groups.do" method="post">
			        	<tr>
			        		<td>
			        			<input class="form-control" type="text" value="${groupVO.groupName}" id="groupName" name="groupName">
			        		</td>
			        		<td>
			        			<input class="form-control" type="number" value="${groupVO.maxTeams}" id="maxTeams" name="maxTeams">
			        		</td>
			        		<td>
			        			<input class="form-control" type="number" value="${groupVO.minTeams}" id="minTeams" name="minTeams">
			        		</td>
			        		<td></td>
			        		<td>
			        			<input class="form-control" type="number" value="${groupVO.maxPlayers}" id="maxPlayers" name="maxPlayers">
			        		</td>
			        		<td>
			        			<input class="form-control" type="number" value="${groupVO.minPlayers}" id="minPlayers" name="minPlayers">
			        		</td>
			        		<td></td>
			        		<td>
			        			<input type="hidden" name="action" value="ADD_GROUP">
								<input type="hidden" name="seasonID" value="${seasonVO.seasonID}">
			        			<input type="submit" class="btn btn-success blockUI" value="新增">
			        		</td>
			        		<td>
			        			<input type="reset" class="btn btn-danger blockUI" value="重設">
			        		</td>
			        	</tr>
			        	</form>
			        </tfoot>
			    </table>
		    </div>
			<br><br><br><br><br><br>
		    
	    <jsp:include page="/footer.jsp" />
	    </div>
	    </div>
		<jsp:include page="/footer_css.jsp" />
	    
  		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css">
  		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
	    <%--遮罩插件 --%>  		
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-blockUI-1.33.js"></script>
		
	    <script type="text/javascript">
	    $(function(){
	    	$(document).on('click','.blockUI',function(){
	    		// 處理中
				$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
	    	})
	    })
		</script>
    </body>
    </html>