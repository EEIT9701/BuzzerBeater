<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="GroupRegSvc" scope="page" class="eeit.groupreg.model.GroupRegService" />
<jsp:useBean id="teamsSvc" scope="page" class="eeit.teams.model.TeamsService" />

<!DOCTYPE >
<html>


<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
<style>
#img1 {
	width: 55px;
	height: 40px;
	margin: auto;
}
</style>
</head>

<body>

	<jsp:include page="/header.jsp" />



	<!--主文(開始)-->
	<div class="container">
		<h2 align="center">審核繳費紀錄</h2>
		<div class="jumbotron">
			<form class="form-inline" method="post"
				action="<%=request.getContextPath()%>/Players.do">
				<select class="form-control" name="groups">
					<option>分組</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select> <input type="submit" class="btn btn-warning" value="搜尋"> <input
					type="hidden" name="action" value="getOne_For_Display">
			</form>
			<!--表格(開始)-->
			<!--****************-->
			<!-- 第一列(開始) -->
			<!--****************-->
			<div class="row">

				<div class="col-md-12">

					<table class="table table-bordered" >
						<thead>
							<tr>
								<td>隊伍名稱</td>
								<td>報名分組</td>
								<td>報名時間</td>
								<td>繳費時間</td>
								<td>帳號後五碼</td>
								<td>核對</td>


							</tr>
						</thead>
						<tbody>
						 <c:forEach var="groupRegVO" items="${GroupRegSvc.all}">
                               
                                
                                    <tr align='center' valign='middle'>

									<td><a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${groupRegVO.teamsVO.teamID}">${groupRegVO.teamsVO.teamName}</a></td>
									<td>${groupRegVO.groupsVO.seasonVO.seasonName} - ${groupRegVO.groupsVO.groupName}</td>
									<!--球隊名-->

									<!--報名時間-->
									    <td>${groupRegVO.registerDate}</td>
                                        <!--繳費時間-->
                                        <td></td>
                                        <!--帳號後五碼-->
                                        <td>${groupRegVO.paymentNumber}</td>
                                        <!--核對-->
									 <td>
                                            <Form method="post" action="<%=request.getContextPath() %>/Season.do" id="update">
                                                <button type="button" class="btn btn-lg btn-primary">審核</button>
                                                <%-- 			        			<input type="hidden" name="seasonID" value="${sVO.seasonID}">  --%>
                                                <!--                                     <input type="hidden" name="action" value="GET_ONE_TO_UPDATE"> -->
                                            </Form>
                                       </td>
                                      
								</tr>
							</c:forEach>
					</table>

				</div>
			</div>
			<jsp:include page="/footer.jsp" />
		</div>
</div>
		<!--主文(結束)-->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#example').DataTable();
			});
		</script>
</body>
</html>