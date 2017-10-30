<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="eeit.personaldata.model.*"%>
<%@ page import="eeit.players.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//	PersonalDataService playerSvc = new PersonalDataService();
//	List<PersonalDataVO> list = playerSvc.getAll();
//	pageContext.setAttribute("list", list);
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
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
   <%--                 <from method="post" action="<%=request.getContextPath()%>/personalData.do"> --%>
					<table class="table table-bordered" id="table">
						<thead>
							<tr align='center' valign='middle'>
								<th>球員</th>
								<th>賽事</th>
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
								<th>先發</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tbody01">
							
						</tbody>
					</table>
			<!-- 		</from> -->
				</div>
			</div>
		</div>
<jsp:include page="/footer_css.jsp" />
	</div>

	<!--主文(結束)-->



	<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
	   $(function(){
		   loadProduct('Get_All_PersonalData_JSON');
		   
		   function loadProduct(id){
			   $.getJSON('/BuzzerBeater/PersonalData.do',{'action':id},function(data){
				   var docFrg = $(document.createDocumentFragment());
				   var tb =$('#tbody01');
				   tb.empty;
				     $.each(data,function (idx, personalDataVO){
		               var cell1 = $('<td></td>').text(personalDataVO.playerID);
		               var cell2 = $('<td></td>').text(personalDataVO.gameID);
		               var cell3 = $('<td></td>').text(personalDataVO.teamID);
		               var cell4 = $('<td></td>').text(personalDataVO.gameTime);
		               var cell5 = $('<td></td>').text(personalDataVO.twoPoint);
		               var cell6 = $('<td></td>').text(personalDataVO.twoPointShot);
		               var cell7 = $('<td></td>').text(personalDataVO.threePoint);	            
		               var cell8 = $('<td></td>').text(personalDataVO.threePointShot);
		               var cell9 = $('<td></td>').text(personalDataVO.fg);
		               var cell10 = $('<td></td>').text(personalDataVO.fgShot);
		               var cell11 = $('<td></td>').text(personalDataVO.offReb);
		               var cell12 = $('<td></td>').text(personalDataVO.defReb);
		               var cell13 = $('<td></td>').text(personalDataVO.assist);
		               var cell14 = $('<td></td>').text(personalDataVO.steal);
		               var cell15 = $('<td></td>').text(personalDataVO.blocks);
		               var cell16 = $('<td></td>').text(personalDataVO.turnover);
		               var cell17 = $('<td></td>').text(personalDataVO.personalFouls);
		               var cell18 = $('<td></td>').text(personalDataVO.points);
		               var cell19 = $('<td></td>').text(personalDataVO.startingPlayer);
		               var cell20 = $('<td><button type="button" class="btn btn-lg btn-primary" data-toggle="JDialog" data-target="dialog-4" >修改</button></td>');
		               var cell21 = $('<td><button type="button" class="btn btn-lg btn-warning" >刪除</button></td>');
		               var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8,cell9, cell10, cell11, cell12, cell13, cell14, cell15, cell16,cell17, cell18, cell19, cell20,cell21]);
	 	          /*     docFrag.append(row);
	 	              tb.append(docFrag); */
	 	              tb.append(row);
		             }) 
					   buttonFunction(); 
				 	
					$(document).ready(function() {
						$('#table').DataTable();
					});
			
				   })
				   
			   }
			   
		   });
	   
		function buttonFunction(){
			  $('.btn-primary').on('click', function(){          	    		         
		       	
		        
		       	if($(this).text() == '修改'){	
		         //可以取得
			     var gameID = $(this).parents('tr').find('td:nth-child(2)').text();
			     //可以取得
			     var teamID = $(this).parents('tr').find('td:nth-child(3)').text();
			     //可以取得
			     var gameTime = $(this).parents('tr').find('td:nth-child(4)').text();
			     //可以取得
			     var twoPoint = $(this).parents('tr').find('td:nth-child(5)').text();
			     //可以取得
			     var twoPointShot = $(this).parents('tr').find('td:nth-child(6)').text();
			     //可以取得
			     var threePoint = $(this).parents('tr').find('td:nth-child(7)').text();
			     //可以取得
			     var threePointShot = $(this).parents('tr').find('td:nth-child(8)').text();
			     //可以取得
			     var fg = $(this).parents('tr').find('td:nth-child(9)').text();
			     //可以取得
			     var fgShot = $(this).parents('tr').find('td:nth-child(10)').text();
			     //可以取得
			     var offReb = $(this).parents('tr').find('td:nth-child(11)').text();
			     //可以取得
			     var defReb = $(this).parents('tr').find('td:nth-child(12)').text();
			     //可以取得
			     var assist = $(this).parents('tr').find('td:nth-child(13)').text();
			     //可以取得
			     var steal = $(this).parents('tr').find('td:nth-child(14)').text();
			     //可以取得
			     var blocks = $(this).parents('tr').find('td:nth-child(15)').text();
			     //可以取得
			     var turnover = $(this).parents('tr').find('td:nth-child(16)').text();
			     //可以取得
			     var personalFouls = $(this).parents('tr').find('td:nth-child(17)').text();
			     //可以取得
			     var points = $(this).parents('tr').find('td:nth-child(18)').text();
			     //可以取得
			     var startingPlayer = $(this).parents('tr').find('td:nth-child(19)').text();
		       	
		       	  $(this).parents('tr').find('td:nth-child(2)').html('<input placeholder="賽事"  type="text" value="'+ gameID +'" required>');
		       	  $(this).parents('tr').find('td:nth-child(3)').html('<input placeholder="球隊名稱"  type="text" value="'+ teamID +'" required>');
		       	  $(this).parents('tr').find('td:nth-child(4)').html('<input placeholder="比賽時間"  type="text" value="'+ gameTime +'" required>');
		          $(this).parents('tr').find('td:nth-child(5)').html('<input placeholder="二分"  type="text" value="'+ twoPoint +'" required>');
		          $(this).parents('tr').find('td:nth-child(6)').html('<input placeholder=""  type="text" value="'+ twoPointShot +'" required>');
		          $(this).parents('tr').find('td:nth-child(7)').html('<input placeholder=""  type="text" value="'+ threePoint +'" required>');
		          $(this).parents('tr').find('td:nth-child(8)').html('<input placeholder=""  type="text" value="'+ threePointShot +'" required>');
		          $(this).parents('tr').find('td:nth-child(9)').html('<input placeholder=""  type="text" value="'+ fg +'" required>');
		          $(this).parents('tr').find('td:nth-child(10)').html('<input placeholder=""  type="text" value="'+ fgShot +'" required>');
		          $(this).parents('tr').find('td:nth-child(11)').html('<input placeholder=""  type="text" value="'+ offReb +'" required>');
		          $(this).parents('tr').find('td:nth-child(12)').html('<input placeholder=""  type="text" value="'+ defReb +'" required>');
		          $(this).parents('tr').find('td:nth-child(13)').html('<input placeholder=""  type="text" value="'+ assist +'" required>');
		          $(this).parents('tr').find('td:nth-child(14)').html('<input placeholder=""  type="text" value="'+ steal +'" required>');
		          $(this).parents('tr').find('td:nth-child(15)').html('<input placeholder=""  type="text" value="'+ blocks +'" required>');
		          $(this).parents('tr').find('td:nth-child(16)').html('<input placeholder=""  type="text" value="'+ turnover +'" required>');
		          $(this).parents('tr').find('td:nth-child(17)').html('<input placeholder=""  type="text" value="'+ personalFouls +'" required>');
		          $(this).parents('tr').find('td:nth-child(18)').html('<input placeholder=""  type="text" value="'+ points +'" required>');
		          $(this).parents('tr').find('td:nth-child(19)').html('<input placeholder=""  type="text" value="'+ startingPlayer +'" required>');
		          
		          $(this).text('確定');
		       	  
		       	 
	           }
		       	else{
		       	  var gameID =   $(this).parents('tr').find('td:nth-child(2)>input').val();
		       	  var teamID =  $(this).parents('tr').find('td:nth-child(3)>input').val();
	 	       	  var gameTime = $(this).parents('tr').find('td:nth-child(4)>input').val();
	 	          var twoPoint = $(this).parents('tr').find('td:nth-child(5)>input').val();
			      var twoPointShot = $(this).parents('tr').find('td:nth-child(6)>input').val();
			      var threePoint = $(this).parents('tr').find('td:nth-child(7)>input').val();
			      var threePointShot = $(this).parents('tr').find('td:nth-child(8)>input').val();
			      var fg = $(this).parents('tr').find('td:nth-child(9)>input').val();
			      var fgShot = $(this).parents('tr').find('td:nth-child(10)>input').val();
			      var offReb = $(this).parents('tr').find('td:nth-child(11)>input').val();
			      var defReb = $(this).parents('tr').find('td:nth-child(12)>input').val();
			      var assist = $(this).parents('tr').find('td:nth-child(13)>input').val();
			      var steal = $(this).parents('tr').find('td:nth-child(14)>input').val();
			      var blocks = $(this).parents('tr').find('td:nth-child(15)>input').val();
			      var turnover = $(this).parents('tr').find('td:nth-child(16)>input').val();
			      var personalFouls = $(this).parents('tr').find('td:nth-child(17)>input').val();
			      var points = $(this).parents('tr').find('td:nth-child(18)>input').val();
			      var startingPlayer = $(this).parents('tr').find('td:nth-child(19)>input').val();
		       	  
		       		
			      $(this).parents('tr').find('td:nth-child(2)').text(gameID);
			      $(this).parents('tr').find('td:nth-child(3)').text(teamID);
			      $(this).parents('tr').find('td:nth-child(4)').text(gameTime);
			      $(this).parents('tr').find('td:nth-child(5)').text(twoPoint);
			      $(this).parents('tr').find('td:nth-child(6)').text(twoPointShot);
			      $(this).parents('tr').find('td:nth-child(7)').text(threePoint);
			      $(this).parents('tr').find('td:nth-child(8)').text(threePointShot);
			      $(this).parents('tr').find('td:nth-child(9)').text(fg);
			      $(this).parents('tr').find('td:nth-child(10)').text(fgShot);
			      $(this).parents('tr').find('td:nth-child(11)').text(offReb);
			      $(this).parents('tr').find('td:nth-child(12)').text(defReb);
			      $(this).parents('tr').find('td:nth-child(13)').text(assist);
			      $(this).parents('tr').find('td:nth-child(14)').text(steal);
			      $(this).parents('tr').find('td:nth-child(15)').text(blocks);
			      $(this).parents('tr').find('td:nth-child(16)').text(turnover);
			      $(this).parents('tr').find('td:nth-child(17)').text(personalFouls);
			      $(this).parents('tr').find('td:nth-child(18)').text(points);
			      $(this).parents('tr').find('td:nth-child(19)').text(startingPlayer);
			      
		       	  $(this).text('修改');
		       	  
		       	  
	     	   }    
	       });
		 }
		   
	  
	</script>
	

	<jsp:include page="/footer.jsp" />

</body>
</html>
