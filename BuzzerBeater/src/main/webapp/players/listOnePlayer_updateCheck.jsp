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
			<jsp:useBean id="playerSvc" scope="page" class="eeit.players.model.PlayerService" />
			<!--主文(開始)-->
			<div class="container">
				<div class="jumbotron">
					
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
										<th>身分證ID</th>
										<th>身高</th>
										<th>體重</th>
										<th>生日</th>
										<th>國籍</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="playersVO" items="${playersVO}">
										<tr align='center' valign='middle'>
											<td><img id="img1" src="data:image/jpeg;base64,${playersVO.photo}"></td>
											<td>${playersVO.playerName}</td>
											<td>${playersVO.id}</td>
											<td>${playersVO.height}</td>
											<td>${playersVO.weights}</td>
											<td>${playersVO.birthday}</td>
											<td>${playersVO.nationality}</td>

										</tr>
									</c:forEach>
							</table>
							
								<button type="submit" class="btn btn-info"><a href="<%=request.getContextPath() %>/players/listAllPlayer_back.jsp">確認修改</a></button>
								 
							<Form method="post" action="<%=request.getContextPath() %>/Players.do">
							<button type="submit" class="btn btn-danger">返回修改</button>
							<input type="hidden" name="playerName" value="${playersVO.playerName}">
                            <input type="hidden" name="action" value="getOne_For_Update">
                            </Form>
							
						</div>
					</div>

					<jsp:include page="/footer.jsp" />

				</div>
			</div>
			<!--主文(結束)-->

			<jsp:include page="/footer_css.jsp" />
		</body>

		</html>