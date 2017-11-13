<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="GroupRegSvc" scope="page"
	class="eeit.groupreg.model.GroupRegService" />
<jsp:useBean id="teamsSvc" scope="page"
	class="eeit.teams.model.TeamsService" />
<!DOCTYPE >
<html>


<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- ***datatables顯示設定_2-1*** -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />

<jsp:include page="/header_css.jsp" />
<jsp:include page="/font_css.jsp" />
<style>
#img1 {
	width: 55px;
	height: 40px;
	margin: auto;
}
thead{
	background-color: #d62d67;
	color: #e9e9e9;
}
th{
text-align:center;
}
#pathWay {
	color: #666;
	height: 28px;
	line-height: 28px;
	border-bottom: 1px solid #c0b7b7;
	text-indent: 5px;
	font-size: 18px;
	font-weight: normal;
	margin-bottom: 10px;
	font-family:微軟正黑體;
}
</style>
</head>


<body>
	<jsp:include page="/header.jsp" />
	<!--主文(開始)-->
	<div class="container">
		<div class="jumbotron">
		
		<!--上層導覽列(開始) -->
		<div id="pathWay">
        	<span>
            	<a class="blockUI" href="<%=request.getContextPath() %>/index.jsp">
            		<span>使用者功能</span>
            	</a>
        	</span>&gt;
        	<span><span>繳費</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
		
		<h2 align="center">各球隊繳費紀錄</h2>
			<!--表格(開始)-->
			<!--****************-->
			<!-- 第一列(開始) -->
			<!--****************-->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered" >
						<thead>
							<tr align='center' valign='middle'>
								<th >隊伍名稱</th>
								<th>報名分組</th>
								<th>報名時間</th>

								<th>帳號後五碼</th>
								<th>核對</th>
							</tr>
						</thead>
						<tbody id="test01">
							<c:forEach var="groupRegVO" items="${GroupRegSvc.all}" >
								<tr align='center' valign='middle' >
									<td id="${groupRegVO.teamsVO.teamID}"><a
									href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${groupRegVO.teamsVO.teamID}">${groupRegVO.teamsVO.teamName}</a></td>
									<td id="${groupRegVO.groupsVO.groupID}">${groupRegVO.groupsVO.seasonVO.seasonName}-
										${groupRegVO.groupsVO.groupName}</td>
									<!--球隊名-->

									<!--報名時間-->
									<td>${groupRegVO.registerDate}</td>

									<!--帳號後五碼-->
									<td>${groupRegVO.paymentNumber}</td>
									<!--核對-->
<!-- 										<Form method="post" -->
                                           <td><c:if test="${groupRegVO.teamStat==1}">
												<button type="button" class="btn btn-lg btn-warning" disabled="disabled">已繳費</button>
											</c:if>
											<c:if test="${groupRegVO.teamStat==2}">
												<button type="button" class="btn btn-lg btn-danger">待審核</button>                                                
											</c:if></td> 
<%-- 			        			<input type="hidden" name="seasonID" value="${sVO.seasonID}">  --%>
<!--                                     <input type="hidden" name="action" value="GET_ONE_TO_UPDATE"> -->
<!-- 										</Form> -->					
								</tr>
							</c:forEach>
						</tbody>	
					</table>

				</div>
			</div>
			<jsp:include page="/footer.jsp" />
		</div>
	</div>
	<jsp:include page="/footer_css.jsp" />
	<!--主文(結束)-->
	
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<!-- ***datatables顯示設定_2-2*** -->

	
	
	<script>
	   $(function(){
		   $('#example').DataTable(
				   {
						columnDefs: [{ width: 200, targets: 5}],
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
					}
				   )   
	   })
	   
	   $('.btn-danger').on('click', function(){
			console.log(1);
		if($(this).text()=='待審核'){
			if(confirm("確定要修改嗎?")){
            $(this).parents('tr').find('td:nth-child(4)').text('1');
            $(this).text('已繳費');
            $(this).removeClass('btn btn-lg btn-danger');
            $(this).addClass('btn btn-lg btn-warning');
            $(this).attr("disabled","disabled");
            var teamID =$(this).parents('tr').find('td:nth-child(1)').attr('id');
            var groupID =$(this).parents('tr').find('td:nth-child(2)').attr('id');
            var registerDate =$(this).parents('tr').find('td:nth-child(3)').text();
            var teamStat =$(this).parents('tr').find('td:nth-child(4)').text();
            var paymentNumber =$(this).parents('tr').find('td:nth-child(5)').text();
	       	var dataStr = JSON.stringify({ 'teamID':teamID, 'groupID':groupID, 'teamStat':teamStat,'registerDate':registerDate,'paymentNumber':paymentNumber})
	       	console.log(dataStr);
	       	$.post('<%=request.getContextPath()%>/GroupReg.do',{'action':'UPDATE','data':dataStr},function(datas){})    
		  }
		 }
		})
	</script>
</body>
</html>