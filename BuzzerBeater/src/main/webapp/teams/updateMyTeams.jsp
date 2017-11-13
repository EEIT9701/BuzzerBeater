<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh" class="no-js">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />

<title>Season</title>
<jsp:include page="/header_css.jsp" />
<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
<style>
#result {
	width: 300px;
	height: 220px;
	margin: auto;
}
#photo {
	width: 100px;
	margin: auto;
}
.img {
	position: relative;
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	width: 200px;
	height: 200px;
	background-color: #353535;
	float: left;
	padding: 0;
	margin: 10px;
	border-radius: 3px;
}
</style>
<script>
	$(function() {
		function format_float(num, pos) {
			var size = Math.pow(10, pos);
			return Math.round(num * size) / size;
		}

		function preview(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('.preview').attr('src', e.target.result);
					var KB = format_float(e.total / 1024, 2);
					$('.size').text("檔案大小：" + KB + " KB");
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("body").on("change", ".upl", function() {
			preview(this);
		})
	})
</script>
</head>

<body>
	<jsp:include page="/header.jsp" />

	<div class="container">
		<div class="jumbotron">
			<!-- 網頁內容 -->
			
				<fieldset>
					<!-- Form Name -->
					<legend>編輯我的球隊</legend>
					<input type="hidden" name="teamID" value="${teamsVO.teamID}"> <input
						type="hidden" name="totalWin" value="${teamsVO.totalWin}"> <input
						type="hidden" name="totalLose" value="${teamsVO.totalLose}"> <input
						type="hidden" name="winRate" value="${teamsVO.winRate}">


					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">隊徽:</label> <input
							type="file" id="file">
						<div class="col-md-4">
							<img id="result" src="data:image/jpeg;base64,${teamsVO.teamBadge}"><br>
							<input type="hidden" id="photo" name="teamBadge"
								value="data:image/jpeg;base64,${teamsVO.teamBadge}">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">球隊名稱:</label>
						<div class="col-md-4">
							<input type="text" name="teamName" class="form-control"
								id="exampleInputEmail1" value="${teamsVO.teamName}">
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">隊長Email:</label>
						<div class="col-md-4">
							<input type="text" name="captainEmail" class="form-control"
								id="exampleInputEmail1" value="${teamsVO.captainEmail}">
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">隊長連絡電話:</label>
						<div class="col-md-4">
							<input type="text" name="captainPhone" class="form-control"
								id="exampleInputEmail1" value="${teamsVO.captainPhone}">
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">總教練:</label>
						<div class="col-md-4">
							<input type="text" name="coachName" class="form-control"
								id="exampleInputEmail1" value="${teamsVO.coachName}">
						</div>
					</div>
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">老闆:</label>
						<div class="col-md-4">
							<input type="text" name="bossName" class="form-control"
								id="exampleInputEmail1" value="${teamsVO.bossName}">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">備註:</label>
						<div class="col-md-4">
							<input type="text" name="remarks" class="form-control"
								id="exampleInputEmail1" value="${teamsVO.remarks}">
						</div>
					</div>

					<div class="row">
						<!--第一列-左邊表格-格式_.col-md-8-->
						<div class="col-md-12">
							<div class="col-md-12">
								<c:forEach var="teamCompositionVO"
									items="${teamsVO.teamCompositionSet}">
									<table class="table table-bordered respond">
										<thead>
											<tr align='center' valign='middle'>
												<th>背號</th>
												<th>球員照片</th>
												<th>球員姓名</th>
												<th>身分證ID</th>
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
											<tr align='center' valign='middle'>
												<td>${teamCompositionVO.playerNo}</td>
												<td><img id="photo"
													src="data:image/jpeg;base64,${teamCompositionVO.playersVO.photo}"></td>
												<td>${teamCompositionVO.playersVO.playerName}</td>
												<td>${teamCompositionVO.playersVO.id}</td>
												<td>${teamCompositionVO.playerRole}</td>
												<td>${teamCompositionVO.playersVO.height}</td>
												<td>${teamCompositionVO.playersVO.weights}</td>
												<td>${teamCompositionVO.playersVO.birthday}</td>
												<td>${teamCompositionVO.playersVO.nationality}</td>

												<td>
												<Form method="post"action="<%=request.getContextPath()%>/Players.do">
												<button type="submit" class="btn btn-info">修改</button>
												<input type="hidden" name="action" value="updateMyPlayer">
												<input type="hidden" name="photo" value="${teamCompositionVO.playersVO.photo}">
												<input type="hidden" name="playerID"
													value="${playersVO.playerID}"> <input type="hidden"
													name="playerName" value="${teamCompositionVO.playersVO.playerName}">
												<input type="hidden" name="id" value="${teamCompositionVO.playersVO.id}">
												<input type="hidden" name="height"
													value="${teamCompositionVO.playersVO.height}"> <input type="hidden"
													name="weights" value="${teamCompositionVO.playersVO.weights}"> <input
													type="hidden" name="birthday" value="${teamCompositionVO.playersVO.birthday}">
												<input type="hidden" name="nationality"
													value="${teamCompositionVO.playersVO.nationality}">
											</Form>
												</td>
												<td>
											<Form method="post"action="<%=request.getContextPath()%>/Players.do">
												<button type="submit" class="btn btn-danger">刪除</button>
												<input type="hidden" name="playerID" value="${teamCompositionVO.playersVO.playerID}"> 
													<input type="hidden" name="action" value="delete">
											</Form>
												</td>
											</tr>

										</tbody>
									</table>
								</c:forEach>

							</div>
						</div>
					</div>

					<!-- Button -->
					<form class="form-horizontal">
					<div class="form-group">
						<label class="col-md-4 control-label" for="send"></label>
						<div class="col-md-4">
							<button id="send" name="send" class="btn btn-primary">送出</button>
						</div>
					</div>
					</form>

				</fieldset>
		

			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
		</div>
	</div>
	<!-- End of container -->


	<jsp:include page="/footer_css.jsp" />
</body>

</html>