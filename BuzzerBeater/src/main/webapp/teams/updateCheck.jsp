<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<title>EEIT97-第一組</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<jsp:include page="/header_css.jsp" />
			<style>
				#img1 {
					width: 40px;
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

					<!--表格(開始)-->
					<!--****************-->
					<!-- 第一列(開始) -->
					<!--****************-->
					<div class="row">
						<!--第一列-左邊表格-格式_.col-md-8-->
						<legend>修改確認</legend>
						<div class="col-md-12">

							<table class="table table-bordered">
								<thead>
									<tr>
										<th>隊徽</th>
										<th>隊名</th>
										<th>分組</th>
										<th>隊長E-mail</th>
										<th>隊長電話</th>
										<th>教練</th>
										<th>老闆</th>
										<th>勝場數</th>
										<th>敗場數</th>
										<th>勝率</th>
										<th>備註</th>
									</tr>
								</thead>
								<tbody>
									<tr align='center' valign='middle'>

										<td><img id="img1" src="data:image/png;base64,${teamBadge}"></td>
										<!--隊徽-->
										<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${teamID}">${teamName}</a></td>
										<!--球名-->
										<td></td>
										<!--分組-->
										<td>${captainEmail}</td>
										<!--隊長E-mail-->
										<td>${captainPhone}</td>
										<!--隊長電話-->
										<td>${coachName}</td>
										<!--教練-->
										<td>${bossName}</td>
										<!--老闆-->
										<td>${totalWin}</td>
										<!--勝場數-->
										<td>${totalLose}</td>
										<!--敗場數-->
										<td>${winRate}</td>
										<!--勝率-->
										<td>${remarks}</td>
										<!--備註-->
							</table>
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<form method="post" action="<%=request.getContextPath() %>/Teams.do">
									<div class="form-group">
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary">確認修改</button>
											<input type="hidden" name="action" value="goTolistAllTeam_update">
											<input type="hidden" name="teamID" value="${teamID}">
											<input type="hidden" name="teamBadge" value="${teamBadge}">
											<input type="hidden" name="teamName" value="${teamName}">
											<input type="hidden" name="captainEmail" value="${captainEmail}">
											<input type="hidden" name="captainPhone" value="${captainPhone}">
											<input type="hidden" name="coachName" value="${coachName}">
											<input type="hidden" name="bossName" value="${bossName}">
											<input type="hidden" name="totalWin" value="${totalWin}">
											<input type="hidden" name="totalLose" value="${totalLose}">
											<input type="hidden" name="winRate" value="${winRate}">
											<input type="hidden" name="remarks" value="${remarks}">
										</div>
									</div>
									<!-- <button type="submit" class="btn btn-warning">確認修改</button>
								<input type="hidden" name="action" value="goTolistAllPlayer_back"> -->
									<!--                             <input type="hidden" name="action" value="getOne_For_Display"> -->
									<%--                             <input type="hidden" name="playerName" value="${playersIfo.playerName}"> --%>

								</form>
								<!-- <button type="submit" class="btn btn-info"><a href="<%=request.getContextPath() %>/players/listAllPlayer_back.jsp">確認修改</a></button> -->
								<div class="col-md-4"></div>

								<Form method="post" action="<%=request.getContextPath() %>/Teams.do">

									<div class="col-md-4">
										<button type="submit" class="btn btn-danger">返回修改</button>
										<input type="hidden" name="action" value="UpdateTeam">
										<input type="hidden" name="teamID" value="${teamID}">
										<input type="hidden" name="teamBadge" value="${teamBadge}">
										<input type="hidden" name="teamName" value="${teamName}">
										<input type="hidden" name="captainEmail" value="${captainEmail}">
										<input type="hidden" name="captainPhone" value="${captainPhone}">
										<input type="hidden" name="coachName" value="${coachName}">
										<input type="hidden" name="bossName" value="${bossName}">
										<input type="hidden" name="totalWin" value="${totalWin}">
										<input type="hidden" name="totalLose" value="${totalLose}">
										<input type="hidden" name="winRate" value="${winRate}">
										<input type="hidden" name="remarks" value="${remarks}">
									</div>

								</Form>

							</div>
							<div class="col-md-4"></div>
						</div>
					</div>

					<jsp:include page="/footer.jsp" />

				</div>
			</div>
			<!--主文(結束)-->

			<jsp:include page="/footer_css.jsp" />
		</body>

		</html>