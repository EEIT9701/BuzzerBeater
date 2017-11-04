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

<!DOCTYPE >
<html>
<head>
<title>Buzzer Beater</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<!-- ***套用新的模太框檔案*** -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/jdialog.min.css">	
<style>
#st1 {
	padding: 30px;
	background-color: #FFAA33;
}
thead{
background-color: #d62d67;
    	  color: #e9e9e9;
}
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
</head>
<body style="line-height: 12px;">

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


			</div>
		</div>
		<br> <br>
		<div><button type="button" class="btn btn-danger" data-toggle="JDialog" data-target="dialog-4" id="button_insert">新增</button></div>
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
								<th>出場時間(分)</th>
								<th>二分命中</th>
								<th>二分出手</th>
								<th>三分命中</th>	
								<th>三分出手</th>					                           						                                  
								<th>罰球命中</th>
								<th>罰球出手</th>
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
	<jsp:include page="/footer.jsp" />		
		</div>	
	</div>
			</div>

	<jsp:include page="/footer_css.jsp" />
	<!--主文(結束)-->
<!-- 模太框 -->

	<div  class="jDialog" id="dialog-4">
		<div class="content">
		<div>
				<button class="button" data-dismiss="JDialog" id="jDialogButton" style=" margin-top: 0px; border-top-width: 2px; border-right-width: 2px;
    border-bottom-width: 2px; border-left-width: 2px; padding-bottom: 6px; padding-top: 6px; ">確定</button>
			</div>
		 <H5>新增球員數據</H5>
		 	     球員<input id="PersonalDataVO_playerID" placeholder="playerID" type="text" value="" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
		                 賽事<input id="PersonalDataVO_gameID" placeholder="gameID" type="text" value="" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
	                     球隊名稱<input id="PersonalDataVO_teamID"  placeholder="teamID" type="text" value="" required style="width:150px;padding-bottom: 5px;padding-top: 5px;"><br>
	                     比賽時間<input id="PersonalDataVO_gameTime" placeholder="gameTime" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
	                     二分命中<input id="PersonalDataVO_twoPoint"  placeholder="twoPoint" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
		         二分出手<input id="PersonalDataVO_twoPointShot"  placeholder="twoPointShot"  type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;"><br>
		        三分命中<input id="PersonalDataVO_threePoint" placeholder="threePoint" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
		        三分出手<input id="PersonalDataVO_threePointShot"  placeholder="threePointShot" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
	                    罰球命中<input id="PersonalDataVO_fg"  placeholder="fg"  type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;"><br>
		        罰球出手<input id="PersonalDataVO_fgShot" placeholder="fgShot" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
	                    進攻籃板<input id="PersonalDataVO_offReb"  placeholder="offReb" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
		        防守籃板<input id="PersonalDataVO_defReb"  placeholder="defReb"  type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;"><br>
			     助攻<input id="PersonalDataVO_assist" placeholder="assist" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
			     抄截<input id="PersonalDataVO_steal"  placeholder="steal" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
			     阻攻<input id="PersonalDataVO_blocks"  placeholder="blocks"  type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;"><br>
			     失誤<input id="PersonalDataVO_turnover" placeholder="turnover" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
			     犯規<input id="PersonalDataVO_personalFouls"  placeholder="personalFouls" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;" >
			     得分<input id="PersonalDataVO_points"  placeholder="points"  type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;"><br>
			     先發<input id="PersonalDataVO_startingPlayer" placeholder="startingPlayer" type="text" value="0" required style="width:150px;padding-bottom: 5px;padding-top: 5px;">
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/dist/jdialog.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
	   $(function(){
		   loadProduct('Get_All_PersonalData_JSON');
		   
		 //模太框相關按鈕
		  $(".JDialog").jDialog({		
			     skinClassName : 'demo',
			     animationType : 'flip',
			     allowOverlay :   false
	       });
		 
		  $('#jDialogButton').on('click', function(){
				//抓input 的值
// 				var acc =  $('#MemberInfoVO_acc').val();
// 				var name = $('#MemberInfoVO_name').val();
// 				var auth = $('#MemberInfoVO_auth').val();
                var playerID = $('#PersonalDataVO_playerID').val();
				var gameID = $('#PersonalDataVO_gameID').val();
				var teamID = $('#PersonalDataVO_teamID').val();
				var gameTime = $('#PersonalDataVO_gameTime').val();
				var twoPoint = $('#PersonalDataVO_twoPoint').val();
				var twoPointShot = $('#PersonalDataVO_twoPointShot').val();
				var threePoint = $('#PersonalDataVO_threePoint').val();
				var threePointShot = $('#PersonalDataVO_threePointShot').val();
				var fg = $('#PersonalDataVO_fg').val();
				var fgShot = $('#PersonalDataVO_fgShot').val();
				var offReb = $('#PersonalDataVO_offReb').val();
				var defReb = $('#PersonalDataVO_defReb').val();
				var assist = $('#PersonalDataVO_assist').val();
				var steal = $('#PersonalDataVO_steal').val();
				var blocks = $('#PersonalDataVO_blocks').val();
				var turnover = $('#PersonalDataVO_turnover').val();
				var personalFouls = $('#PersonalDataVO_personalFouls').val();
				var points = $('#PersonalDataVO_points').val();
				var startingPlayer = $('#PersonalDataVO_startingPlayer').val();
				if(gameTime!= '' & twoPoint!= ''){ 
						//把input 清空
					$('#PersonalDataVO_playerID').val('');	
				    $('#PersonalDataVO_gameID').val('');
					$('#PersonalDataVO_teamID').val('');				
					$('#PersonalDataVO_gameTime').val('');
					$('#PersonalDataVO_twoPoint').val('');
					$('#PersonalDataVO_twoPointShot').val('');
					$('#PersonalDataVO_threePoint').val('');
					$('#PersonalDataVO_threePointShot').val('');
					$('#PersonalDataVO_fg').val('');
					$('#PersonalDataVO_fgShot').val('');
					$('#PersonalDataVO_offReb').val('');
					$('#PersonalDataVO_defReb').val('');
					$('#PersonalDataVO_assist').val('');
					$('#PersonalDataVO_steal').val('');
					$('#PersonalDataVO_blocks').val('');
					$('#PersonalDataVO_turnover').val('');
					$('#PersonalDataVO_personalFouls').val('');
					$('#PersonalDataVO_points').val('');
					$('#PersonalDataVO_startingPlayer').val('');
		
					//把輸入的資料包裝成JSON格式字串, 給post傳送用
				      var PersonalDataVO = JSON.stringify({ 'playerID':playerID,
				    	  'gameID':gameID,'teamID':teamID,
				          'gameTime':gameTime, 'twoPoint':twoPoint,
				    	  'twoPointShot':twoPointShot, 'threePoint':threePoint, 'threePointShot':threePointShot, 'fg':fg, 'fgShot':fgShot,
				    	  'offReb':offReb, 'defReb':defReb, 'assist':assist, 'steal':steal, 'blocks':blocks,
				    	  'turnover':turnover, 'personalFouls':personalFouls, 'points':points, 'startingPlayer':startingPlayer 
				    	  })
					$.post('/BuzzerBeater/PersonalData.do', {'action':'INSERT', 'PersonalDataVO':PersonalDataVO}, function(datas){
						//只是把新增資料傳回後台 不需回傳東西, 或做輸入與法判斷
						alert("新增成功");
						location.reload();
			       	}) 
			    }else {
			    	alert("新增失敗");
			    }
				
			});
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
	  
	   
		function buttonFunction(){
			
			  $('.btn-primary').on('click', function(){          	    		         
		       	if($(this).text() == '修改'){
		       	   
		       	//可以取得
				 var playerID = $(this).parents('tr').find('td:nth-child(1)').text();	
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
		       	  
// 			      $(this).parents('tr').find('td:nth-child(1)').html('<input placeholder="賽事"  type="text" value="'+ playerID +'" required>');
// 		       	  $(this).parents('tr').find('td:nth-child(2)').html('<input placeholder="賽事"  type="text" value="'+ gameID +'" required>');
// 		       	  $(this).parents('tr').find('td:nth-child(3)').html('<input placeholder="球隊名稱"  type="text" value="'+ teamID +'" required>');
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
		          var playerID = $(this).parents('tr').find('td:nth-child(1)').text();
		       	  var gameID =  $(this).parents('tr').find('td:nth-child(2)').text();
		       	  var teamID =  $(this).parents('tr').find('td:nth-child(3)').text();
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
		       	  
// 			      $(this).parents('tr').find('td:nth-child(1)').text(playerID);	
// 			      $(this).parents('tr').find('td:nth-child(2)').text(gameID);
// 			      $(this).parents('tr').find('td:nth-child(3)').text(teamID);
                  
			      
			    	if(twoPoint<=twoPointShot && threePoint<=threePointShot && fg<=fgShot){ 
			    		$(this).parents('tr').find('td:nth-child(4)').text(gameTime);
					     /*  var twoPointt=$(this).parents('tr').find('td:nth-child(5)').text(twoPoint); */
					      $(this).parents('tr').find('td:nth-child(5)').text(twoPoint);			      
					     /*  var twoPointShott=$(this).parents('tr').find('td:nth-child(6)').text(twoPointShot);
					      if(twoPointt>twoPointShott){
					    	  alert("投球數不能大於出手喔");
					      } */
					      
					     
						    	 
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
					      
					      //把輸入的資料包裝成JSON格式字串, 給post傳送用
					      var PersonalDataVO = JSON.stringify({ 
					    	  'playerID':playerID, 'gameID':gameID, 'teamID':teamID, 'gameTime':gameTime, 'twoPoint':twoPoint,
					    	  'twoPointShot':twoPointShot, 'threePoint':threePoint, 'threePointShot':threePointShot, 'fg':fg, 'fgShot':fgShot,
					    	  'offReb':offReb, 'defReb':defReb, 'assist':assist, 'steal':steal, 'blocks':blocks,
					    	  'turnover':turnover, 'personalFouls':personalFouls, 'points':points, 'startingPlayer':startingPlayer 
					    	  })
			      //把輸入在欄位上的資料經過post傳送
		 	      $.post('/BuzzerBeater/PersonalData.do', {'action':'UPDATE', 'PersonalDataVO':PersonalDataVO}, function(datas){
		 	              //只是把修改資料傳回後台 不需回傳東西, 或做輸入與法判斷
		 	         })   
			  
		 	        $(this).text('修改');
		       	}else{
		       		alert("數值太大了喔");
		    		 
		       		
		       	} 
			      
			      
		       	}
	     	   });    
			  //刪除鍵
			  $('.btn-warning').on('click', function(){
				 // alert("確定要刪除嗎?");
				  if(confirm("確定要刪除嗎?")){
				  var playerID = $(this).parents('tr').find('td:nth-child(1)').text();
		       	  var gameID =  $(this).parents('tr').find('td:nth-child(2)').text();
		       	  var teamID =  $(this).parents('tr').find('td:nth-child(3)').text();
	 	       /* 	  var gameTime = $(this).parents('tr').find('td:nth-child(4)').text();
	 	          var twoPoint = $(this).parents('tr').find('td:nth-child(5)').text();
			      var twoPointShot = $(this).parents('tr').find('td:nth-child(6)').text();
			      var threePoint = $(this).parents('tr').find('td:nth-child(7)').text();
			      var threePointShot = $(this).parents('tr').find('td:nth-child(8)').text();
			      var fg = $(this).parents('tr').find('td:nth-child(9)').text();
			      var fgShot = $(this).parents('tr').find('td:nth-child(10)').text();
			      var offReb = $(this).parents('tr').find('td:nth-child(11)').text();
			      var defReb = $(this).parents('tr').find('td:nth-child(12)').text();
			      var assist = $(this).parents('tr').find('td:nth-child(13)').text();
			      var steal = $(this).parents('tr').find('td:nth-child(14)').text();
			      var blocks = $(this).parents('tr').find('td:nth-child(15)').text();
			      var turnover = $(this).parents('tr').find('td:nth-child(16)').text();
			      var personalFouls = $(this).parents('tr').find('td:nth-child(17)').text();
			      var points = $(this).parents('tr').find('td:nth-child(18)').text();
			      var startingPlayer = $(this).parents('tr').find('td:nth-child(19)').text(); */
				  
				  //把輸入的資料包裝成JSON格式字串, 給post傳送用
			      var PersonalDataVO = JSON.stringify({ 
			    	  'playerID':playerID, 'gameID':gameID, 'teamID':teamID,
			    	  })
				  //把輸入在欄位上的資料經過post傳送
	 	       	  $.post('<%=request.getContextPath()%>/PersonalData.do', {'action':'DELETE', 'PersonalDataVO':PersonalDataVO}, function(datas){
						//刪除資料 不需回傳東西, 或做輸入與法判斷
	 	       	  })
				  $(this).parents('tr').empty();
	 	       //	location.reload()
				  }
			  })
			  
		 
	       }	   
	   })
	   
	</script>
	
</body>
</html>
