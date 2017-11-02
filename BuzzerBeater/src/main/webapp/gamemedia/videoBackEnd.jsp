<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="eeit.season.model.*"%>
<%@ page import="eeit.groups.model.*"%>
<%@ page import="eeit.gamemedia.model.*"%>
<%@ page import="java.util.*"%>
<%
	// 	SeasonService seasonSvc = new SeasonService();
	// 	Set<HashMap<String, Object>> list = seasonSvc.getAll();
	SeasonDAO_Hibernate dao = new SeasonDAO_Hibernate();
	Set<SeasonVO> list = dao.getAll();
	request.setAttribute("list", list);

	SeasonVO seasonVO = new SeasonVO();
	Set<GroupsVO> groupSet = seasonVO.getGroupsSet();
	request.setAttribute("groupSet", groupSet);

	// 	GameMediaService gameMediaSvc = new GameMediaService();
	// 	List<GameMediaVO> media = gameMediaSvc.getAll();

	// 	request.setAttribute("gameMediaSvc", media);
%>
<jsp:useBean id="gameMediaSvc" scope="page" class="eeit.gamemedia.model.GameMediaService" />
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>EEIT97-第一組</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<!-- ***套用新的模太框檔案*** -->
<script src="<%=request.getContextPath()%>/dist/jdialog.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/jdialog.min.css">	

<style>
#myModalLabel {
	width: 200px
}

#myModalLabel1 {
	width: 200px
}

#myModalLabel2 {
	width: 200px
}

#myModalLabel3 {
	width: 200px
}

#table {
	table-layout: fixed;
}

#uploadButton {
	margin: 5px;
}

#cancelButton {
	margin: 5px
}

#tabletopic {
	margin-left: 3px
}

#thead {
	font-weight: bold;
}

#upload {
	height: 5px;
	padding: 17px;
	line-height: 1px;
}

#video {
	width: 400px;
	padding-top: 20px;
	padding-left: 0px;
	padding-right: 100px;
}

#update {
	margin: 0px;
}

#delete {
	margin: 0px;
}

#topic {
	margin-left: 0px;
	padding-left: 0px;
}

#x {
	margin-right: -20px;
}

span {
	margin-top: -20px;
}
video::-internal-media-controls-download-button {
    display:none;
}

video::-webkit-media-controls-enclosure {
    overflow:hidden;
}

video::-webkit-media-controls-panel {
    width: calc(100% + 30px); 
}
#deleteNote{
	text-align:center;
}
#deleteTitle{
	text-align:center;
}
.form-control{
	margin-top:-8px;
}
#table{
	width: 100%;
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
		<div class="jumbotron">
			<div class="row">
				<div class="col-md-4" id="topic">
					<h1>影片專區</h1>
					</br>
					<c:if test="${not empty errorMsgs}">
					請修正以下錯誤:
                    <ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
			</div>
			<div class="row">
				<!-- 				<div class="col-md-2"> -->
				<!-- 					<div class="dropdown"> -->
				<!--     					<button type="button" class="btn btn-warning dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">賽季<span class="caret"></span> -->
				<!--     					</button> -->
				<!--     					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"> -->
				<%--         					<c:forEach var="list" items="${list}"> --%>
				<%--         						<li>${list.seasonName}</li> --%>
				<%--         					</c:forEach> --%>
				<!--     					</ul> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-md-2"> -->
				<!-- 					<div class="dropdown"> -->
				<!--     					<button type="button" class="btn btn-danger dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">賽季<span class="caret"></span> -->
				<!--     					</button> -->
				<!--     					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"> -->
				<%--         					<c:forEach var="set" items="${list}"> --%>
				<%--         						<c:forEach var="g" items="${set.groupsSet}"> --%>
				<%--         							<li>${g.groupName}</li> --%>
				<%--         						</c:forEach> --%>
				<%--         					</c:forEach> --%>
				<!--     					</ul> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- 				<div class="col-md-2"> -->
				<!-- 					<div class="dropdown"> -->
				<!--     					<button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">球隊<span class="caret"></span> -->
				<!--     					</button> -->
				<!--     					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"> -->
				<%--         					<c:forEach var="list" items="${list}"> --%>
				<%--         						<li>${list.seasonName}</li> --%>
				<%--         					</c:forEach> --%>
				<!--     					</ul> -->
				<!-- 					</div> -->
				<!-- 				</div> -->

			</div>
			</br>
			<div class="row">
				<table class="table table-bordered" id="table" style="width:100%">
					<thead>
						<tr align='center' valign='middle' id="thead">
							<td><nobr>分組</nobr></td>
							<td>主場</td>
							<td>客場</td>
							<td>最後上傳/修改時間</td>
							<td>標題</td>
							<td>備註</td>
							<td>標籤</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>

			<div class="row">
				<div class="col-md-3">
					<h3>影片上傳</h3>
				</div>
			</div>
			<div class="row">
				<button class="btn btn-warning" id="789" data-toggle="modal"
					data-target="#myModal">選擇檔案</button>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					data-backdrop="false">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true" id="x">&times;</button>
								<h4 class="modal-title" id="myModalLabel" style="text-align:'center'">檔案上傳</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-3">
										<select id="seasonlist" name="season1">
											<option selected>請選擇</option>
    										<c:forEach var="list" items="${list}">
    											<option value="${list.seasonID}">${list.seasonName}</option>
  											</c:forEach>
    									</select>
									</div>
									<div class="col-md-offset-1 col-md-2">
										<select id="grouplist" name="group1">
    									</select>
									</div>
								</div>
								</br>
								<div class="row">
									<div class="col-md-4">
										<select id="gamelist">
    									</select>
									</div>
								</div>
								</br>
								<div class=row>
    								<div class=col-md-3>
										<input type="file" class="file" value="影片">
									</div>
								</div>
								</br>
								 <div class="input-group input-group">
            						<span class="input-group-addon">標題</span>
           						 	<input type="text" class="form-control" id="insertTitle" style="margin: 0px 0;" required >
        						 </div>
								</br>
								<div class="input-group">
									<span class="input-group-addon">備註</span> 
									<input type="text" class="form-control" id="insertDescriptions" style="margin: 0px 0;" required>
								</div>
								</br>
								<div class="input-group">
									<span class="input-group-addon">標籤</span> 
									<input type="text" class="form-control" id="insertTag" placeholder="請用以,分格標籤     ex:張君雅,單手爆扣" style="margin: 0px 0;" required>
								</div>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning"
									data-dismiss="modal" id="insertConfirm" >確認上傳</button>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">取消</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		<jsp:include page="/footer.jsp" />
		</div>
	</div>
	<!--主文(結束)-->

	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel1" aria-hidden="true"
		data-backdrop="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="x">&times;</button>
					<h4 class="modal-title" id="myModalLabel1" style="text-align:'center'">預覽影片</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<video controls id="xxx" src="" oncontextmenu="return false" style="height:50%; width:100%"> 
						</video>
					</div>
					</br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">離開</button>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/footer_css.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
	
	$(function(){
		
 		loadTable();
 		insert();
 		function loadTable(){
			$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'getAll'},function(data){
				var docFrag = $(document.createDocumentFragment());
				var tb = $('#tbody');
				tb.empty();
				
				$.each(data, function(index,gMVO){
	  				if(gMVO.mediaType =='video'){
	 					//console.log(data);
						var cell1 = $('<td></td>').text(gMVO.groupName).attr('id','group');
						var cell2 = $('<td></td>').text(gMVO.teamA).attr('id','teamA');
						var cell3 = $('<td></td>').text(gMVO.teamB).attr('id','teamB');
						var cell4 = $('<td></td>').text(gMVO.mediaDate).attr('id','mediaDate');
						var cell5 = $('<td></td>').text(gMVO.mediasName).attr('id','mediasName');
						var cell6 = $('<td></td>').text(gMVO.descriptions).attr('id','descriptions');
						var cell7 = $('<td></td>').text(gMVO.tag).attr('id','tag');
						var id = gMVO.mediaID;
						var gameVideo = gMVO.gameVideo;
						var cell8 = $('<td><button type="button" class="btn btn-info testmodal" data-toggle="myModal1" data-target="dialog-4" value="'+gameVideo+'" >預覽</button></td>');
						var cell9 = $('<td><button type="button" class="btn btn-warning updateData" id="'+id+'">修改</button></td>');
						var cell10 = $('<td><button type="button" class="btn btn-danger" data-toggle="myModal" data-target="dialog-4" >刪除</button></td>');
						
						var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10])				 				
						docFrag.append(row);
						tb.append(docFrag);	
	  				}
	  				
				})
					buttons();
	  				$(".testmodal").on('click',function(){
	  					//事件處發顯示模態框
	  			        $('#myModal1').modal('show');
	  					//抓到上方cell8讀到的gameVideo內部的值
                        var path01 = $(this).val(); 
	  					//字串串接路徑
	  				    var videoNo1 = "<%=request.getContextPath()%>/videos/"+ path01;
 	  				    $('#xxx').attr("src", videoNo1)
	  				})
	  				
					
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
 		}
	  		function buttons(){
	  			$('.updateData').on('click',function(){
	  				if($(this).text() == '修改'){	
	  			         //取得預修改的欄位的資料
	  				     
	  			         
	  				     var title = $(this).parents('tr').find('td:nth-child(5)').text();
	  				     var descriptions = $(this).parents('tr').find('td:nth-child(6)').text();
	  				 	 var tag = $(this).parents('tr').find('td:nth-child(7)').text();
	  			       	
	  			       	 $(this).parents('tr').find('td:nth-child(5)').html('<input placeholder="標題" type="text" value="'+ title +'">');
	  			       	 $(this).parents('tr').find('td:nth-child(6)').html('<input placeholder="備註" type="text" value="'+ descriptions +'">');
	  			       	 $(this).parents('tr').find('td:nth-child(7)').html('<input placeholder="標籤" type="text" value="'+ tag +'">');
	  			       
	  			       	 $(this).text('確定');	
	  			       	  
	  		           } 
	  			       	else{ //按下確定鍵 
	  			       		
	  			       	  //把input, 顯示在table欄位上的值取出	
	  			       	 
	  					  var mediaID = $(this).attr('id');
	  		 	       	  var title = $(this).parents('tr').find('td:nth-child(5)>input').val();
	  		 	       	  var descriptions = $(this).parents('tr').find('td:nth-child(6)>input').val();
	  		 	     	  var tag = $(this).parents('tr').find('td:nth-child(7)>input').val();
	  		    		 	          
	  		 	          //把輸入的資料包裝成JSON格式字串, 給post傳送用
	  		 	       	  var dataStr = JSON.stringify({ "mediaID":mediaID, "title":title, "descriptions":descriptions, "tag":tag})
	  		              //將 顯示在table欄位改回tr,並把值填入 
	  		 	       	
	  		 			  $(this).parents('tr').find('td:nth-child(5)').html(title);
	  		 			  $(this).parents('tr').find('td:nth-child(6)').html(descriptions);
	  		 			  $(this).parents('tr').find('td:nth-child(7)').html(tag);
	  		 	       	  
	  		 			  //把輸入在欄位上的資料經過post傳送
	  		 	       	  $.post('<%=request.getContextPath()%>/GameMedia.do', {'action':'Update', "mediaID":mediaID, "title":title, "descriptions":descriptions, "tag":tag}, function(datas){
	  							console.log(mediaID)//只是把修改資料傳回後台 不需回傳東西, 或做輸入與法判斷
	  		 	       	  })   
	  			       	  $(this).text('修改');	       	  
	  			       	}

	  		       });
	  			
	  			$('.deleteData').on('click',function(){
	  				$('#myModal2').modal('show');
	  				var title = $(this).parents('tr').find('td:nth-child(5)').text();
	  				$('#deleteNote').text("即將刪除影片<"+title+">，刪除後不可復原，是否確定?")
		  		 	$('.deleteConfirm').on('click', function(){
					  	var mediaID = $('.deleteData').val();
					  	console.log(mediaID);
					  	//alert(memberID);
				  		//把輸入在欄位上的資料經過post傳送
	 	       	  		$.post('<%=request.getContextPath()%>/GameMedia.do', {'action':'delete', 'mediaID':mediaID}, function(datas){
							//刪除資料 不需回傳東西, 或做輸入與法判斷
	 	       	 		})
				  		$('.deleteData').parents('tr').empty();
			  		}) 
	  			})


	  		}
	  		function insert(){
	  			var season = null;
	  			var group = null;
	  			
	  			
	  			$('#seasonlist').change(function(){
	  				season = $('select[name="season1"]').val(); 
	  				$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'findGroupNameBySeasonID' , 'seasonID':season},function(data){
	  					$('#grouplist').empty();
	  					$('#grouplist').append($("<option></option>").text('請選擇'));
	  					$.each(data, function(index,group){
// 	  						console.log(group);
	  						$('#grouplist').append($("<option></option>").attr("value",group.groupID).attr("id",group.groupID).text(group.groupName));
	  					})
	  				})
	  			})
	  			
	  			$('#grouplist').change(function(){
	  				group = $('select[name="group1"]').val();
//  	  				console.log(group)
	  				$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'getGameInformation' , 'groupID':group},function(data){
	  					$('#gamelist').empty();
	  					$('#gamelist').append($("<option></option>").text('請選擇'));
	  					$.each(data, function(index,game){	
	  						$('#gamelist').append($("<option></option>").attr("value",game.gameID).text(game.teamA+"VS"+game.teamB+" "+game.gameBeginDate));
	  					})
	  				})
	  				
	  			})
	  			var gameID = $('#gamelist').val();
	  			var title = $('#insertTitle').text();
	  			var descriptions = $('#insertDescriptions').text();
	  			var tag = $('#insertTag').text();
	  			
	  			
	  			$('#insertConfirm').click(function(){
	  				$.post('<%=request.getContextPath()%>/GameMedia.do', {'action':'insertVideo','gameID':gameID,'mediasName':title,'descriptions':descriptions,'tag':tag}, function(datas){
						//主鍵mediaID由Identity生成、mediaType、mediaDate均在Servlet設定，其餘接收後回傳
 	       	 			console.log('我傳出去囉')
	  				})	
	  			})
	  		}
	});

	
	
		
	</script>
	<script>
	var count = 0;
	$('video').click(function(){
		if(count%2==0){
			this.play();
			count++; 
		}else{
			this.pause();
			count++; 
		}
	})
	</script>

</body>
</html>
