<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="eeit.memberinfo.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 	MemberInfoService dao = new MemberInfoService();
// 	List<MemberInfoVO> list = dao.getAll();
// 	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="memberInfoSvc" scope="page" class="eeit.memberinfo.model.MemberInfoService" />
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>EEIT97-第一組</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>

<style>
#st1 {
	padding: 30px;
	background-color: #1E90FF;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
</head>
<body>

	<jsp:include page="/header.jsp" />
	<!--主文(開始)-->
	<div class="container">

		<br>
		<br>
		<!--****************-->
		<!-- 第二列(開始) -->
		<!--****************-->
		<div class="row">
			<!--第二列-左邊表格-格式_.col-md-4-->
			<div class="col-md-12">
				<div class="col-md-12">
					<table class="table table-bordered" id="example">
						<thead>
							<tr align='center' valign='middle'>
								<td>會員編號</td>
								<td>會員帳號</td>
								<td>會員名稱</td>
								<td>權限</td>
								<td>註冊時間</td>
							    <td style="display:none;">球隊ID</td>
								<td></td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="MemberInfoVO" items="${memberInfoSvc.all}">
								<tr align='center' valign='middle'>
									<td>${MemberInfoVO.memberID}</td>
									<td>${MemberInfoVO.acc}</td>
									<td>${MemberInfoVO.name}</td>
									<td>${MemberInfoVO.auth}</td>
									<td>${MemberInfoVO.registerTime}</td>
							        <td style="display:none;">${MemberInfoVO.teamID}</td>
								    <td><button type="button" class="btn btn-lg btn-primary" >修改</button></td>
								    <td><button type="button" class="btn btn-lg btn-warning">刪除</button></td>
									<!-- 									<td> -->
									<!-- 										<FORM METHOD="post" -->
									<%-- 											ACTION="<%=request.getContextPath()%>/player.do"> --%>
									<!-- 											<input type="submit" value="修改"> <input type="hidden" -->
									<%-- 												name="memberID" value="${MemberInfoVO.memberID}"> <input --%>
									<!-- 												type="hidden" name="action" value=""> -->
									<!-- 										</FORM> -->
									<!-- 									</td> -->
									<!-- 									<td> -->
									<!-- 										<FORM METHOD="post" -->
									<%-- 											ACTION="<%=request.getContextPath()%>/player.do"> --%>
									<!-- 											<input type="submit" value="刪除"> <input type="hidden" -->
									<%-- 												name="memberID" value="${MemberInfoVO.memberID}"> <input --%>
									<!-- 												type="hidden" name="action" value=""> -->
									<!-- 										</FORM> -->
									<!-- 									</td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	<jsp:include page="/footer.jsp" />
	</div>

	<!--主文(結束)-->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#example').DataTable({
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
		
		
	</script>
	
</body>
</html>
