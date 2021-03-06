<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>BuzzerBeater-球員管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
<style>
#img1 {
	width: 40px;
	height: 40px;
	margin: auto;
}
table {
	table-layout: fixed;
}
</style>

</head>

<body>

	<jsp:include page="/header.jsp" />
	<jsp:useBean id="playerSvc" scope="page"
		class="eeit.players.model.PlayerService" />
	<!--主文(開始)-->
	<div class="container">
		<div class="jumbotron">
<!-- 			<form class="form-inline" method="post" -->
<%-- 				action="<%=request.getContextPath()%>/Players.do"> --%>
<!-- 				<div class="form-group"> -->
<!-- 					<label for="Name">身分證字號:</label> <input type="text" -->
<!-- 						class="form-control" id="Name" name="playerName" -->
<!-- 						placeholder="請輸入球員身分證字號"> -->
<!-- 				</div> -->
<!-- 				<input type="submit" class="btn btn-warning" value="搜尋"> <input -->
<!-- 					type="hidden" name="action" value="getOne_For_Display"> -->
<!-- 			</form> -->
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="col-md-4"></div>
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<Form method="post"
						action="<%=request.getContextPath()%>/Players.do">
						<button type="submit" class="btn btn-warning">新增球員</button>
						<input type="hidden" name="action" value="insertPlayer"> <input
							type="hidden" name="photo" value=""> <input type="hidden"
							name="playerName"> <input type="hidden" name="id">
						<input type="hidden" name="height"> <input type="hidden"
							name="weights"> <input type="hidden" name="birthday">
						<input type="hidden" name="nationality">
					</Form>
				</div>
			</div>
			<!--表格(開始)-->
			<!--****************-->
			<!-- 第一列(開始) -->
			<!--****************-->
			<div class="row">
				<!--第一列-左邊表格-格式_.col-md-8-->
				<div class="col-md-12">
					<div class="col-md-12">
						<table class="table table-bordered" id="table" align='center' valign='middle'>
							<thead>
								<tr>
									<th>球員照片</th>
									<th>球員姓名</th>
									<th>身分證ID</th>
									<th>身高</th>
									<th>體重</th>
									<th>生日</th>
									<th>國籍</th>
									<th></th>
									<th></th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="playersVO" items="${playerSvc.allPlayer}">
									<tr align='center' valign='middle'>
										
											<td><c:if test="${null==playersVO.photo}">
							              <img id="img1" src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png">
									    </c:if>
									    <c:if test="${null!=playersVO.photo}">
							               <img id="img1" src="data:image/jpeg;base64,${playersVO.photo}">
									    </c:if></td>
										<td>${playersVO.playerName}</td>
										<td>${playersVO.id}</td>
										<td>${playersVO.height}</td>
										<td>${playersVO.weights}</td>
										<td>${playersVO.birthday}</td>
										<td>${playersVO.nationality}</td>
										<td>
											<Form method="post"
												action="<%=request.getContextPath()%>/Players.do">
												<button type="submit" class="btn btn-info">修改</button>
												<input type="hidden" name="action" value="updatePlayer">
												<input type="hidden" name="photo" value="${playersVO.photo}">
												<input type="hidden" name="playerID"
													value="${playersVO.playerID}"> <input type="hidden"
													name="playerName" value="${playersVO.playerName}">
												<input type="hidden" name="id" value="${playersVO.id}">
												<input type="hidden" name="height"
													value="${playersVO.height}"> <input type="hidden"
													name="weights" value="${playersVO.weights}"> <input
													type="hidden" name="birthday" value="${playersVO.birthday}">
												<input type="hidden" name="nationality"
													value="${playersVO.nationality}">
											</Form>
										</td>
										<td>
											<Form method="post"
												action="<%=request.getContextPath()%>/Players.do">
												<button type="submit" class="btn btn-danger">刪除</button>
												<input type="hidden" name="playerID" value="${playersVO.playerID}"> 
													<input type="hidden" name="action" value="delete">
											</Form>
										</td>
									</tr>



								</c:forEach>
						</table>

					</div>
				</div>
			</div>
			

			<jsp:include page="/footer.jsp" />

		</div>
	</div>
	<!--主文(結束)-->

	<jsp:include page="/footer_css.jsp" />

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
		$(function() {
			$(".testmodal").on('click', function() {
				//事件處發顯示模態框
				$('#myModal1').modal('show');

			})
			$(document).ready(function() {
				 $('#table').DataTable({
					    columnDefs: [{ width: 200, targets: 6}],
					    "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
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