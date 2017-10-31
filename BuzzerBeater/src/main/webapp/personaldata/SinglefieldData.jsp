<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="eeit.personaldata.model.*"%>
<%@ page import="eeit.players.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EEIT97-第一組</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     
     <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel='stylesheet' type='text/css' />
     
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
<link href="<%=request.getContextPath()%>/css/jquery-ui-1.12.1.css"
	rel="stylesheet">
<style>
#st1 {
	padding: 30px;
	background-color: #FFAA33;
}
</style>



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
						</select> <input type="submit" value="確定">

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
						<c:forEach var="singlefieldVO" items="${teamAList}" begin="1" end="1">
							<li><a href="#tabs-1"><td><img
													src="data:image/png;base64,${singlefieldVO.teamsVO.teamBadge}"
													height="60" width="60"></td>${singlefieldVO.teamsVO.teamName}</a></li>
							
                        </c:forEach>
                        	<c:forEach var="singlefieldVO" items="${teamBList}" begin="1" end="1">
							
							<li><a href="#tabs-2"><td><img
													src="data:image/png;base64,${singlefieldVO.teamsVO.teamBadge}"
													height="60" width="60"></td>${singlefieldVO.teamsVO.teamName}</a></li>
                        </c:forEach>
						</ul>
								<div id="tabs-1">
						<table class="table table-bordered">
							<table class="table table-bordered" id="table">
								<thead>
									<tr>
										<th>球員</th>
										<th>球員</th>
										<th>出場時間</th>
										<th>投籃命中</th>
									    <th>投籃出手</th>
										<th>投籃(%)</th>
										<th>三分命中</th>
									    <th>三分出手</th>
										<th>三分(%)</th>
										<th>罰球命中</th>
									    <th>罰球出手</th>
										<th>罰球(%)</th>
										<th>進攻籃板</th>
										<th>防守籃板</th>
										<th>助攻</th>
										<th>抄截</th>
										<th>阻攻</th>
										<th>失誤</th>
										<th>犯規</th>
										<th>得分</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="singlefieldVO" items="${teamAList}">
										<tr align='center' valign='middle'>
										
											<td>${singlefieldVO.playersVO.playerName}</td>
											<td><c:if
											test="${not empty singlefieldVO.playersVO.photo}">
											<img
												src="data:image/png;base64,${singlefieldVO.playersVO.photo}"
												height="67.5" width="45">
										</c:if> <c:if test="${empty singlefieldVO.playersVO.photo}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="67.5" width="45">
										</c:if></td>
											<td>${singlefieldVO.gameTime}</td>
											<td>${singlefieldVO.twoPoint}</td>
											<td>${singlefieldVO.twoPointShot}</td>
											<td><c:if test="${'0'==singlefieldVO.twoPointShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.twoPointShot}">
									              <p><fmt:formatNumber type="number" value="${singlefieldVO.twoPoint/singlefieldVO.twoPointShot*100}" maxFractionDigits="1"/></p>
									            </c:if>
									        </td>
											<td>${singlefieldVO.threePoint}</td>
											<td>${singlefieldVO.threePointShot}</td>
											<td><c:if test="${'0'==singlefieldVO.threePointShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.threePointShot}">
									              <p><fmt:formatNumber type="number" value="${singlefieldVO.threePoint/singlefieldVO.threePointShot*100}" maxFractionDigits="1"/></p>
									            </c:if>
									        </td>
											<td>${singlefieldVO.fg}</td>
											<td>${singlefieldVO.fgShot}</td>
											<td><c:if test="${'0'==singlefieldVO.fg}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.fgShot}">
									              <p><fmt:formatNumber type="number" value="${singlefieldVO.fg/singlefieldVO.fgShot*100}" maxFractionDigits="1"/></p>
									            </c:if>
									        </td>
											<td>${singlefieldVO.offReb}</td>
											<td>${singlefieldVO.defReb}</td>
											<td>${singlefieldVO.assist}</td>
											<td>${singlefieldVO.steal}</td>
											<td>${singlefieldVO.blocks}</td>
											<td>${singlefieldVO.turnover}</td>
											<td>${singlefieldVO.personalFouls}</td>
											<td>${singlefieldVO.points}</td>
										
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
										<th>球員</th>
										<th>球員</th>
										<th>出場時間</th>
										<th>投籃命中</th>
									    <th>投籃出手</th>
										<th>投籃(%)</th>
										<th>三分命中</th>
									    <th>三分出手</th>
										<th>三分(%)</th>
										<th>罰球命中</th>
									    <th>罰球出手</th>
										<th>罰球(%)</th>
										<th>進攻籃板</th>
										<th>防守籃板</th>
										<th>助攻</th>
										<th>抄截</th>
										<th>阻攻</th>
										<th>失誤</th>
										<th>犯規</th>
										<th>得分</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="singlefieldVO" items="${teamBList}">
										<tr align='center' valign='middle'>
										
											<td>${singlefieldVO.playersVO.playerName}</td>
											<td><c:if
											test="${not empty singlefieldVO.playersVO.photo}">
											<img
												src="data:image/png;base64,${singlefieldVO.playersVO.photo}"
												height="67.5" width="45">
										</c:if> <c:if test="${empty singlefieldVO.playersVO.photo}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="67.5" width="45">
										</c:if></td>
											<td>${singlefieldVO.gameTime}</td>
											<td>${singlefieldVO.twoPoint}</td>
											<td>${singlefieldVO.twoPointShot}</td>
											<td><c:if test="${'0'==singlefieldVO.twoPointShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.twoPointShot}">
									              <p><fmt:formatNumber type="number" value="${singlefieldVO.twoPoint/singlefieldVO.twoPointShot*100}" maxFractionDigits="1"/></p>
									            </c:if>
									        </td>
											<td>${singlefieldVO.threePoint}</td>
											<td>${singlefieldVO.threePointShot}</td>
											<td><c:if test="${'0'==singlefieldVO.threePointShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.threePointShot}">
									              <p><fmt:formatNumber type="number" value="${singlefieldVO.threePoint/singlefieldVO.threePointShot*100}" maxFractionDigits="1"/></p>
									            </c:if>
									        </td>
											<td>${singlefieldVO.fg}</td>
											<td>${singlefieldVO.fgShot}</td>
											<td><c:if test="${'0'==singlefieldVO.fgShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.fgShot}">
									              <p><fmt:formatNumber type="number" value="${singlefieldVO.fg/singlefieldVO.fgShot*100}" maxFractionDigits="1"/></p>
									            </c:if>
									        </td>
											<td>${singlefieldVO.offReb}</td>
											<td>${singlefieldVO.defReb}</td>
											<td>${singlefieldVO.assist}</td>
											<td>${singlefieldVO.steal}</td>
											<td>${singlefieldVO.blocks}</td>
											<td>${singlefieldVO.turnover}</td>
											<td>${singlefieldVO.personalFouls}</td>
											<td>${singlefieldVO.points}</td>
										
										</tr>
									</c:forEach>
								</tbody>
								</table>
							</table>
						</div> 

				</div>

			</div>
		</div>
		<jsp:include page="/footer_css.jsp" />
	</div>
	</div>

	<!--主文(結束)-->

	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#tabs").tabs({
				event : "mouseover"
			});
		});
	</script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/datatables.min.js"></script>

	<jsp:include page="/footer.jsp" />
	<script>
		$(document).ready(function() {
			$(document).ready(function() {
				$('#table').DataTable({
					"lengthMenu": [[15, 20, 25, -1], [15, 20, 25, "All"]],
					"pagingType": "full_numbers",
					"language": {
						"lengthMenu":"每一頁顯示_MENU_ 筆資料",
						"zeroRecords":"查無資料",
						"info":"現在正在第_PAGE_ 頁，總共有_PAGES_ 頁",
						"infoEmpty":"無資料",
						"infoFiltered":"(總共搜尋了_MAX_ 筆資料)",
						"search":"搜尋：",
						"paginate":{
							"first":"第一頁",
							"previous":"上一頁",
							"next":"下一頁",
							"last":"最末頁"					
						}
				  }
				})
			});
		});
		
		
		
	</script>
	<script>
		$(document).ready(function() {
			$(document).ready(function() {
				$('#table2').DataTable({
					"lengthMenu": [[15, 20, 25, -1], [15, 20, 25, "All"]],
					"pagingType": "full_numbers",
					"language": {
						"lengthMenu":"每一頁顯示_MENU_ 筆資料",
						"zeroRecords":"查無資料",
						"info":"現在正在第_PAGE_ 頁，總共有_PAGES_ 頁",
						"infoEmpty":"無資料",
						"infoFiltered":"(總共搜尋了_MAX_ 筆資料)",
						"search":"搜尋：",
						"paginate":{
							"first":"第一頁",
							"previous":"上一頁",
							"next":"下一頁",
							"last":"最末頁"					
						}
				  }
				})
			});
		});
	</script>
</body>
</html>
