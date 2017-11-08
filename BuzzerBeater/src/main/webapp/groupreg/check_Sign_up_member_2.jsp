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
		<div class="jumbotron">
		<h2 align="center">繳費</h2>
			<!--表格(開始)-->
			<!--****************-->
			<!-- 第一列(開始) -->
			<!--****************-->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered" id="example">
						<thead>
							<tr>
								<td>隊伍名稱</td>
								<td>報名分組</td>
								<td>報名時間</td>
								<td>手動繳費驗證</td>
								<td>線上繳費驗證</td>
								<td></td>
								<td>驗證狀態</td>
							</tr>
						</thead>
						<tbody id="test01">
							<c:forEach var="groupRegVO" items="${GroupRegSvc.all}" >
								<tr align='center' valign='middle' >
									<!--球隊名-->
									<td id="${groupRegVO.teamsVO.teamID}"><a
									href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${groupRegVO.teamsVO.teamID}">${groupRegVO.teamsVO.teamName}</a></td>
									<!--組別名-->
									<td id="${groupRegVO.groupsVO.groupID}">${groupRegVO.groupsVO.seasonVO.seasonName}-
										${groupRegVO.groupsVO.groupName}</td>
									<!--報名時間-->
									<td>${groupRegVO.registerDate}</td>
									
<!-- 								------------------------------------------------------------------------------>

									<c:if test="${groupRegVO.teamStat==0}">
									<!--手動繳費驗證-->
									<td class="col-xs-2"><input id="account" name="account" placeholder="輸入帳號後五碼" class="form-control input-md" type="text" required ></td>
									<!--線上繳費驗證-->
										<td>
										<a href="<%=request.getContextPath()%>/opaytest.do" id="opay">
										<img src="<%=request.getContextPath() %>/images/logo_pay200x55.png" style="width:80%;padding-top: 5px;">
										</a>
										</td>
									<!--按鈕-->
										<td><button type="button" class="btn btn-lg btn-warning" >送出</button></td>
									<!--驗證狀態-->
										<td>未繳費</td>
									</c:if>
									
<!-- 								------------------------------------------------------------------------------>								
									<c:if test="${groupRegVO.teamStat==1}">
									<!--手動繳費驗證-->
									<td class="col-xs-2">${groupRegVO.paymentNumber}</td>
									<!--線上繳費驗證-->
										<td><img src="<%=request.getContextPath() %>/images/logo_pay200x55.png" style="width:80%;padding-top: 5px;"></td>
									<!--按鈕-->
										<td><button type="button" class="btn btn-lg btn-danger" disabled="disabled">已送出</button></td>
									<!--驗證狀態-->	
										<td>繳費成功</td>
									</c:if>
<!-- 								------------------------------------------------------------------------------>							
									<c:if test="${groupRegVO.teamStat==2}">
									<!--手動繳費驗證-->
									<td class="col-xs-2">${groupRegVO.paymentNumber}</td>
									<!--線上繳費驗證-->
										<td><img src="<%=request.getContextPath() %>/images/logo_pay200x55.png" style="width:80%;padding-top: 5px;"></td>
									<!--按鈕-->
										<td><button type="button" class="btn btn-lg btn-danger" disabled="disabled">已送出</button></td>
									<!--驗證狀態-->	
										<td>系統確認中</td>
									</c:if>
								</tr>
							</c:forEach>
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
		$('.btn-warning').on('click', function(){
			console.log(1);
			if(confirm("確定要送出嗎?")){
            $(this).parents('tr').find('td:nth-child(7)').text('2');
            $(this).text('已送出');
            $(this).removeClass('btn btn-lg btn-warning');
            $(this).addClass('btn btn-lg btn-danger');
            $(this).attr("disabled","disabled");
            var teamID =$(this).parents('tr').find('td:nth-child(1)').attr('id');
            var groupID =$(this).parents('tr').find('td:nth-child(2)').attr('id');
            var registerDate =$(this).parents('tr').find('td:nth-child(3)').text();
            var teamStat =$(this).parents('tr').find('td:nth-child(7)').text();
            var paymentNumber =$(this).parents('tr').find('td:nth-child(4)>input').val();
	       	var dataStr = JSON.stringify({ 'teamID':teamID, 'groupID':groupID, 'teamStat':teamStat,'registerDate':registerDate,'paymentNumber':paymentNumber})
	       	console.log(dataStr);
	       	$.post('<%=request.getContextPath()%>/GroupReg.do',{'action':'UPDATE','data':dataStr},function(datas){})   
	       	$(this).parents('tr').find('td:nth-child(4)').html(paymentNumber);
	       	$(this).parents('tr').find('td:nth-child(7)').text('系統確認中');
            $(this).parents('tr').find('td:nth-child(5)>a').remove("a");
			$(this).parents('tr').find('td:nth-child(5)').html('<img src="<%=request.getContextPath() %>/images/logo_pay200x55.png" style="width:80%;padding-top:5px;">');
		  }
		 
		})
	
		$('#opay').on('click',function(){

			console.log("3");
			if(confirm("確定要送出嗎?")){
			$(this).parents('tr').find('td:nth-child(7)').text('2');
            $(this).parents('tr').find('td:nth-child(6)').text('已送出');
            $(this).parents('tr').find('td:nth-child(6)').removeClass('btn btn-lg btn-warning');
            $(this).parents('tr').find('td:nth-child(6)').addClass('btn btn-lg btn-danger');
            $(this).parents('tr').find('td:nth-child(6)').attr("disabled","disabled");
            $(this).parents('tr').find('td:nth-child(4)>input').attr('value','無');
			var teamID =$(this).parents('tr').find('td:nth-child(1)').attr('id');
            var groupID =$(this).parents('tr').find('td:nth-child(2)').attr('id');
            var registerDate =$(this).parents('tr').find('td:nth-child(3)').text();
            var teamStat =$(this).parents('tr').find('td:nth-child(7)').text();
            var paymentNumber =$(this).parents('tr').find('td:nth-child(4)>input').val();
	       	var dataStr = JSON.stringify({ 'teamID':teamID, 'groupID':groupID, 'teamStat':teamStat,'registerDate':registerDate,'paymentNumber':paymentNumber})
	       	console.log(dataStr);
	       	$.post("<%=request.getContextPath()%>/GroupReg.do", {'action':'UPDATE','data':dataStr}, function(datas){})
			}
		}) 
	    
	   })
		

	</script>
</body>
</html>