<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	try {
		Integer groupID = Integer.valueOf(request.getParameter("groupID"));
		eeit.groups.model.GroupsService groupSvc = new eeit.groups.model.GroupsService();
		request.setAttribute("groupsVO", groupSvc.findByGroupID(groupID));
	} catch (Exception e) {
		response.sendRedirect(request.getContextPath());
	}
%>

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
	        	</span>
	        	&gt;
	        	<span>
	            	<a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
	            		<span>賽季管理</span>
	            	</a>
	        	</span>
	        	&gt;
	        	<span>
	        		<a href="<%=request.getContextPath() %>/groups/groupList_back.jsp?seasonID=${groupsVO.seasonVO.seasonID}">
	            		<span>${groupsVO.seasonVO.seasonName}</span>
	            	</a>
	        	</span>
	        	&gt;
	        	<span>${groupsVO.groupName}</span>
	    	</div>
	    	<!--上層導覽列(結束) -->
	    	
			<!-- 網頁內容 -->
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>賽季名稱</td>
							<td>分組名稱</td>
			                <td>球隊數量</td>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td>${groupsVO.seasonVO.seasonName}</td>
							<td>${groupsVO.groupName}</td>
							<td>${groupsVO.currentTeams}</td>
						</tr>
					</tbody>
				</table>
				
				<div class="col-md-2 col-md-offset-10">
					<br>
					<form action="<%=request.getContextPath()%>/Games.do" method="post">
				    	<input type="hidden" name="action" value="GET_GAMES_EXCEL">
				    	<input type="hidden" name="groupID" value="${groupsVO.groupID}">
				    	<input type="submit" class="btn btn-info btn-lg" id="getExcel" value="下載Excel">
				    </form>
				    <br>
			    </div>

		        <table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>賽事開始時間</td>
		                    <td>賽事結束時間</td>
		                    <td>比賽地點</td>
		                    <td>主隊</td>
		                    <td>比數</td>
		                    <td>客隊</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="gamesSet" items="${groupsVO.gamesSet}">
			        		<tr>
			        			<td><fmt:formatDate value="${gamesSet.gameBeginDate}" pattern="yyyy-MM-dd HH:mm"/></td>
			        			<td><fmt:formatDate value="${gamesSet.gameEndDate}" pattern="yyyy-MM-dd HH:mm"/></td>
			        			<td><a href="<%=request.getContextPath()%>/Locationinfo.do?action=GET_ONE_LOCATION&locationID=${gamesSet.locationinfoVO.locationID}">${gamesSet.locationinfoVO.locationName}</a></td>
			        			<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${gamesSet.teamAVO.teamID}">${gamesSet.teamAVO.teamName}</a></td>
			        			<td><a href="<%=request.getContextPath() %>/PersonalData.do?action=Get_singlefieldData&gameID=${gamesSet.gameID}">${gamesSet.teamAScore} - ${gamesSet.teamBScore}</a></td>
			        			<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${gamesSet.teamBVO.teamID}">${gamesSet.teamBVO.teamName}</a></td>
			        		</tr>
			        	</c:forEach>			        	
			        </tbody>
			    </table>
		    </div>
		    
			<!-- 網頁內容END -->
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
				// 處理中
				$('a').click(function(){
					$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
				})
				
				$('#getExcel').click(function(){
					$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
					setTimeout(function(){
						$.unblockUI();
					},1500)
				})
			})
		</script>
    </body>

    </html>