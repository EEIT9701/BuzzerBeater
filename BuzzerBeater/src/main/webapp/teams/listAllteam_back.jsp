<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<title>EEIT97-第一組</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
			<jsp:include page="/header_css.jsp" />
			<style>
				#img1 {
					width: 55px;
					height: 40px;
					margin: auto;
				}
			</style>
		</head>

		<body>

			<jsp:include page="/header.jsp" />
			<jsp:useBean id="teamsSvc" scope="page" class="eeit.teams.model.TeamsService" />
			<!--主文(開始)-->
			<div class="container">
				<div class="jumbotron">
					<form class="form-inline" method="post" action="<%=request.getContextPath() %>/Teams.do">
						<select class="form-control" name="season">
					<option>賽季</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				  </select>
						<select class="form-control" name="groups">
					<option>分組</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				  </select>
						<select class="form-control" name="teams">
					<option>球隊</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				  </select>
						<input type="submit" class="btn btn-warning" value="搜尋">
						<input type="hidden" name="action" value="GET_ONE_TEAM">
					</form>
					<!--表格(開始)-->
					<!--****************-->
					<!-- 第一列(開始) -->
					<!--****************-->
					<div class="row">

						<div class="col-md-12">
							<div class="col-md-12">
								<table class="table table-bordered" id="table">
									<thead>
										<tr>

											<th>隊長E-mail</th>
											<th>隊長電話</th>
											<th>隊徽</th>
											<th>隊名</th>
											<th>分組</th>
											<th>教練</th>
											<th>老闆</th>
											<th>勝場數</th>
											<th>敗場數</th>
											<th>勝率</th>
											<th></th>
											<th></th>

										</tr>
									</thead>
									<tbody>
										<c:forEach var="teamsVO" items="${teamsSvc.all}">
											<tr align='center' valign='middle'>
												<td>${teamsVO.captainEmail}</td>
												<td>${teamsVO.captainPhone}</td>
												<td><img id="img1" src="data:image/png;base64,${teamsVO.teamBadge}"></td>
												<!--隊徽-->
												<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${teamsVO.teamID}">${teamsVO.teamName}</a></td>
												<!--球名-->
												<td></td>
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

												<td>
													<Form method="post" action="<%=request.getContextPath() %>/Teams.do">
														<button type="submit" class="btn btn-info">修改</button> <input type="hidden" name="teamID" value="${teamsVO.teamID}">
														<input type="hidden" name="action" value="getOne_For_Update">
													</Form>
												</td>
												<td>
													<Form method="post" action="<%=request.getContextPath() %>/Teams.do">
														<button type="submit" class="btn btn-danger">刪除</button> <input type="hidden" name="teamID" value="${teamsVO.teamID}">														<input type="hidden" name="action" value="delete">
													</Form>
												</td>
											</tr>



										</c:forEach>
								</table>

							</div>
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
					$('#table').DataTable();
				});
			</script>

		</body>

		</html>