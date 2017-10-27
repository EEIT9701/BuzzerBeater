<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="eeit.memberinfo.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberInfoService dao = new MemberInfoService();
	List<MemberInfoVO> list = dao.getAll();
	pageContext.setAttribute("list", list);
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
	src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>

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
								<th>會員編號</th>
								<th>會員帳號</th>
								<th>會員名稱</th>
								<th>權限</th>
								<th>註冊時間</th>
							    <th>球隊ID</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="MemberInfoVO" items="${list}">
								<tr align='center' valign='middle'>
									<td>${MemberInfoVO.memberID}</td>
									<td>${MemberInfoVO.acc}</td>
									<td>${MemberInfoVO.name}</td>
									<td>${MemberInfoVO.auth}</td>
									<td>${MemberInfoVO.registerTime}</td>
							        <td>${MemberInfoVO.teamID}</td>
								    <td><button type="button" class="btn btn-lg btn-primary" >修改</button></td>
								    <td><button type="button" class="btn btn-lg btn-warning" >刪除</button></td>
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
	$(function(){
		$(document).ready(function() {
			$('#productTable').DataTable();
		});
		
		$('#productTable>tbody').on('click','tr button:nth-child(1)',function(){
		   var id = $(this).parents('tr').find('td:nth-child(1)').text();
		   $.get('ProductsDelete',{ProductID:id},function(data){
		   alert(data);
		   loadProduct(1);
		   $('#productTable>tfoot input').val("");
		   $('#productTable>tfoot input').text("");
		   })
		 })
		var test = {
				name:value,
				action:
			
		}
		 $.post("memberInfoServlet",{"action":"GET_ALL_SEASON"} ,function(data){
			 
		 });
		 
	})
		
	</script>
	
</body>
</html>
