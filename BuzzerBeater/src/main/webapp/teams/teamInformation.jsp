<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>${teamsVO.teamName}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/header_css.jsp" />
<!--滑鼠移入，顯示表格(jquery設定"2-1")-->
<link href="<%=request.getContextPath()%>/css/jquery-ui-1.12.1.css"
	rel="stylesheet">
<style>
#team {
	width: 300px;
	height: 220px;
	margin: auto;
}

table {
	table-layout: fixed;
}

table.respond td:before {
	/* top/left values mimics padding */
	top: 8px;
	/* mimics padding top */
	left: 6px;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/responsive-tables.css"
	type="text/css">
<script
	src="<%=request.getContextPath()%>/js/jquery.responsive-tables.js"></script>
<style>
#photo {
	width: 35px;
	height: 40px;
	margin: auto;
}

th {
	text-align: center;
}
</style>
</head>

<body>

	<jsp:include page="/header.jsp" />
	<!--主文(開始)-->
	<div class="container">
		<!-- 第二列(開始) -->
		<!--****************-->
		<div class="row">
			<!--第二列-左邊表格-格式_.col-md-4-->
			<div class="col-md-4">
				<div class="col-md-12">
					<img id="team" src="data:image/png;base64,${teamsVO.teamBadge}">
					<!--球員照片-->
				</div>
			</div>
			<!--第二列-中間表格-格式_ .col-md-4-->
			<div class="col-md-4">

				<div class="col-md-12">
					<h2>${teamsVO.teamName}</h2>
					<table class="table">
						<tbody>
							<tr>
								<td>教練 | ${teamsVO.coachName}</td>
							</tr>
							<tr>
								<td>老闆 | ${teamsVO.bossName}</td>
							</tr>
							<tr>
								<td>球場 | ${teamsVO.locationinfoVO.locationName}</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
			<!--第二列-右邊表格-格式_.col-md-4-->
			<div class="col-md-4">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<table class="table" align='center' valign='middle'>

						<tbody>
							<tr >
								<td>
									<h2>${teamsVO.totalWin}<span>勝</span>
									</h2>

								</td>
								<td>
									<h2>-</h2>
								</td>
								<td>
									<h2>${teamsVO.totalLose}<span>負</span>
									</h2>

								</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="col-md-4"></div>

				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th>平均</br>得分
								</th>
								<th>平均</br>籃板
								</th>
								<th>平均</br>助攻
								</th>
								<th>平均</br>失分
								</th>
							</tr>
						</thead>
						<tbody>
							<tr align='center' valign='middle'>
								<td>排名</td>
								<td>6th</td>
								<td><fmt:formatNumber type="number" value="${personalDataVO.offReb/personalDataVO.gameID+personalDataVO.defReb/personalDataVO.gameID}" maxFractionDigits="2" /></td>
								<td>6th</td>
								<td><fmt:formatNumber type="number" value="${personalDataVO.points/personalDataVO.gameID}" maxFractionDigits="1" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!--****************-->
		<!-- 第二列(結束) -->
		<!--****************-->

		<div class="row">
			<!--第二列-左邊表格-格式_.col-md-4-->

			<div class="col-md-12">
				<!--滑鼠移入，顯示表格(開始)-->
				<div id="tabs">
					<ul>
						<li><a href="#tabs-1">球員名單</a></li>
						<li><a href="#tabs-2">球隊賽事</a></li>
					</ul>
					<div id="tabs-1">
						<c:forEach var="teamCompositionVO"
							items="${teamsVO.teamCompositionSet}">
							<table class="table table-bordered respond">
								<thead>
									<tr align='center' valign='middle'>
										<th>背號</th>
										<th>照片</th>
										<th>姓名</th>
										<th>位置</th>
										<th>身高</th>
										<th>體重</th>
									</tr>
								</thead>
								<tbody>
									<tr align='center' valign='middle'>
										<td>${teamCompositionVO.playerNo}</td>
										
											<td><c:if test="${null==teamCompositionVO.playersVO.photo}">
							              <img id="photo" src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png">
									    </c:if>
									    <c:if test="${null!=teamCompositionVO.playersVO.photo}">
							               <img id="photo"
											src="data:image/jpeg;base64,${teamCompositionVO.playersVO.photo}">
									    </c:if></td>
										<td><a href="<%=request.getContextPath()%>/PersonalData.do?action=Get_singleData&playerID=${teamCompositionVO.playersVO.playerID}">${teamCompositionVO.playersVO.playerName}</a></td>
										<td>${teamCompositionVO.playerRole}</td>
										<td>${teamCompositionVO.playersVO.height}</td>
										<td>${teamCompositionVO.playersVO.weights}</td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
					</div>
					<div id="tabs-2">
						<table class="table table-bordered" align='center' valign='middle'>
							<thead>
								<tr>
									<th>比賽時間</th>
									<th>比賽地點</th>
									<th>對戰隊伍</th>
									<th>比分</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="gamesVO" items="${gamesVO}">
									<tr align='center' valign='middle'>

										<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value ="${gamesVO.gameBeginDate}"/></td>
										<td>${gamesVO.locationinfoVO.locationName}</td>
										<td>
										<c:if test="${teamsVO.teamID == gamesVO.teamAVO.teamID}">
							               ${gamesVO.teamBVO.teamName}
									    </c:if>
									    <c:if test="${teamsVO.teamID == gamesVO.teamBVO.teamID}">
							               ${gamesVO.teamAVO.teamName}
									    </c:if>
									    </td>
										<td>${gamesVO.teamAScore} - ${gamesVO.teamBScore}</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!--滑鼠移入，顯示表格(結束)-->




				<jsp:include page="/footer.jsp" />

			</div>
		</div>
	</div>
	<!--主文(結束)-->

	<jsp:include page="/footer_css.jsp" />
	<!--滑鼠移入，顯示表格(jquery設定"2-2")-->
	<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#tabs").tabs({
				event : "mouseover"
			});
			$.responsiveTables();
		});
	</script>
</body>

</html>