<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="eeit.personaldata.model.*"%>
<%@ page import="eeit.players.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	PersonalDataService playerSvc = new PersonalDataService();
	List<PersonalDataVO> list = playerSvc.getAll();
	pageContext.setAttribute("list", list);
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
thead{
font-size:2px;
}
</style>
<link rel="stylesheet" type="text/css" href="../css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
</head>
<body>

	<jsp:include page="/header.jsp" />
	<!--主文(開始)-->
	<div class="container-fluid">
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
							<option label="社會組" value="object:7" selected="selected">季前熱身賽</option>
							<option label="青年組" value="object:8">例行賽</option>
							<option label="少年組" value="object:9">季後賽</option>
						</select>

						<!--球員數據                                                
     <select>
     <option label="得分" value="object:7" selected="selected">季前熱身賽</option>       
     <option label="籃板" value="object:8">例行賽</option>
     <option label="助功" value="object:8">例行賽</option>
     <option label="阻功" value="object:8">例行賽</option>
     <option label="抄截" value="object:8">例行賽</option>
     <option label="犯規" value="object:8">例行賽</option>
     <option label="失誤" value="object:8">例行賽</option>
     <option label="投籃" value="object:8">例行賽</option>
     <option label="三分" value="object:8">例行賽</option>
    </select>
    -->



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
                   <from method="post" action="<%=request.getContextPath()%>/personalData.do">
					<table class="table table-bordered" id="example">
						<thead>
							<tr>
								<th>球員</th>
								<th>球隊名稱</th>
								<th>出場時間</th>
								<th>二分命中</th>
								<th>二分出手數</th>
								<th>三分命中</th>
								<th>三分出手數</th>
								<th>罰球命中</th>
								<th>罰球出手數</th>
								<th>進攻籃板</th>
								<th>防守籃板</th>
								<th>助攻</th>
								<th>抄截</th>
								<th>阻攻</th>
								<th>失誤</th>
								<th>犯規</th>
								<th>得分</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="personalDataVO" items="${list}">
								<tr align='center' valign='middle'>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
									
									<td>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/player.do">
											<input type="submit" value="修改"> <input type="hidden"
												name="playerID" value="${playerVO.playerID}"> <input
												type="hidden" name="action" value="getOne_For_Update">
										</FORM>
									</td>
									<td>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/player.do">
											<input type="submit" value="刪除"> <input type="hidden"
												name="playerID" value="${playerVO.playerID}"> <input
												type="hidden" name="action" value="delete">
										</FORM>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</from>
				</div>
			</div>
		</div>

	</div>

	<!--主文(結束)-->



	<script type="text/javascript" src="../js/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>
	<jsp:include page="/footer.jsp" />

</body>
</html>
