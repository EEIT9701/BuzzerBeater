<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="eeit.personaldata.model.*"%>
<%@ page import="eeit.players.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	PersonalDataService playerSvc = new PersonalDataService();
	List<PersonalDataVO> list = playerSvc.getAll();
	pageContext.setAttribute("list1", list);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EEIT97-第一組</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>

<style>
#st1 {
	padding: 30px;
	background-color: #FFAA33;
}

</style>

<link rel="stylesheet" type="text/css" href="../css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
<link href="<%=request.getContextPath() %>/css/jquery-ui-1.12.1.css" rel="stylesheet">

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
				<div class="col-md-12">

					<li><a href="index.jsp"> 首頁<!--這行的href輸入超連結頁面--></a>/球員數據排名</li> <br>
					<br>
					<div id=st1>
						球季 <select>
							<option label="2015賽季" value="object:7" selected="selected">季前熱身賽</option>
							<option label="2016賽季" value="object:8">例行賽</option>
							<option label="2017賽季" value="object:9">季後賽</option>
						</select> 組別 <select>
							<option label="東區" value="object:7" selected="selected">季前熱身賽</option>
							<option label="西區" value="object:8">例行賽</option>
							<!--   <option label="少年組" value="object:9">季後賽</option>   -->
						</select>

						 <input type="submit" value="確定">

					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<!--****************-->
		<!-- 第二列(開始) -->
		<!--****************-->
		<div class="row">
			<!--第二列-左邊表格-格式_.col-md-4-->
			<div class="col-md-12">

				<div class="col-md-12">
				<div id="tabs">
				<ul>
                                <li><a href="#tabs-1">平均</a></li>
                                <li><a href="#tabs-2">總合</a></li>
                         
                            </ul>
                            <div id="tabs-1">
                                <table class="table table-bordered">
                                   					<table class="table table-bordered" id="table">
						<thead>
							<tr>

								<th>球員編號</th>
								<th>球員</th>
								<th>球隊名稱</th>
								<th>出場次數</th>
								<th>平均出場時間</th>
							
								<th>投籃(%)</th>
							
								<th>三分(%)</th>
							
								<th>罰球(%)</th>
								<th>進攻籃板</th>
								<th>防守籃板</th>
								<th>平均籃板</th>
								<th>助攻</th>
								<th>抄截</th>
								<th>阻攻</th>
								<th>失誤</th>
								<th>犯規</th>
								<th>得分</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="personalDataVO" items="${list1}">
								<tr align='center' valign='middle'>

									<td>${personalDataVO.playersVO.playerName}</td>
									<td><c:if
											test="${not empty personalDataVO.playersVO.photo}">
											<img
												src="data:image/png;base64,${personalDataVO.playersVO.photo}"
												height="67.5" width="45">
										</c:if> <c:if test="${empty personalDataVO.playersVO.photo}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="67.5" width="45">
										</c:if></td>

									<td>${personalDataVO.teamsVO.teamName}</td>
									<td>${personalDataVO.gameID}</td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.gameTime/personalDataVO.gameID}" maxFractionDigits="0"/></td>
								
									<td><c:if test="${'0'==personalDataVO.twoPointShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.twoPointShot}">
									      <p><fmt:formatNumber type="number" value="${personalDataVO.twoPoint/personalDataVO.twoPointShot*100}" maxFractionDigits="1"/></p>
									    </c:if>
									</td>
									
									
									<td><c:if test="${'0'==personalDataVO.threePointShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.threePointShot}">
									      <p><fmt:formatNumber type="number" value="${personalDataVO.threePoint/personalDataVO.threePointShot*100}" maxFractionDigits="1"/></p>
									    </c:if>
									</td>
									
								
									<td><c:if test="${'0'==personalDataVO.fgShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.fgShot}">
									      <p><fmt:formatNumber type="number" value="${personalDataVO.fg/personalDataVO.fgShot*100}" maxFractionDigits="1"/></p>
									    </c:if>
									</td>
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.offReb/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.defReb/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.offReb/personalDataVO.gameID+personalDataVO.defReb/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.assist/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.steal/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.blocks/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.turnover/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.personalFouls/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.points/personalDataVO.gameID}" maxFractionDigits="1"/></td>

								</tr>
							</c:forEach>
						</tbody>
					</table> 
                                </table>
                            </div>
                            <div id="tabs-2">
                                <table class="table table-bordered">
                      <table class="table table-bordered" id="table2">
						<thead>
							<tr>

								<th>球員編號</th>
								<th>球員</th>
								<th>球隊名稱</th>
								<th>出場次數</th>
								<th>出場時間</th>
							
								<th>投籃(%)</th>
								
								<th>三分(%)</th>
							
								<th>罰球(%)</th>
								<th>進攻籃板</th>
								<th>防守籃板</th>
								<th>總籃板</th>
								<th>助攻</th>
								<th>抄截</th>
								<th>阻攻</th>
								<th>失誤</th>
								<th>犯規</th>
								<th>得分</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="personalDataVO" items="${list1}">
								<tr align='center' valign='middle'>

									<td>${personalDataVO.playersVO.playerName}</td>
									<td><c:if
											test="${not empty personalDataVO.playersVO.photo}">
											<img src="data:image/png;base64,${personalDataVO.playersVO.photo}"
												height="67.5" width="45">
										</c:if> <c:if test="${empty personalDataVO.playersVO.photo}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="67.5" width="45">
										</c:if></td>

									<td>${personalDataVO.teamsVO.teamName}</td>
									<td>${personalDataVO.gameID}</td>
									<td>${personalDataVO.gameTime}</td>
																	
									<td><c:if test="${'0'==personalDataVO.twoPointShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.twoPointShot}">
									      <p><fmt:formatNumber type="number" value="${personalDataVO.twoPoint/personalDataVO.twoPointShot*100}" maxFractionDigits="1"/></p>
									    </c:if>
									</td>
									
																
									<td><c:if test="${'0'==personalDataVO.threePointShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.threePointShot}">
									      <p><fmt:formatNumber type="number" value="${personalDataVO.threePoint/personalDataVO.threePointShot*100}" maxFractionDigits="1"/></p>
									    </c:if>
									</td>
									
															
									<td><c:if test="${'0'==personalDataVO.fgShot}">
							               0
									    </c:if>
									    <c:if test="${'0' != personalDataVO.fgShot}">
									      <p><fmt:formatNumber type="number" value="${personalDataVO.fg/personalDataVO.fgShot*100}" maxFractionDigits="1"/></p>
									    </c:if>
									</td>
									
									<td>${personalDataVO.offReb}</td>
									<td>${personalDataVO.defReb}</td>
									
									<td>${personalDataVO.offReb+personalDataVO.defReb}</td>
									
									<td>${personalDataVO.assist}</td>
									<td>${personalDataVO.steal}</td>
									<td>${personalDataVO.blocks}</td>
									<td>${personalDataVO.turnover}</td>
									<td>${personalDataVO.personalFouls}</td>
									<td>${personalDataVO.points}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
                            </div>
				
				    </div>

				</div>
			</div>
		</div>
	</div>

	<!--主文(結束)-->

            <script src="../js/jquery-ui.js"></script>
            <script>
                $(function () {
                    $("#tabs").tabs({
                        event: "mouseover"
                    });
                });
            </script>

	<script type="text/javascript" src="../js/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#table').DataTable();
		});
	</script>
	<script>
		$(document).ready(function() {
			$('#table2').DataTable();
		});
	</script>
	<jsp:include page="/footer.jsp" />
</body>
</html>
