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
								<div id="btns" class="btns col-md-4">
								</div>
								<div class="col-md-4"></div>
								</div>
<!-- 								<div class="info">index：<span id="index"></span></div> -->
							</div>
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
										<div  align='center' valign='middle'>
										<div class="form-group">
											<label class=" control-label">球員姓名:</label>
											<input type="text" class="form-control" id="playerName" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
											<label class=" control-label">身分證ID:</label>
											<input type="text" class="form-control" id="id" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
										</div>
										<div class="form-group">
											<label class=" control-label">身高(cm):</label>
											<input type="text" class="form-control" id="height" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
											<label class=" control-label">體重(kg):</label>
											<input type="text" class="form-control" id="weights" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
										</div>
										<div class="form-group">
											<label class=" control-label">背號:</label>
											<input type="text" class="form-control" id="playerNo" value="" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
											<label class=" control-label">位置:</label>
											<input type="text" class="form-control" id="playerRole" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
										</div>
										<div class="form-group">
											<label class=" control-label">生日:</label>
											<input type="text" class="form-control" id="birthday" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
											<label class=" control-label">國籍:</label>
											<input type="text" class="form-control" id="nationality" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
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
										<div  align='center' valign='middle'>
										<div class="form-group">
											<label class=" control-label">球員姓名:</label>
											<input type="text" class="form-control" id="playerName" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
											<label class=" control-label">身分證ID:</label>
											<input type="text" class="form-control" id="id" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
										</div>
										<div class="form-group">
											<label class=" control-label">身高(cm):</label>
											<input type="text" class="form-control" id="height" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
											<label class=" control-label">體重(kg):</label>
											<input type="text" class="form-control" id="weights" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
										</div>
										<div class="form-group">
											<label class=" control-label">背號:</label>
											<input type="text" class="form-control" id="playerNo" value="" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
											<label class=" control-label">位置:</label>
											<input type="text" class="form-control" id="playerRole" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
										</div>
										<div class="form-group">
											<label class=" control-label">生日:</label>
											<input type="text" class="form-control" id="birthday" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
											<label class=" control-label">國籍:</label>
											<input type="text" class="form-control" id="nationality" style="width:150px;padding-bottom: 5px;padding-top: 5px;">
										</div>
										</div>
									</div>
									<div id="iubut" class="modal-footer">
										<!--確認按鈕觸發事件-->
										<button type="submit" class="btn btn-warning" data-dismiss="modal" id="insertConfirm">修改</button>
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
						$step.step({
							index: 0,
							time: 500,
							title: [ "建立球隊", "加入球員","分組報名", "繳費"]
						});

						$index.text($step.getIndex());

						loadTable();


						function loadTable() {
							var step = $step.getIndex();
							var bt = $('#buildTeam');
							var btns = $('#btns');
							if (step == 0) {
								
								bt.empty();
								btns.empty();
								
								var cell1 = $('<div class="form-group"><label class="control-label">隊徽:</label><div class="col-md-12"><div class="col-md-4"></div><div class="col-md-4"><input type="file" id="file"></div></div>');
								var cell2 = $('<div class="col-md-12"><div class="col-md-4"></div><div class="col-md-4"><img id="result" class = "teamBadge" src="<%=request.getContextPath()%>/images/no_img.png"></div></div>');
								var cell3 = $('<div class="form-group col-md-4"><label class="control-label">球隊名稱:</label><div><input type="text"class="form-control" id="teamName"></div></div>'
								);
								var cell4 = $(
									'<div class="form-group col-md-4"><label class="control-label">隊長連絡電話:</label><div><input type="text"class="form-control" id="captainPhone"></div></div>'
								);
								var cell5 = $(
										'<div class="form-group col-md-4"><label class="control-label">隊長Email:</label><div><input type="text"class="form-control" id="captainEmail"></div></div>'
									);
								var cell6 = $(
									'<div class="form-group col-md-4"><label class="control-label">總教練:</label><div><input type="text" class="form-control" id="coachName"></div></div>'
								);
								var cell7 = $(
									'<div class="form-group col-md-4"><label class="control-label">老闆:</label><div><input type="text"class="form-control" id="bossName"></div></div>'
								);
								var cell8 = $(
									'<div class="form-group col-md-4"><label class="control-label">備註:</label><div><input type="text" class="form-control" id="remarks"></div></div>'
								);
								var cell9=$('<div class="col-md-4"></div>');
								var cell10=$('<div class="col-md-4"></div><button id="nextBtn">下一步</button>')
								
			
								bt.append([cell1, cell2, cell3, cell4, cell5, cell6, cell7,cell8]);
								btns.append([cell10]);
								file();
								$("#nextBtn").on("click", function () {
// 									var teamBadge = $('#result').attr('src');
// 									var teamName = $('#teamName').val();
// 									var captainPhone = $('#captainPhone').val();
// 									var captainEmail = $('#captainEmail').val();
// 									var coachName = $('#coachName').val();
// 									var bossName = $('#bossName').val();
// 									var remarks = $('#remarks').val();
									$step.nextStep();
									$index.text($step.getIndex());
									loadTable();
									file();
									
									
<%-- 									$.post('<%=request.getContextPath()%>/Teams.do', {'action':'buildMyTeam','teamBadge':teamBadge,'teamName':teamName, 'captainPhone':captainPhone, 'captainEmail':captainEmail,'coachName':coachName, 'bossName':bossName,'remarks':remarks}, function(datas){ --%>
// 			  		 	       	  }) 
								});
							}
							if (step == 1) {
								bt.empty();
								btns.empty();
								var docFrag = $(document.createDocumentFragment());
								var tab = $('<table class="table table-bordered" id="playerTable"></table>');
								var th = $('<thead></thead>');
								var cell1 = $('<button class="btn btn-warning" id="insert" data-toggle="modal" data-target="#myModal">新增球員</button>');
								var cell2 = $('<th></th>').text("球員照片");
								var cell3 = $('<th></th>').text("球員姓名");
								var cell4 = $('<th></th>').text("身分證ID");
								var cell5 = $('<th></th>').text("背號");
								var cell6 = $('<th></th>').text("位置");
								var cell7 = $('<th></th>').text("身高");
								var cell8 = $('<th></th>').text("體重");
								var cell9 = $('<th></th>').text("生日");
								var cell10 = $('<th></th>').text("國籍");
								var cell11=$('<div class="col-md-4"><button id="prevBtn"><nobr>上一步</nobr></button></div>')
								var cell12=$('<div class="col-md-4"></div>');
								var cell13=$('<div class="col-md-4"><button id="nextBtn"><nobr>下一步</nobr></button></div>')
								var row = $('<tr align="center" valign="middle"></tr>').append([cell2, cell3, cell4, cell5, cell6, cell7, cell8,
									cell9, cell10
								]);
								docFrag.append(row);
								th.append(docFrag);
								tab.append(th);
								bt.append([cell1, tab]);
								btns.append([cell11,cell12,cell13]);
								var tb = $('<tbody></tbody>');
								$.getJSON('<%=request.getContextPath()%>/Teams.do', {
									'action': 'findMyTeamPlayer'
								} ,function (data) {
									$.each(data, function (index, player) {
										var cell1 = $('<td></td>').html('<img style = "width:50px" src="data:image/png;base64,' + player.photo + '">')
										var cell2 = $('<td></td>').text(player.playerName);
										var cell3 = $('<td></td>').text(player.id);
										var cell4 = $('<td></td>').text(player.playerNo);
										var cell5 = $('<td></td>').text(player.playerRole);
										var cell6 = $('<td></td>').text(player.height);
										var cell7 = $('<td></td>').text(player.weights);
										var cell8 = $('<td></td>')
										var cell9 = $('<td></td>').text(player.nationality);
										var cell10 = $('<td></td>').html($(
											'<button id="update" type="submit"class="btn btn-info" data-toggle="modal" data-target="#myModal1">修改</button>'
										));
										var cell11 = $('<td></td>').html($('<button type="submit"class="btn btn-danger">刪除</button>'));
										var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6,
											cell7,cell8,cell9,cell10,cell11
										]);
										docFrag.append(row);
										tb.append(docFrag);

									})
									tab.append(tb);
								
								});
								prevBtn();
								nextBtn();
									$("#insertConfirm").on("click", function () {
										var docFrag = $(document.createDocumentFragment());
										var tb = $('<tbody></tbody>');
										var photo = $("#result").attr('src');
										var playerName = $("#playerName").val();
										var id = $("#id").val();
										var playerNo = $("#playerNo").val();
										var playerRole = $("#playerRole").val();
										var height = $("#height").val();
										var weights = $("#weights").val();
										var birthday = $("#birthday").val();
										var nationality = $("#nationality").val();
										$.post('<%=request.getContextPath()%>/Players.do', {'action':'buildPlayer','photo':photo,'playerName':playerName, 'id':id, 'playerNo':playerNo,'playerRole':playerRole, 'height':height,'weights':weights,'birthday':birthday,'nationality':nationality}, function(datas){
					  		 	       	  }) 
										var cell2 = $('<td></td>').html('<img style = "width:50px" src="' + photo + '">');
										var cell3 = $('<td></td>').text(playerName);
										var cell4 = $('<td></td>').text(id);
										var cell5 = $('<td></td>').text(playerNo);
										var cell6 = $('<td></td>').text(playerRole);
										var cell7 = $('<td></td>').text(height);
										var cell8 = $('<td></td>').text(weights);
										var cell9 = $('<td></td>').text(birthday);
										var cell10 = $('<td></td>').text(nationality);
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
								btns.empty();
								var docFrag = $(document.createDocumentFragment());
								var tabGroup = $('<table class="table table-bordered" id="groupTable"></table>');
								var th1 = $('<thead></thead>');
								var tb1 = $('<tbody></tbody>');
								var cell1 = $('<th></th>').text("分組名稱");
								var cell2 = $('<th></th>').text("參賽球隊上限");
								var cell3 = $('<th></th>').text("參賽球隊下限");
								var cell4 = $('<th></th>').text("目前球隊數量");
								var cell5 = $('<th></th>').text("球隊球員上限");
								var cell6 = $('<th></th>').text("球隊球員下限");
								var cell7 = $('<th></th>').text("報名狀況");
								var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7
								]);
								docFrag.append(row);
								th1.append(docFrag);
								tabGroup.append(th1);
								bt.append([tabGroup]);
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
											cell7
										]);
										docFrag.append(row);
										tb1.append(docFrag);

									})
									tabGroup.append(tb1);
								
								});
								var tab = $('<table class="table table-bordered" id="playerTable"></table>');
								var th = $('<thead></thead>');
								var cell1 = $('<th></th>').text("球員照片");
								var cell2 = $('<th></th>').text("球員姓名");
								var cell3 = $('<th></th>').text("身分證ID");
								var cell4 = $('<th></th>').text("背號");
								var cell5 = $('<th></th>').text("位置");
								var cell6 = $('<th></th>').text("身高");
								var cell7 = $('<th></th>').text("體重");
								var cell8 = $('<th></th>').text("國籍");
								var cell9 = $('<th></th>')
								
								var row = $('<tr align="center" valign="middle"></tr>').append([cell1,cell2, cell3, cell4, cell5, cell6, cell7, cell8,
									cell9
								]);
								docFrag.append(row);
								th.append(docFrag);
								tab.append(th);
								bt.append([tab]);
								var tb = $('<tbody></tbody>');
								$.getJSON('<%=request.getContextPath()%>/Teams.do', {
									'action': 'findMyTeamPlayer'
								} ,function (data) {
									$.each(data, function (index, player) {
										var cell1 = $('<td></td>').html('<img style = "width:50px" src="data:image/png;base64,' + player.photo + '">')
										var cell2 = $('<td></td>').text(player.playerName);
										var cell3 = $('<td></td>').text(player.id);
										var cell4 = $('<td></td>').text(player.playerNo);
										var cell5 = $('<td></td>').text(player.playerRole);
										var cell6 = $('<td></td>').text(player.height);
										var cell7 = $('<td></td>').text(player.weights);
										var cell8 = $('<td></td>').text(player.nationality);
										var cell9 = $('<td></td>').html('<input type="checkbox">');
										var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6,
											cell7,cell8,cell9
										]);
										docFrag.append(row);
										tb.append(docFrag);

									})
									tab.append(tb);
								
								});
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
						function prevBtn() {
						$("#prevBtn").on("click", function () {
							$step.prevStep();
							$index.text($step.getIndex());
							loadTable();
							file();

						});
						}
						
						function nextBtn() {
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