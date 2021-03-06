<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>BuzzerBeater-球員管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
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
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<Form method="post"
						action="<%=request.getContextPath()%>/Players.do">
						<button type="submit" class="btn btn-warning">新增球員</button>
						<input type="hidden" name="action" value="insertMyPlayer">
					</Form>
				</div>
				<div class="col-md-4"></div>
			</div>
			<div class="col-md-4"></div>
			<!--表格(開始)-->
			<!--****************-->
			<!-- 第一列(開始) -->
			<!--****************-->
			<div class="row">
				<!--第一列-左邊表格-格式_.col-md-8-->
				<div class="col-md-12">
					<div class="col-md-12">
						<table class="table table-bordered" id="table">
							<thead>
								<tr>
									<th>球員照片</th>
									<th>球員姓名</th>
									<th>身分證ID</th>
									<th>背號</th>
									<th>位置</th>
									<th>身高</th>
									<th>體重</th>
									<th>生日</th>
									<th>國籍</th>
									<th></th>
									<th></th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="teamCompositionVO"
									items="${teamsVO.teamCompositionSet}">
									<tr align='center' valign='middle'>
										<td><img id="img1"
											src="data:image/jpeg;base64,${teamCompositionVO.playersVO.photo}"></td>
										<td>${teamCompositionVO.playersVO.playerName}</td>
										<td>${teamCompositionVO.playersVO.id}</td>
										<td>${teamCompositionVO.playerNo}</td>
										<td>${teamCompositionVO.playerRole}</td>
										<td>${teamCompositionVO.playersVO.height}</td>
										<td>${teamCompositionVO.playersVO.weights}</td>
										<td>${teamCompositionVO.playersVO.birthday}</td>
										<td>${teamCompositionVO.playersVO.nationality}</td>
										<td>
											<Form method="post"
												action="<%=request.getContextPath()%>/Players.do">
												<button type="submit" class="btn btn-info">修改</button>
												<input type="hidden" name="action" value="updatePlayer">
												<input type="hidden" name="photo"
													value="${teamCompositionVO.playersVO.photo}"> <input
													type="hidden" name="playerName"
													value="${teamCompositionVO.playersVO.playerName}">
												<input type="hidden" name="id"
													value="${teamCompositionVO.playersVO.id}"> <input
													type="hidden" name="height"
													value="${teamCompositionVO.playersVO.height}"> <input
													type="hidden" name="weights"
													value="${teamCompositionVO.playersVO.weights}"> <input
													type="hidden" name="birthday"
													value="${teamCompositionVO.playersVO.birthday}"> <input
													type="hidden" name="nationality"
													value="${teamCompositionVO.playersVO.nationality}">
											</Form>
										</td>
										<td>
											<Form method="post"
												action="<%=request.getContextPath()%>/Players.do">
												<button type="submit" class="btn btn-danger">刪除</button>
												<input type="hidden" name="playerID"
													value="${playersVO.playerID}"> <input type="hidden"
													name="action" value="delete">
											</Form>
										</td>
									</tr>



								</c:forEach>
						</table>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<!-- Button -->
							<div class="col-md-4">
								<form action="<%=request.getContextPath()%>/Teams.do">
									<button type="submit" class="btn btn-warning">上一步</button>
									<input type="hidden" name="action" value="insertMyTeam">

								</form>
							</div>
							</Form>
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<form action="<%=request.getContextPath()%>/Players.do">
									<button type="submit" class="btn btn-warning">下一步</button>
									<input type="hidden" name="action"
										value="goTolistAllPlayer_back">

								</form>
							</div>
						</div>
						<div class="col-md-4"></div>
					</div>
				</div>
			</div>

			<jsp:include page="/footer.jsp" />

		</div>
	</div>
	<!--主文(結束)-->

	<jsp:include page="/footer_css.jsp" />

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#table').DataTable();
		});
	</script>


</body>

</html>