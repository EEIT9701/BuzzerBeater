<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="groupRegSvc" class="eeit.groupreg.model.GroupRegService" scope="page"/>
<%
	try {
		eeit.groups.model.GroupsService groupSvc = new eeit.groups.model.GroupsService();
		Integer groupID = Integer.valueOf((Integer) request.getSession().getAttribute("groupID"));
		pageContext.setAttribute("groupsVO", groupSvc.findByGroupID(groupID));
		// 若有錯誤導向首頁可避免500
	} catch(Exception e) {
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
        table,form[name="addLocation"] {
        	font-size: 18px;
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
	        	</span>&gt;<span>
	            	<a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
	            		<span>賽季管理</span>
	            	</a>
	        	</span>&gt;<span>
	            	<a href="<%=request.getContextPath() %>/Season.do?action=TO_GROUPS_BACK&seasonID=1003">
	            		<span>分組列表</span>
	            	</a>
	        	</span>&gt;
	        	<span><span>預覽賽程</span></span>
	    	</div>
	    	<!--上層導覽列(結束) -->
	    	
			<!-- 網頁內容 -->
			<table class="table table-bordered">
				<thead style="background-color:#d62d67;color:#e9e9e9;">
					<tr>
						<td>賽季名稱</td>
						<td>賽季開始日期</td>
			            <td>賽季結束日期</td>
						<td>分組名稱</td>
			            <td>球隊數量</td>
			            <td>球隊成員上限</td>
		                <td>球隊成員下限</td>
					</tr>
				<thead>
				<tbody>
					<tr>
						<td>${groupsVO.seasonVO.seasonName}</td>
						<td>${groupsVO.seasonVO.seasonBeginDate}</td>
						<td>${groupsVO.seasonVO.seasonEndDate}</td>
						<td>${groupsVO.groupName}</td>
						<td>${groupsVO.currentTeams}</td>
						<td>${groupsVO.maxPlayers}</td>
			        	<td>${groupsVO.minPlayers}</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-bordered" id="teamList">
		        <thead style="background-color:#d62d67;color:#e9e9e9;">
			        <tr>
                 		<td>隊伍名稱</td>
		                <td>報隊成員數量</td>
                   		<td>報名時間</td>
			        </tr>
			    </thead>
			
			    <tbody>
			      	<c:forEach var="groupRegVO" items="${groupsVO.groupRegSet}">
				      	<tr>
				      		<td>${groupRegVO.teamsVO.teamName}</td>
				       		<%--計算該隊報名此分組人數 --%>
				       		<c:set var="groupID" value="${groupRegVO.groupsVO.groupID}"/>
				       		<c:set var="teamID" value="${groupRegVO.teamsVO.teamID}"/>
				       		<c:set var="count" value="0"/>
				       		<c:forEach var="signUpPlayer" items="${groupRegSvc.findSignUpPlayer(groupID,teamID)}" varStatus="s">
				       			<c:set var="count" value="${s.index+1}"/>
				       		</c:forEach>
				       		<td>${count}</td>
				       		<td><fmt:formatDate value="${groupRegVO.registerDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				       	</tr>
			       	</c:forEach>
			    </tbody>
			</table>
			
			<div class="col-md-2 col-md-offset-1">
				<form action="<%=request.getContextPath()%>/Games.do" method="post">
					<input type="hidden" name="action" value="GET_TEMP_EXCEL">
					<input type="submit" class="btn btn-primary" value="下載賽程EXCEL">
				</form>
			</div>
			
			<form action="<%=request.getContextPath()%>/Games.do" method="post" enctype="multipart/form-data">
				<div class="form-group col-md-2 col-md-offset-4">
					<input type="hidden" name="action" value="UPDATE_TEMP_EXCEL">
				    <input type="file" class="form-control-file" name="uploadExcel" id="putFullSeason" aria-describedby="fileHelp">
			    </div>
				<div class="col-md-2 col-md-offset-1">
			    	<input type="submit" class="btn btn-primary" value="上傳賽程EXCEL">
			    </div>
			</form>
			
			<table class="table table-bordered" id="gameList">
		        <thead style="background-color:#d62d67;color:#e9e9e9;">
			        <tr>
                  		<td>賽事日期</td>
		                <td>賽事時間</td>
		                <td>比賽地點</td>
		                <td>主隊</td>
		                <td>客隊</td>
			        </tr>
			    </thead>
			
			    <tbody>
			      	<c:forEach var="game" items="${gameSchedule}">
			       		<tr>
			       			<td>${game.date}</td>
			       			<td>${game.beginTime} ~ ${game.endTime}</td>
			       			<td>${game.locationName}</td>
			       			<td>${game.teamAName}</td>
			       			<td>${game.teamBName}</td>
			       		</tr>
			       	</c:forEach>			        	
			    </tbody>
			</table>
			
			<div class="col-md-1 col-md-offset-1">
		    	<button class="btn btn-info" onclick="history.back()">返回上一步</button>
			</div>
			    
			<div class="col-md-2 col-md-offset-7">
				<form action="<%=request.getContextPath()%>/Games.do" method="post">
					<input type="hidden" name="action" value="ADD_GAME">
					<input type="submit" class="btn btn-success btn-lg" id="submit_move" value="確認新增賽程">
				</form>
			</div>
			<br><br><br><br><br><br>
		
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>