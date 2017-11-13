<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		
		<h2 align="center">繳費狀況</h2>
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
								<tr align='center' valign='middle' >
									<!--球隊名-->
										<td >EEIT97</td>
									<!--組別名-->
										<td>測試A區</td>
									<!--報名時間-->
										<td>${RegisterDate}</td>		
									<!--手動繳費驗證-->
										<td class="col-xs-2">無</td>
									<!--線上繳費驗證-->
										<td>
											<img src="<%=request.getContextPath() %>/images/logo_pay200x55.png" style="width:80%;padding-top: 5px;">
										</td>
									<!--按鈕-->
										<td><button type="button" class="btn btn-lg btn-danger" disabled="disabled">已送出</button></td>
									<!--驗證狀態-->
										<td>繳費完成</td>

								</tr>

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
			//驗證狀態欄位給2
            $(this).parents('tr').find('td:nth-child(7)').text('2');
			//按鈕改"已送出"
            $(this).text('已送出');
			//移除原樣式
            $(this).removeClass('btn btn-lg btn-warning');
          	//增加新樣式
            $(this).addClass('btn btn-lg btn-danger');
          	//增加不能點擊的屬性
            $(this).attr("disabled","disabled");
            var teamID =$(this).parents('tr').find('td:nth-child(1)').attr('id');
            var groupID =$(this).parents('tr').find('td:nth-child(2)').attr('id');
            var registerDate =$(this).parents('tr').find('td:nth-child(3)').text();
            var teamStat =$(this).parents('tr').find('td:nth-child(7)').text();
            var paymentNumber =$(this).parents('tr').find('td:nth-child(4)>input').val();
            //把撈到的值包成JSON
	       	var dataStr = JSON.stringify({ 'teamID':teamID, 'groupID':groupID, 'teamStat':teamStat,'registerDate':registerDate,'paymentNumber':paymentNumber})
	       	console.log(dataStr);
            //用POST傳名為UPDATE的action到Servlrt
	       	$.post('<%=request.getContextPath()%>/GroupReg.do',{'action':'UPDATE','data':dataStr},function(datas){})
	       	//讓輸入的值到手動繳費驗證欄位
	       	$(this).parents('tr').find('td:nth-child(4)').html(paymentNumber);
            //改變驗證狀態欄位
	       	$(this).parents('tr').find('td:nth-child(7)').text('繳費完成');
            //移除a標籤
            $(this).parents('tr').find('td:nth-child(5)>a').remove("a");
            //增加圖片
			$(this).parents('tr').find('td:nth-child(5)').html('<img src="<%=request.getContextPath() %>/images/logo_pay200x55.png" style="width:80%;padding-top:5px;">');
		  }
		 
		})
	
		$('#opay').on('click',function(){

			console.log("3");
			if(confirm("確定要送出嗎?")){
			//驗證狀態欄位給2
			$(this).parents('tr').find('td:nth-child(7)').text('2');
			//按鈕改"已送出"
            $(this).parents('tr').find('td:nth-child(6)').text('已送出');
          	//移除原樣式
            $(this).parents('tr').find('td:nth-child(6)').removeClass('btn btn-lg btn-warning');
          	//增加新樣式
            $(this).parents('tr').find('td:nth-child(6)').addClass('btn btn-lg btn-danger');
          	//增加不能點擊的屬性
            $(this).parents('tr').find('td:nth-child(6)').attr("disabled","disabled");
          	//手動繳費驗證給'無'
            $(this).parents('tr').find('td:nth-child(4)>input').attr('value','無');
			var teamID =$(this).parents('tr').find('td:nth-child(1)').attr('id');
            var groupID =$(this).parents('tr').find('td:nth-child(2)').attr('id');
            var registerDate =$(this).parents('tr').find('td:nth-child(3)').text();
            var teamStat =$(this).parents('tr').find('td:nth-child(7)').text();
            var paymentNumber =$(this).parents('tr').find('td:nth-child(4)>input').val();
          	//把撈到的值包成JSON
	       	var dataStr = JSON.stringify({ 'teamID':teamID, 'groupID':groupID, 'teamStat':teamStat,'registerDate':registerDate,'paymentNumber':paymentNumber})
// 	       	console.log(dataStr);
	      	//用POST傳名為UPDATE的action到Servlrt
	       	$.post("<%=request.getContextPath()%>/GroupReg.do", {'action':'UPDATE','data':dataStr}, function(datas){})
			}
		}) 
	    
	   })
		

	</script>
</body>
</html>