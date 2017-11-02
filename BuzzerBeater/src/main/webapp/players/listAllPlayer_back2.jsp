<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<title>BuzzerBeater-球員管理</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
			<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
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
			<jsp:useBean id="playerSvc" scope="page" class="eeit.players.model.PlayerService" />
			<!--主文(開始)-->
			<div class="container">
				<div class="jumbotron">
					<form class="form-inline" method="post" action="<%=request.getContextPath()%>/Players.do">
						<div class="form-group">
							<label for="Name">身分證字號:</label> <input type="text" class="form-control" id="Name" name="playerName" placeholder="請輸入球員身分證字號">
						</div>
						<input type="submit" class="btn btn-warning" value="搜尋"> <input type="hidden" name="action" value="getOne_For_Display">
					</form>
					<div class="col-md-4"></div>
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<div class="col-md-4"></div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<Form method="post" action="<%=request.getContextPath()%>/Players.do">
								<button type="submit" class="btn btn-warning">新增球員</button>
								<input type="hidden" name="action" value="insertPlayer"> <input type="hidden" name="photo" value=""> <input type="hidden"
								    name="playerName"> <input type="hidden" name="id">
								<input type="hidden" name="height"> <input type="hidden" name="weights"> <input type="hidden" name="birthday">
								<input type="hidden" name="nationality">
							</Form>
						</div>
					</div>
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
										<c:forEach var="playersVO" items="${playerSvc.allPlayer}">
											<tr align='center' valign='middle'>
												<td><img id="img1" src="data:image/jpeg;base64,${playersVO.photo}"></td>
												<td>${playersVO.playerName}</td>
												<td>${playersVO.id}</td>
												<td></td>
												<td></td>
												<td>${playersVO.height}</td>
												<td>${playersVO.weights}</td>
												<td>${playersVO.birthday}</td>
												<td>${playersVO.nationality}</td>
												<td>
													<Form method="post" action="<%=request.getContextPath()%>/Players.do">
														<button type="button" class="btn btn-info testmodal" data-toggle="myModal1" data-target="dialog-4">修改</button>
														<input type="hidden" name="action" value="updatePlayer">
														<input type="hidden" name="photo" value="${playersVO.photo}">
														<input type="hidden" name="playerID" value="${playersVO.playerID}"> <input type="hidden" name="playerName"
														    value="${playersVO.playerName}">
														<input type="hidden" name="id" value="${playersVO.id}">
														<input type="hidden" name="height" value="${playersVO.height}"> <input type="hidden" name="weights" value="${playersVO.weights}">														<input type="hidden" name="birthday" value="${playersVO.birthday}">
														<input type="hidden" name="nationality" value="${playersVO.nationality}">
													</Form>
												</td>
												<td>
													<Form method="post" action="<%=request.getContextPath()%>/Players.do">
														<button type="submit" class="btn btn-danger">刪除</button>
														<input type="hidden" name="playerID" value="${playersVO.playerID}"> <input type="hidden" name="action" value="delete">
													</Form>
												</td>
											</tr>



										</c:forEach>
								</table>

							</div>
						</div>
					</div>
					<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true" data-backdrop="false">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="x">&times;</button>
									<h4 class="modal-title" id="myModalLabel1" style="text-align: 'center'">球員修改</h4>
								</div>
								<div class="modal-body">
									<Form class="form-horizontal" method="post" action="<%=request.getContextPath() %>/Players.do">
										<fieldset>
											<input type="hidden" name="playerID" value="${playerID}">

											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">球員照片:</label>
												<input type="file" id="file">
												<div class="col-md-4">
													<img id="result" src="data:image/jpeg;base64,${photo}">
													<br>
													<input type="hidden" id="photo" name="photo" value="data:image/jpeg;base64,${photo}">
												</div>
											</div>

											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">球員姓名:</label>
												<div class="col-md-4">
													<input type="text" name="playerName" class="form-control" id="exampleInputEmail1" value="${playerName}">
												</div>
											</div>
											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">身分證ID:</label>
												<div class="col-md-4">
													<input type="text" name="id" class="form-control" id="exampleInputEmail1" value="${id}">
												</div>
											</div>
											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">背號:</label>
												<div class="col-md-4">
													<input type="text" name="playerNo" class="form-control" id="exampleInputEmail1" value="">
												</div>
											</div>
											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">位置:</label>
												<div class="col-md-4">
													<input type="text" name="playerRole" class="form-control" id="exampleInputEmail1" value="">
												</div>
											</div>
											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">身高(cm):</label>
												<div class="col-md-4">
													<input type="text" name="height" class="form-control" id="exampleInputEmail1" value="${height}">
												</div>
											</div>
											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">體重(kg):</label>
												<div class="col-md-4">
													<input type="text" name="weights" class="form-control" id="exampleInputEmail1" value="${weights}">
												</div>
											</div>
											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">生日:</label>
												<div class="col-md-4">
													<input type="text" name="birthday" class="form-control" id="exampleInputEmail1" value="${birthday}">
												</div>
											</div>
											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label">國籍:</label>
												<div class="col-md-4">
													<input type="text" name="nationality" class="form-control" id="exampleInputEmail1" value="${nationality}">
												</div>
											</div>
								</div>
								<div class="modal-footer">
									<div class="col-md-12">
										<div class="col-md-4"></div>
										<div class="col-md-4">
											<!-- Button -->
											<div class="col-md-4">
												<input type="submit" class="btn btn-warning" value="送出">
												<input type="hidden" name="action" value="updateCheck">
											</div>
											</Form>
											<div class="col-md-4"></div>
											<div class="col-md-4">
													<button type="button" class="btn btn-danger" data-dismiss="modal" aria-hidden="true" id="x">取消</button>
												<!-- <form action="<%=request.getContextPath() %>/Players.do">
													<button type="submit" class="btn btn-danger">取消</button>
													<input type="hidden" name="action" value="goTolistAllPlayer_back">
												</form> -->
											</div>
										</div>
										<div class="col-md-4"></div>
									</div>
								</div>
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
				$(function () {
					$(".testmodal").on('click', function () {
						//事件處發顯示模態框
						$('#myModal1').modal('show');

					})
					$(document).ready(function () {
						$('#table').DataTable();
					});
				});
			</script>


		</body>

		</html>