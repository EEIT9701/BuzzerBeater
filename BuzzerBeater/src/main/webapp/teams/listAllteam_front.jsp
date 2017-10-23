<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<title>EEIT97-第一組</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
			<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
			<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
			<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
		</head>

		<body>

			<jsp:include page="/header.jsp" />
			<jsp:useBean id="playerSvc" scope="page" class="eeit.players.model.PlayerService" />
			<!--主文(開始)-->
			<div class="container">
				<div class="jumbotron">
					<form class="form-inline" method="post" action="<%=request.getContextPath() %>/Players.do">
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
						<input type="hidden" name="action" value="getOne_For_Display">
					</form>
					<!--表格(開始)-->
					<!--****************-->
					<!-- 第一列(開始) -->
					<!--****************-->
					<div class="row">

						<div class="col-md-12">

							<table class="table table-bordered">
								<thead>
									<tr>
										<th>隊徽</th>
										<th>隊名</th>
										<th>分組</th>
										<th>教練</th>
										<th>老闆</th>
										<th>勝場數</th>
										<th>敗場數</th>
										<th>勝率</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="playersVO" items="${playerSvc.allPlayer}">
										<tr align='center' valign='middle'>
											<td></td>
											<!--隊徽-->
											<td></td>
											<!--球名-->
											<td></td>
											<!--分組-->
											<td></td>
											<!--教練-->
											<td></td>
											<!--老闆-->
											<td></td>
											<!--勝場數-->
											<td></td>
											<!--敗場數-->
											<td></td>
											<!--勝率-->
										</tr>



									</c:forEach>
							</table>
							<!--</div>-->
						</div>
					</div>

				</div>
			</div>
			<!--主文(結束)-->

			<jsp:include page="/footer.jsp" />
		

		</body>

		</html>