<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<jsp:useBean id="season" scope="page" class="eeit.season.model.SeasonService" />
		<jsp:useBean id="group" scope="page" class="eeit.groups.model.GroupsService" />
		<jsp:useBean id="playerSvc" scope="page" class="eeit.players.model.PlayerService" />
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<title>BuzzerBeater-球員</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

			<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
			<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
			<jsp:include page="/header_css.jsp" />
			<style>
				#img1 {
					width: 35px;
					height: 40px;
					margin: auto;
				}
			</style>

		</head>

		<body>

			<jsp:include page="/header.jsp" />

			<!--主文(開始)-->
			<div class="container">
				<div class="jumbotron">
					<form class="form-inline" method="post" action="<%=request.getContextPath()%>/Players.do">
						<select class="form-control" name="season" id="seasonSelect">
					<c:forEach var="season" items="${season.all}">
						<option value="${season.seasonID}">${season.seasonName}</option>
					</c:forEach>
				</select> <select class="form-control" name="groups" id="groupsSelect">

				</select> <select class="form-control" name="teams">
					<option>球隊</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select> <select class="form-control" name="nationality">
					<option>國家</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
						<div class="form-group">
							<input type="text" class="form-control" id="Name" name="playerName" placeholder="根據球員姓名查詢">
						</div>
						<input type="submit" class="btn btn-warning" value="搜尋"> <input type="hidden" name="action" value="getOne_For_Display">
					</form>
					<!--表格(開始)-->
					<!--****************-->
					<!-- 第一列(開始) -->
					<!--****************-->
					<div class="row">

						<div class="col-md-12">

							<table class="table table-bordered" id="table">
								<thead>
									<tr>
										<th>球員照片</th>
										<th>球員姓名</th>
										<th>分組</th>
										<th>球隊</th>
										<th>身高</th>
										<th>體重</th>
										<th>生日</th>
										<th>國籍</th>

									</tr>
								</thead>
								<tbody>



									<c:forEach var="playersVO" items="${playerSvc.allPlayer}">
										<tr align='center' valign='middle'>



											<td><img id="img1" src="data:image/jpeg;base64,${playersVO.photo}"></td>
											<!--球員照片-->


											<td><a href="<%=request.getContextPath()%>/players/playerInformation.jsp?playerID=${playersVO.playerID}">${playersVO.playerName}</a></td>
											<!--球員姓名-->
											<td></td>
											<!--分組-->
											<td></td>
											<!--球隊-->
											<td>${playersVO.height}</td>
											<!--身高-->
											<td>${playersVO.weights}</td>
											<!--體重-->
											<td>${playersVO.birthday}</td>
											<!--生日-->
											<td>${playersVO.nationality}</td>
											<!--國籍-->
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
					$('#table').DataTable();
				});
			</script>
			<script>
				$(document).ready(function () {
					$('#seasonSelect').on('blur', function () {
							$.getJSON('<%=request.getContextPath()%> 
									Groups.do ', {
									'action': 'GET_ALL_GROUPS'
								},
								function (datas) {

									console
										.log(datas);
									$
										.each(
											datas,
											function (
												idx,
												groups) {
												console
													.log(groups.groupName);
												var cell1 = $(
														'<option></option>')
													.text(
														groups.groupName);
												var cell2 = $(
														'<option></option>')
													.value(
														groups.groupID);
											})
									$(
											'#groupsSelect')
										.append(
											[
												cell1,
												cell2
											]);
								})
					})
				})
			</script>

		</body>

		</html>