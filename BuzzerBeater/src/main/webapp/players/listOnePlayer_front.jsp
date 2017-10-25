<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="eeit.players.model.*"%>
<%
	Integer playerID = new Integer(request.getParameter("playerID"));
	PlayerService PlayerSvc = new PlayerService();
	PlayersVO playerVO = PlayerSvc.getOnePlayerID(playerID);
	pageContext.setAttribute("playerVO", playerVO);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>EEIT97-第一組</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/header_css.jsp" />
</head>

<body>

	<jsp:include page="/header.jsp" />
	<jsp:useBean id="playerSvc" scope="page"
		class="eeit.players.model.PlayerService" />
	<!--主文(開始)-->
	<div class="container">
		<div class="jumbotron">
			<form class="form-inline" method="post"
				action="<%=request.getContextPath()%>/Players.do">
				<div class="form-group">
					<label for="Name">姓名</label> <input type="text"
						class="form-control" id="Name" name="playerName"
						placeholder="請輸入球員名稱">
				</div>
				<button type="submit" class="btn btn-warning">搜尋</button>
				<input type="hidden" name="action" value="getOne_For_Display">
			</form>
			<!--表格(開始)-->
			<!--****************-->
			<!-- 第一列(開始) -->
			<!--****************-->
			<div class="row">
				<!--第一列-左邊表格-格式_.col-md-8-->
				<div class="col-md-12">

					<table class="table table-bordered">
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
							<c:forEach var="playersVO" items="${playersVO}">
								<tr align='center' valign='middle'>
									<td>${playersVO.photo}</td>
									
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

									<td><img src="${playersPhoto}"></td>
									<td>
										<Form method="post"
											action="<%=request.getContextPath()%>/Players.do">
											<button type="submit" class="btn btn-info">修改</button>
											<input type="hidden" name="playerName"
												value="${playersVO.playerName}"> <input
												type="hidden" name="action" value="getOne_For_Update">
										</Form>
									</td>
									<td>
										<Form method="post"
											action="<%=request.getContextPath()%>/Players.do">
											<button type="submit" class="btn btn-danger">刪除</button>
											<input type="hidden" name="playerID"
												value="${playerVO.playerID}"> <input type="hidden"
												name="action" value="delete">
										</Form>
									</td>
								</tr>
							</c:forEach>
					</table>
					<!--</div>-->
				</div>
			</div>

			<jsp:include page="/footer.jsp" />

		</div>
	</div>
	<!--主文(結束)-->

	<jsp:include page="/footer_css.jsp" />

</body>

</html>