<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	      background-color: rgba(237, 125, 49, 0.8);
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
	            	<a href="<%=request.getContextPath() %>/season/addSeason.jsp">
	            		<span>新增賽季</span>
	            	</a>
	        	</span>
	        	&gt;
	        	<span>使用EXCEL新增完整賽季</span>
	    	</div>
	    	<!--上層導覽列(結束) -->
	    	
			<!-- 網頁內容 -->
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
					<tr>
						<td>${tempSeason.seasonName}</td>
						<td>${tempSeason.seasonBeginDate}</td>
						<td>${tempSeason.seasonEndDate}</td>
						<td><fmt:formatDate value="${tempSeason.signUpBegin}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td><fmt:formatDate value="${tempSeason.signUpEnd}" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
				</tbody>
			</table>
		
			<c:forEach var="groupsVO" items="${tempSeason.groupsSet}">
				<table class="table table-bordered">
			        <thead>
				        <tr>
	                    	<td>分組名稱</td>
			                <td>隊伍數量上限</td>
			                <td>隊伍數量下限</td>
			                <td>球隊成員上限</td>
			                <td>球隊成員下限</td>
				        </tr>
				    </thead>
				    <tbody>
				    	<tr>
				    		<td>${groupsVO.groupName}</td>
				    		<td>${groupsVO.maxTeams}</td>
				    		<td>${groupsVO.minTeams}</td>
				    		<td>${groupsVO.maxPlayers}</td>
				    		<td>${groupsVO.minPlayers}</td>
				    	</tr>
				    </tbody>
				</table>
				
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>比賽日期</td>
				           	<td>比賽時間</td>
				           	<td>比賽地點</td>
				           	<td>主隊</td>
				          	<td>客隊</td>
				        </tr>
					</thead>
					<tbody>
						<c:forEach var="gamesVO" items="${groupsVO.gamesSet}">
							<tr>
								<td><fmt:formatDate value="${gamesVO.gameBeginDate}" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${gamesVO.gameBeginDate}" pattern="HH:mm"/> ~ <fmt:formatDate value="${gamesVO.gameEndDate}" pattern="HH:mm"/></td>
								<td>${gamesVO.locationinfoVO.locationName}</td>
								<td>${gamesVO.teamAVO.teamName}</td>
								<td>${gamesVO.teamBVO.teamName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:forEach>
			
			<form action="<%=request.getContextPath()%>/Games.do" method="post" enctype="multipart/form-data">
				<div class="col-md-3">
					<label for="putFullSeason">重新上傳EXCEL</label>
					<input type="hidden" name="action" value="PUT_FULL_SEASON">
					<input type="file" class="form-control-file" name="uploadExcel" id="putFullSeason">
				</div>
				<div class="col-md-1">
				    <input type="submit" class="btn btn-lg btn-success blockUI" value="送出更改">
			    </div>
			</form>
			
			<div class="col-md-4 col-md-offset-4">
				<div class="col-md-4 col-md-offset-2">
					<form action="<%=request.getContextPath()%>/Games.do">
						<input type="hidden" name="action" value="INSERT_TEMP_SEASON">
						<input type="submit" class="btn btn-lg btn-success blockUI" value="確認新增">
					</form>
				</div>
				<div class="col-md-1"></div>	
				<div class="col-md-4">	
					<form action="<%=request.getContextPath()%>/Games.do">
						<input type="hidden" name="action" value="DELETE_TEMP_SEASON">
						<input type="submit" class="btn btn-lg btn-warning blockUI" value="取消">
					</form>
				</div>
			</div>
			
				<br><br><br><br><br><br>		
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <%--遮罩插件 --%>  		
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-blockUI-1.33.js"></script>
		 
	    <script type="text/javascript">
			$(function(){
				// 處理中
				$('.blockUI').click(function(){
					$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
				})
			})
		</script>
    </body>

    </html>