<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>

			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
			<jsp:include page="/header_css.jsp" />
			<jsp:include page="/font_css.jsp" />
			<style>
				#img1 {
					width: 55px;
					height: 40px;
					margin: auto;
					}
				th {
					text-align: center;
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
			<jsp:useBean id="teamsSvc" scope="page" class="eeit.teams.model.TeamsService" />
			<!--主文(開始)-->
			<div class="container">
					<div class="jumbotron">
		
		<!--上層導覽列(開始) -->
		<div id="pathWay">
		    <span>
            	<a href="<%=request.getContextPath() %>/index.jsp">
            		<span>首頁</span>
            	</a>
        	</span>&gt;
        	<span><span>球隊</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
<%-- 					<form class="form-inline" method="post" action="<%=request.getContextPath() %>/Players.do"> --%>
<!-- 						<select class="form-control" name="season"> -->
<!-- 					<option>賽季</option> -->
<!-- 					<option>2</option> -->
<!-- 					<option>3</option> -->
<!-- 					<option>4</option> -->
<!-- 					<option>5</option> -->
<!-- 				  </select> -->
<!-- 						<select class="form-control" name="groups"> -->
<!-- 					<option>分組</option> -->
<!-- 					<option>2</option> -->
<!-- 					<option>3</option> -->
<!-- 					<option>4</option> -->
<!-- 					<option>5</option> -->
<!-- 				  </select> -->
<!-- 						<select class="form-control" name="teams"> -->
<!-- 					<option>球隊</option> -->
<!-- 					<option>2</option> -->
<!-- 					<option>3</option> -->
<!-- 					<option>4</option> -->
<!-- 					<option>5</option> -->
<!-- 				  </select> -->
<!-- 						<input type="submit" class="btn btn-warning" value="搜尋"> -->
<!-- 						<input type="hidden" name="action" value="getOne_For_Display"> -->
<!-- 					</form> -->
					<!--表格(開始)-->
					<!--****************-->
					<!-- 第一列(開始) -->
					<!--****************-->
					<div class="row">

						<div class="col-md-12">
						<h2>球隊列表</h2>
							<table class="table table-bordered" id="table">
								<thead>
									<tr>
										<th>隊徽</th>
										<th>隊名</th>
<!-- 										<th>分組</th> -->
										<th>教練</th>
										<th>老闆</th>
										<th>勝場數</th>
										<th>敗場數</th>
										<th>勝率</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="teamsVO" items="${teamsSvc.all}">
										<tr align='center' valign='middle'>
											<td><img id="img1" src="data:image/png;base64,${teamsVO.teamBadge}"></td>
											<!--隊徽-->
											<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${teamsVO.teamID}">${teamsVO.teamName}</a></td>
											<!--球名-->
<!-- 											<td> -->
<%-- 												<c:forEach var="groupRegVO" items="${teamsVO.groupRegSet}"> --%>
<%-- 													${groupRegVO.groupsVO.groupName} --%>
<%-- 												</c:forEach> --%>
<!-- 											</td> -->
											<!--分組-->
											<td>${teamsVO.coachName}</td>
											<!--教練-->
											<td>${teamsVO.bossName}</td>
											<!--老闆-->
											<td>${teamsVO.totalWin}</td>
											<!--勝場數-->
											<td>${teamsVO.totalLose}</td>
											<!--敗場數-->
											<td>${teamsVO.winRate}</td>
											<!--勝率-->
										</tr>



									</c:forEach>
							</table>

						</div>
					</div>
					<jsp:include page="/footer.jsp" />

				</div>
			</div>
			<!--主文(結束)-->

			<jsp:include page="/footer_css.jsp" />
			<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
			<script>
				$(document).ready(function () {
					 $('#table').DataTable({
						    columnDefs: [{ width: 200, targets: 6}],
						    "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
						    "pagingType": "full_numbers",
						    "language": {
						     "lengthMenu":"每一頁顯示_MENU_ 筆資料",
						     "zeroRecords":"查無資料",
						     "info":"現在正在第_PAGE_ 頁，總共有_PAGES_ 頁",
						     "infoEmpty":"無資料",
						     "infoFiltered":"(總共搜尋了_MAX_ 筆資料)",
						     "search":"搜尋：",
						     "paginate":{
						      "first":"第一頁",
						      "previous":"上一頁",
						      "next":"下一頁",
						      "last":"最末頁"     
						    }
						     }
						   })
				});
			</script>
		</body>

		</html>