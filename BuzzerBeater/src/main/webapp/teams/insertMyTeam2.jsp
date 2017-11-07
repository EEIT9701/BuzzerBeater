<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ page import="java.util.*"%>
			<%@ page import="eeit.teams.model.*"%>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>Insert title here</title>
					<meta name="viewport" content="width=device-width, initial-scale=1">
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
					<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
					<link rel="stylesheet" href="<%=request.getContextPath()%>/css/iEdit.css">
					<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.step.css" />
					<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
					<script src="<%=request.getContextPath()%>/js/iEdit.js"></script>
					<script src="<%=request.getContextPath()%>/js/jquery.step.min.js"></script>
					<jsp:include page="/header_css.jsp" />

					<style>
						button {
							display: inline-block;
							padding: 6px 12px;
							font-size: 14px;
							line-height: 1.42857143;
							text-align: center;
							cursor: pointer;
							border: 1px solid transparent;
							border-radius: 4px;
							color: #fff;
							background-color: #5bc0de;
						}

						.main {
							width: 1000px;
							margin: 100px auto;
						}

						#step {
							margin-bottom: 60px;
							font-size: 28px;
						}

						.btns {
							float: left;
						}

						.info {
							float: left;
							height: 34px;
							line-height: 34px;
							margin-left: 40px;
							font-size: 28px;
							font-weight: bold;
							color: #928787;
						}

						.info span {
							color: red;
						}

						.teamBadge {
							width: 300px;
							height: 220px;
							margin: auto;
						}

						.photo {
							width: 150px;
							height: 200px;
							margin: auto;
						}
					</style>

				</head>

				<body>

					<jsp:include page="/header.jsp" />


					<!--主文(開始)-->

					<div class="container">
						<div class="jumbotron">
							<div class="main">
								<div id="step"></div>
								<div id="buildTeam"></div>
								<div class="col-md-12">
									<div class="col-md-4"></div>
									<div class="col-md-4">
										<div id="btns" class="btns"></div>
										<div class="col-md-4"></div>
									</div>
								</div>
								<div class="info">index：<span id="index"></span></div>
							</div>
							<div class="col-md-4"></div>
							<jsp:include page="/footer.jsp" />
						</div>
					</div>
					<!-- 模態框 -->
					<div class="row">
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" style="margin-right:-20px" aria-hidden="true" id="x">&times;</button>
										<h4 class="modal-title" id="myModalLabel" style="text-align:'center'">球員資料</h4>
									</div>
									<div class="modal-body">
										<!-- Text input-->
										<div class="form-group">
											<label class="control-label">球員照片:</label>
											<input type="file" id="file">
											<div class="">
												<img id="result" class="photo" src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png">
												<br>
											</div>
										</div>
										<!-- Text input-->
										<div class="form-group">
											<label class=" control-label">球員姓名:</label>
											<div class="">
												<input type="text" class="form-control" id="playerName">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">身分證ID:</label>
											<div class="">
												<input type="text" class="form-control" id="id">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">背號:</label>
											<div class="">
												<input type="text" class="form-control" id="playerNo" value="">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">位置:</label>
											<div class="">
												<input type="text" class="form-control" id="playerRole">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">身高(cm):</label>
											<div class="">
												<input type="text" class="form-control" id="height">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">體重(kg):</label>
											<div class="">
												<input type="text" class="form-control" id="weights">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">生日:</label>
											<div class="">
												<input type="text" class="form-control" id="birthday">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">國籍:</label>
											<div class="">
												<input type="text" class="form-control" id="nationality">
											</div>
										</div>
									</div>
									<div id="iubut" class="modal-footer">
										<!--確認按鈕觸發事件-->
										<button type="submit" class="btn btn-warning" data-dismiss="modal" id="insertConfirm">新增</button>
										<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 模態框 -->
					<div class="row">
						<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" style="margin-right:-20px" aria-hidden="true" id="x">&times;</button>
										<h4 class="modal-title" id="myModalLabel" style="text-align:'center'">球員資料</h4>
									</div>
									<div class="modal-body">
										<!-- Text input-->
										<div class="form-group">
											<label class="control-label">球員照片:</label>
											<input type="file" id="file">
											<div class="">
												<img id="result" class="photo" src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png">
												<br>
											</div>
										</div>
										<!-- Text input-->
										<div class="form-group">
											<label class=" control-label">球員姓名:</label>
											<div class="">
												<input type="text" class="form-control" id="playerName">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">身分證ID:</label>
											<div class="">
												<input type="text" class="form-control" id="id">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">背號:</label>
											<div class="">
												<input type="text" class="form-control" id="playerNo" value="">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">位置:</label>
											<div class="">
												<input type="text" class="form-control" id="playerRole">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">身高(cm):</label>
											<div class="">
												<input type="text" class="form-control" id="height">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">體重(kg):</label>
											<div class="">
												<input type="text" class="form-control" id="weights">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">生日:</label>
											<div class="">
												<input type="text" class="form-control" id="birthday">
											</div>
										</div>
										<div class="form-group">
											<label class=" control-label">國籍:</label>
											<div class="">
												<input type="text" class="form-control" id="nationality">
											</div>
										</div>
									</div>
									<div id="iubut" class="modal-footer">
										<!--確認按鈕觸發事件-->
										<button type="submit" class="btn btn-warning" data-dismiss="modal" id="updateConfirm">修改</button>
										<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!--主文(結束)-->
					<script type="text/javascript">
						var $step = $("#step");
						var $index = $("#index");
						var tab = null;
						$step.step({
							index: 0,
							time: 500,
							title: [ "建立球隊", "加入球員","分組報名", "繳費"]
						});

						$index.text($step.getIndex());

						loadTable();


						function loadTable() {
							var step = $step.getIndex();
							var bt = $('#buildTeam');;
							
							if (step == 0) {
								bt.empty();
								if (($('#btns').text()) == "") {
									btn();
								}

								var cell1 = $('<div class="form-group"><label class="control-label">隊徽:</label> <input type="file" id="file"></div>');
								var cell2 = $('<img id="result" class = "teamBadge" src="<%=request.getContextPath()%>/images/700_700.png">');
								var cell3 = $('<div class="form-group"><label class="control-label">球隊名稱:</label><div><input type="text" name="captainEmail" class="form-control" id="exampleInputEmail1"></div></div>'
								);
								var cell4 = $(
									'<div class="form-group"><label class="control-label">隊長連絡電話:</label><div><input type="text" name="captainEmail" class="form-control" id="exampleInputEmail1"></div></div>'
								);
								var cell5 = $(
									'<div class="form-group"><label class="control-label">總教練:</label><div><input type="text" name="captainEmail" class="form-control" id="exampleInputEmail1"></div></div>'
								);
								var cell6 = $(
									'<div class="form-group"><label class="control-label">老闆:</label><div><input type="text" name="captainEmail" class="form-control" id="exampleInputEmail1"></div></div>'
								);
								var cell7 = $(
									'<div class="form-group"><label class="control-label">備註:</label><div><input type="textarea" name="captainEmail" class="form-control" id="exampleInputEmail1"></div></div>'
								);
								bt.append([cell1, cell2, cell3, cell4, cell5, cell6, cell7]);
							}
							if (step == 1) {
								bt.empty();
								var docFrag = $(document.createDocumentFragment());
								tab = $('<table class="table table-bordered" id="playerTable"></table>');
								var th = $('<thead></thead>');
								var cell1 = $(
									'<button class="btn btn-warning" id="insert" data-toggle="modal" data-target="#myModal">新增球員</button>');
								var cell2 = $('<th></th>').text("球員照片");
								var cell3 = $('<th></th>').text("球員姓名");
								var cell4 = $('<th></th>').text("身分證ID");
								var cell5 = $('<th></th>').text("背號");
								var cell6 = $('<th></th>').text("位置");
								var cell7 = $('<th></th>').text("身高");
								var cell8 = $('<th></th>').text("體重");
								var cell9 = $('<th></th>').text("生日");
								var cell10 = $('<th></th>').text("國籍");
								var cell11 = $('<th></th>');
								var cell12 = $('<th></th>');
								var row = $('<tr align="center" valign="middle"></tr>').append([cell2, cell3, cell4, cell5, cell6, cell7, cell8,
									cell9, cell10, cell11, cell12
								]);
								docFrag.append(row);
								th.append(docFrag);
								tab.append(th);
								bt.append([cell1, tab]);
									$("#insertConfirm").on("click", function () {

										var docFrag = $(document.createDocumentFragment());
										var tb = $('<tbody></tbody>');
										var pic = $("#result").attr('src');
										var cell2 = $('<td></td>').html('<img style = "width:50px" src="' + pic + '">');
										var cell3 = $('<td></td>').text($("#playerName").val());
										var cell4 = $('<td></td>').text($("#id").val());
										var cell5 = $('<td></td>').text($("#playerNo").val());
										var cell6 = $('<td></td>').text($("#playerRole").val());
										var cell7 = $('<td></td>').text($("#height").val());
										var cell8 = $('<td></td>').text($("#weights").val());
										var cell9 = $('<td></td>').text($("#birthday").val());
										var cell10 = $('<td></td>').text($("#nationality").val());
										var cell11 = $('<td></td>').html($(
											'<button id="update" type="submit"class="btn btn-info" data-toggle="modal" data-target="#myModal1">修改</button>'
										));
										
										var cell12 = $('<td></td>').html($('<button type="submit"class="btn btn-danger">刪除</button>'));
										var row = $('<tr align="center" valign="middle"></tr>').append([cell2, cell3, cell4, cell5, cell6, cell7,
											cell8, cell9, cell10, cell11, cell12
										]);
										docFrag.append(row);
										tb.append(docFrag);
										$("#playerTable").append(tb);
										var update = $(this).parents('tr');
										$("#update").on("click", function () {
										$("#playerName").val(update.find('td:nth-child(2)').text());
										$("#id").val(update.find('td:nth-child(3)').text());
										$("#playerNo").val(update.find('td:nth-child(4)').text());
										$("#playerRole").val(update.find('td:nth-child(5)').text());
										$("#height").val(update.find('td:nth-child(6)').text());
										$("#weights").val(update.find('td:nth-child(7)').text());
										$("#birthday").val(update.find('td:nth-child(8)').text());
										$("#nationality").val(update.find('td:nth-child(9)').text());
									});
										$("#file").val('');
										$("#result").attr('src', '<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png');
										$("#playerName").val('');
										$("#id").val('');
										$("#playerNo").val('');
										$("#playerRole").val('');
										$("#height").val('');
										$("#weights").val('');
										$("#birthday").val('');
										$("#nationality").val('');
									});
									

							}if (step == 2) {
								bt.empty();
								$('#btns').empty()
								var docFrag = $(document.createDocumentFragment());
								var tab = $('<table class="table table-bordered" id="groupTable"></table>');
								var th = $('<thead></thead>');
								var tb = $('<tbody></tbody>');
								var cell1 = $('<th></th>').text("分組名稱");
								var cell2 = $('<th></th>').text("參賽球隊上限");
								var cell3 = $('<th></th>').text("參賽球隊下限");
								var cell4 = $('<th></th>').text("目前球隊數量");
								var cell5 = $('<th></th>').text("球隊球員上限");
								var cell6 = $('<th></th>').text("球隊球員下限");
								var cell7 = $('<th></th>').text("報名狀況");
								var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7,
									cell8
								]);
								docFrag.append(row);
								th.append(docFrag);
								tab.append(th);
								bt.append([tab]);
								$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {
									'action': 'findGroupNameBySeasonID',
									'seasonID': 1003
								}, function (data) {
									$.each(data, function (index, group) {
										var cell1 = $('<td></td>').text(group.groupName);
										var cell2 = $('<td></td>').text(group.maxTeams);
										var cell3 = $('<td></td>').text(group.minTeams);
										var cell4 = $('<td></td>').text(group.currentTeams);
										var cell5 = $('<td></td>').text(group.maxPlayers);
										var cell6 = $('<td></td>').text(group.minPlayers);
										var cell7 = null;
										if (group.currentTeams >= group.maxTeams) {
											var cell7 = $('<td></td>').text("已達報名上限");
										}
										if (group.currentTeams < group.maxTeams) {
											var cell7 = $('<td></td>').html('<button id="nextBtn" class="btn btn-warning">我要報名</button>')
										}
										var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6,
											cell7, cell8
										]);
										docFrag.append(row);
										tb.append(docFrag);

									})
									tab.append(tb);

									$("#nextBtn").on("click", function () {
										console.log("點擊觸發")
										$step.nextStep();
										$index.text($step.getIndex());
										loadTable();
										file();
									});
								})
							}
						}



						function file() {
							$("#file").change(function (e) {

								var img = e.target.files[0];

								if (!img.type.match('image.*')) {
									alert("Whoops! That is not an image.");
									return;
								}
								iEdit.open(img, true, function (res) {
									$("#result").attr("src", res);
									$("#photo").attr("value", res);
								});

							});
						}

						function btn() {
							var cell1 = $('<div class="col-md-4"><button id="prevBtn"><nobr>上一步</nobr></button></div>');
							var cell2 = $('<div class="col-md-4"></div>');
							var cell3 = $('<div class="col-md-4"><button id="nextBtn"><nobr>下一步</nobr></button></div>');
							$('#btns').append([cell1, cell2, cell3]);
							$("#prevBtn").on("click", function () {
								$step.prevStep();
								$index.text($step.getIndex());
								loadTable();
								file();

							});

							$("#nextBtn").on("click", function () {
								$step.nextStep();
								$index.text($step.getIndex());
								loadTable();
								file();
							});

							

						}
					</script>

					<jsp:include page="/footer_css.jsp" />


				</body>

				</html>