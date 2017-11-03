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
<title>Buzzer Beater</title>
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
		
				<!--第一列-左邊表格-格式_.col-md-8-->
				<div class="col-md-12">

					</div>
					   <table class="table table-bordered">
					 
					 
					    <thead>
									<tr>
									
									<tr>
					  <thead>
					    <c:set var="pointmaxA" value="0"/>
					    <c:set var="assistmaxA" value="0"/>
					    <c:set var="rebmaxA" value="0"/>
					    <c:set var="nameA" value=""/>
					    <c:set var="photoA" value=""/>
					    <c:set var="assistnameA" value=""/>
					    <c:set var="assistphotoA" value=""/>
					    <c:set var="rebnameA" value=""/>
					    <c:set var="rebphotoA" value=""/>
						<c:forEach var="singlefieldVO" items="${teamAList}" >
						   <c:if test="${singlefieldVO.points>pointmaxA}">
								<c:set var="pointmaxA" value="${singlefieldVO.points}"/>
								<c:set var="nameA" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="photoA" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
						    <c:if test="${singlefieldVO.assist>assistmaxA}">
								<c:set var="assistmaxA" value="${singlefieldVO.assist}"/>
								<c:set var="assistnameA" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="assistphotoA" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
						   <c:if test="${singlefieldVO.defReb+singlefieldVO.offReb>rebmaxA}">
								<c:set var="rebmaxA" value="${singlefieldVO.defReb+singlefieldVO.offReb}"/>
								<c:set var="rebnameA" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="rebphotoA" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
                        </c:forEach>
                        
                        <c:set var="pointmaxB" value="0"/>
                        <c:set var="assistmaxB" value="0"/>
                        <c:set var="rebmaxB" value="0"/>
                        <c:set var="nameB" value=""/>
					    <c:set var="photoB" value=""/>
					    <c:set var="assistnameB" value=""/>
					    <c:set var="assistphotoB" value=""/>
					    <c:set var="rebnameB" value=""/>
					    <c:set var="rebphotoB" value=""/>
						<c:forEach items="${teamBList}" var="singlefieldVO">
						   <c:if test="${singlefieldVO.points>pointmaxB}">
								<c:set var="pointmaxB" value="${singlefieldVO.points}"/>
								<c:set var="nameB" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="photoB" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
						   <c:if test="${singlefieldVO.assist>assistmaxB}">
								<c:set var="assistmaxB" value="${singlefieldVO.assist}"/>
								<c:set var="assistnameB" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="assistphotoB" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
						   <c:if test="${singlefieldVO.defReb+singlefieldVO.offReb>rebmaxB}">
								<c:set var="rebmaxB" value="${singlefieldVO.defReb+singlefieldVO.offReb}"/>
								<c:set var="rebnameB" value="${singlefieldVO.playersVO.playerName}"/>
								<c:set var="rebphotoB" value="${singlefieldVO.playersVO.photo}"/>
						   </c:if>
                        </c:forEach>
                        
					  <tbody>
						<tr>
						  <td><h5>得分王	</h5>					  
						    <%-- <img src="data:image/png;base64,${photoA}" height="94.5" width="63"> --%>
						    <c:if test="${not empty photoA}">
											<img
												src="data:image/png;base64,${photoA}"
												height="94.5" width="63">
										</c:if> <c:if test="${empty photoA}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="94.5" width="63">
										</c:if>
						    <c:out value="${nameA}"/>
						    <c:out value="${pointmaxA}"/>
						  </td>
						  <td><h5>得分王	</h5>
					<%-- <img src="data:image/png;base64,${photoB}" height="94.5" width="63"> --%>
					<c:if test="${not empty photoB}">
											<img
												src="data:image/png;base64,${photoB}"
												height="94.5" width="63">
										</c:if> <c:if test="${empty photoB}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="94.5" width="63">
										</c:if>
						    <c:out value="${nameB}"/>
						    <c:out value="${pointmaxB}"/>
						  </td>
					    </tr>
					    <tr>
					      <td><h5>助功王	</h5>				  
						    <%-- <img src="data:image/png;base64,${assistphotoA}" height="94.5" width="63"> --%>
						    <c:if test="${not empty assistphotoA}">
											<img
												src="data:image/png;base64,${assistphotoA}"
												height="94.5" width="63">
										</c:if> <c:if test="${empty assistphotoA}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="94.5" width="63">
										</c:if>
						    <c:out value="${assistnameA}"/>
						    <c:out value="${assistmaxA}"/>
						  </td>
						  <td><h5>助功王	</h5>
						<%--    <img src="data:image/png;base64,${assistphotoB}" height="94.5" width="63"> --%>
						                <c:if test="${not empty assistphotoB}">
											<img
												src="data:image/png;base64,${assistphotoB}"
												height="94.5" width="63">
										</c:if> <c:if test="${empty assistphotoB}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="94.5" width="63">
										</c:if>
						    <c:out value="${assistnameB}"/>
						    <c:out value="${assistmaxB}"/>
						  </td>
					    </tr>
					    <tr>
					      <td><h5>籃板王	</h5>				  
						    <%-- <img src="data:image/png;base64,${rebphotoA}" height="94.5" width="63"> --%>
						    <c:if test="${not empty rebphotoA}">
											<img
												src="data:image/png;base64,${rebphotoA}"
												height="94.5" width="63">
										</c:if> <c:if test="${empty rebphotoA}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="94.5" width="63">
										</c:if>
						    <c:out value="${rebnameA}"/>
						    <c:out value="${rebmaxA}"/>
						  </td>
						  <td><h5>籃板王	</h5>
						 <%--   <img src="data:image/png;base64,${rebphotoB}" height="94.5" width="63"> --%>
						<c:if test="${not empty rebphotoB}">
											<img
												src="data:image/png;base64,${rebphotoB}"
												height="94.5" width="63">
										</c:if> <c:if test="${empty rebphotoB}">
											<img
												src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png"
												height="94.5" width="63">
										</c:if>
					        <c:out value="${rebnameB}"/>
						    <c:out value="${rebmaxB}"/>
						  </td>
					    </tr>
					    
					    
					    
                      </tbody>   
			           </table>
			
		
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
							<li><a href="#tabs-1" style="width:481px"><td><img
													src="data:image/png;base64,${singlefieldVO.teamsVO.teamBadge}"
													height="60" width="60"></td>${singlefieldVO.teamsVO.teamName}</a></li>
							
                        </c:forEach>
                        	<c:forEach var="singlefieldVO" items="${teamBList}" begin="1" end="1">
							
							<li><a href="#tabs-2" style="width:482px"><td><img
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
										<th>出場時間(分)</th>
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
											<td><fmt:formatNumber type="number" value="${singlefieldVO.gameTime/60}" maxFractionDigits="1"/></td>
											<td>${singlefieldVO.twoPoint}</td>
											<td>${singlefieldVO.twoPointShot}</td>
											<td><c:if test="${'0'==singlefieldVO.twoPointShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.twoPointShot}">
									             <fmt:formatNumber type="number" value="${singlefieldVO.twoPoint/singlefieldVO.twoPointShot*100}" maxFractionDigits="1"/>
									            </c:if>
									        </td>
											<td>${singlefieldVO.threePoint}</td>
											<td>${singlefieldVO.threePointShot}</td>
											<td><c:if test="${'0'==singlefieldVO.threePointShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.threePointShot}">
									              <fmt:formatNumber type="number" value="${singlefieldVO.threePoint/singlefieldVO.threePointShot*100}" maxFractionDigits="1"/>
									            </c:if>
									        </td>
											<td>${singlefieldVO.fg}</td>
											<td>${singlefieldVO.fgShot}</td>
											<td><c:if test="${'0'==singlefieldVO.fg}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.fgShot}">
									             <fmt:formatNumber type="number" value="${singlefieldVO.fg/singlefieldVO.fgShot*100}" maxFractionDigits="1"/>
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
										<th>出場時間(分)</th>
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
											<td><fmt:formatNumber type="number" value="${singlefieldVO.gameTime/60}" maxFractionDigits="1"/></td>
											<td>${singlefieldVO.twoPoint}</td>
											<td>${singlefieldVO.twoPointShot}</td>
											<td><c:if test="${'0'==singlefieldVO.twoPointShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.twoPointShot}">
									              <fmt:formatNumber type="number" value="${singlefieldVO.twoPoint/singlefieldVO.twoPointShot*100}" maxFractionDigits="1"/>
									            </c:if>
									        </td>
											<td>${singlefieldVO.threePoint}</td>
											<td>${singlefieldVO.threePointShot}</td>
											<td><c:if test="${'0'==singlefieldVO.threePointShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.threePointShot}">
									              <fmt:formatNumber type="number" value="${singlefieldVO.threePoint/singlefieldVO.threePointShot*100}" maxFractionDigits="1"/>
									            </c:if>
									        </td>
											<td>${singlefieldVO.fg}</td>
											<td>${singlefieldVO.fgShot}</td>
											<td><c:if test="${'0'==singlefieldVO.fgShot}">
							                    0
									            </c:if>
									            <c:if test="${'0' != singlefieldVO.fgShot}">
									             <fmt:formatNumber type="number" value="${singlefieldVO.fg/singlefieldVO.fgShot*100}" maxFractionDigits="1"/>
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
