<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="eeit.season.model.*"%>
<%@ page import="eeit.groups.model.*"%>
<%@ page import="eeit.gamemedia.model.*"%>
<%@ page import="java.util.*"%>
<%
	SeasonDAO_Hibernate dao = new SeasonDAO_Hibernate();
	Set<SeasonVO> list = dao.getAll();
	request.setAttribute("list", list);

	SeasonVO seasonVO = new SeasonVO();
	Set<GroupsVO> groupSet = seasonVO.getGroupsSet();
	request.setAttribute("groupSet", groupSet);
%>
<jsp:useBean id="gameMediaSvc" scope="page" class="eeit.gamemedia.model.GameMediaService" />
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>EEIT97-第一組</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/iEdit.css">
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/css/jquery.tagit.css" rel="stylesheet" type="text/css">
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/tag-it.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath() %>/js/iEdit.js"></script>

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
.tagit-choice{
    color: rgba(255,255,255,.8);
    background-color:green;
    display: inline-block;
	text-decoration: none;
    white-space: nowrap;
	border-radius:7px;
}
.ui-widget{	
	border:solid 1px gray;
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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />

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
        		<span>
        			<span>影片</span>
        		</span>
    		</div>
    		<!--上層導覽列(結束) -->
		
			<div class="row">
				<div class="col-md-4" id="topic">
					<h2 style="font-family:微軟正黑體;text-align:center;padding-left: 250px;
    					width: 800px;">影片專區</h2>
					</br>
				</div>
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
					<tbody id="tbody"><!--tbody標籤的內容由下方的jQuery作動態生成-->
					</tbody>
				</table>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">
					<h3>影片上傳</h3>
				</div>
			</div>
			<!--上傳的模態框 -->
			<div class="row">
				<button class="btn btn-warning" data-toggle="modal" data-target="#myModal" style="margin-left: 25px;">選擇檔案</button>
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
									<h5 style="margin-left:18px">請依序選擇賽季、分組及賽事</h5>
								</div>
								<div class="row">
									<!--連鎖查詢功能(1)賽季-->
									<div class="col-md-3">
										<select id="seasonlist" name="season1">
											<option id="seasondefault" selected>請選擇</option> <!--預設選項-->
											<!--賽季選擇寫死，由EL生成-->
    										<c:forEach var="list" items="${list}">
    											<option value="${list.seasonID}">${list.seasonName}</option>
  											</c:forEach>
    									</select>
									</div>
									<!--連鎖查詢功能(2)分組  由jQuery生成-->
									<div class="col-md-offset-1 col-md-2">
										<select id="grouplist" name="group1">
    									</select>
									</div>
								</div>
								</br>
								<!--連鎖查詢功能(3)賽事 由jQuery生成-->
								<div class="row">
									<div class="col-md-4">
										<select id="gamelist">
    									</select>
									</div>
								</div>
								</br>
								<div class=row>
									<!--上傳影片的觸發鈕-->
									<div class="col-md-3">
										<p>上傳影片</p>
										<input type="file" name="upload_file" id="upload_file">  
									</div>
								</div>
								</br>
								<div class="row">
									<div class="col-md-3">
										<p>上傳相片</p>
										<input type="file" id="file">
										<img id="result" type="hidden" >
									</div>
								</div>
								</br>
								 <div class="input-group">
            						<span class="input-group-addon">標題</span>
           						 	<input type="text" class="form-control" id="insertTitle" style="margin: 0px 0;" required>
        						 </div>
								</br>
								<div class="input-group">
									<span class="input-group-addon">備註</span> 
									<input type="text" class="form-control" id="insertDescriptions" style="margin: 0px 0;" required>
								</div>
								</br>
								<div>
   								<form>
   									<label style="padding-left:8px">標籤</label> 
            						<input name="tags" id="mySingleFieldTags" value="請自訂Tag">            						
       							</form>
								</div>
							</div>
							<div class="modal-footer">
								<!--確認按鈕觸發事件-->
								<button type="submit" class="btn btn-warning" data-dismiss="modal" id="insertConfirm" >確認上傳</button>
								<button type="button" class="btn btn-primary" data-dismiss="modal" id="insertCancel">取消</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		<jsp:include page="/footer.jsp" />
		</div>
	</div>
	<!--主文(結束)-->
	
	<!--預覽影片的模態框-->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel1" aria-hidden="true"
		data-backdrop="false">
		<!-- data-backdrop屬性設為false的時候，只有點選含data-dismiss="該模態框的id"的標籤才可以跳脫模態框 -->
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="x">&times;</button>
					<h4 class="modal-title" id="myModalLabel1" style="text-align:'center'">預覽影片</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<!--影片的標籤，內容由下方jQuery動態讀取-->
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
	 <!-- 刪除的模態框 -->
 	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
 		aria-labelledby="myModalLabel2" aria-hidden="true"
 		data-backdrop="false">
 		<div class="modal-dialog">
 			<div class="modal-content">
 				<div class="modal-header">
 					<button type="button" class="close" data-dismiss="modal"
 						aria-hidden="true" id="x">&times;</button>
 					<h4 class="modal-title" id="deleteTitle">警告!!!</h4>
 				</div>
 				<div class="modal-body">
 					<div class="row">
 						<!--內文由下方的jQuery動態產生-->
 						<h4 id="deleteNote" style="align:'center'"></h4>
 					</div>
 					</br>
 				</div>
 				<div class="modal-footer">
 					<button type="button" class="btn btn-danger deleteConfirm" data-dismiss="modal">確定</button>
 					<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
 				</div>
 			</div>
 		</div>
 	</div>
 	
	<script>
		$('#mySingleFieldTags').tagit({
			allowSpaces:true
		});
	</script>
	<script>
	
	$(function(){
		
		$("#file").change(function (e) {
				var img = e.target.files[0];

			if (!img.type.match('image.*')) {
   				alert("Whoops! That is not an image.");
   				return;
			}
			iEdit.open(img, true, function (res) {
   				$("#result").attr("src", res).css('width','100');
   				$("#result").show();
			});

      	});
		
 		loadTable();     //載入tbody內容
 		insert();        //上傳
 		function loadTable(){
 			//用getJSON取得資料庫的內容，和GameMedia.do的Servlet做聯結，傳給Servlet的action參數是getAll，藉此執行Servlet中的getAll方法取得資料，傳回的物件命名為data(見下方function內容)
			$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'getAll'},function(data){
				var docFrag = $(document.createDocumentFragment());   
				var tb = $('#tbody');
				tb.empty();
				//$.each語法執行迴圈生成，由data物件中抓取資料執行迴圈，index是索引數，gMVO則是自行命名的物件名稱
				$.each(data, function(index,gMVO){
	  				if(gMVO.mediaType =='video'){ //因為我的表格中的含有影片及照片，所以此頁加一層if標籤僅顯示影片
	  						  					
						var cell1 = $('<td></td>').text(gMVO.groupName).attr('id','group');  //抓取該筆gMVO物件中key=groupName的值，key的名稱設定請看Servlet中的getAll方法
						var cell2 = $('<td></td>').text(gMVO.teamA).attr('id','teamA');
						var cell3 = $('<td></td>').text(gMVO.teamB).attr('id','teamB');
						var cell4 = $('<td></td>').text(gMVO.mediaDate).attr('id','mediaDate');
						var cell5 = $('<td></td>').text(gMVO.mediasName).attr('id','mediasName');
						var cell6 = $('<td></td>').text(gMVO.descriptions).attr('id','descriptions');
						var cell7 = $('<td></td>');
						$.each(gMVO.tag,function(ind,tagArray){
							cell7.append(tagArray+' ');
						})
						var id = gMVO.mediaID; //將單筆資料當下的mediaID存入名叫id的變數中(因為mediaID在設計上是PK，對於後面很多方法有需要用到)
						var gameVideo = gMVO.gameVideo; //將單筆資料當下的gameVideo的存入名叫gameVideo的物件中
						var cell8 = $('<td><button type="button" class="btn btn-info testmodal" data-toggle="myModal1" data-target="myModal1" value="'+gameVideo+'" >預覽</button></td>');
						var cell9 = $('<td><button type="button" class="btn btn-warning updateData" id="'+id+'">修改</button></td>');
						var cell10 = $('<td><button type="button" class="btn btn-danger deleteData" data-toggle="myModal" data-target="dialog-4" value="'+id+'" >刪除</button></td>');
						
						var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10])				 				
						docFrag.append(row);       //把東西塞進docFrag裡
						tb.append(docFrag);	       //docFrag塞進表格
	  				}
	  				
				})
					buttons();  //按鈕的事件
	  				$(".testmodal").on('click',function(){   //事件處發顯示模態框(這裡是預覽的模態框)
	  					console.log("預覽")
	  			        $('#myModal1').modal('show');
	  					console.log("進入模態框")
                        var path01 = $(this).val();          //抓到上方cell8讀到的gameVideo內部的值，下一行就可以用字串串接方式給讀取影片的路徑
	  				    var videoNo1 = "<%=request.getContextPath()%>/videos/"+ path01;  
 	  				    $('#xxx').attr("src", videoNo1)      //給上方id=xxx的標籤新增src的屬性，值則是videoNo1變數中存取的
	  				})
	  				
					
	  				$('#table').DataTable({                  //dataTable存取的中文值
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
	  			
	  			$.fn.dataTable.ext.errMode = 'none'; 		 //不讓dataTable重整時顯示任何錯誤訊息
			});
 		}
	  		function buttons(){                              //所有的按鈕觸發的方法都寫在這
	  			$('.updateData').on('click',function(){      //修改鍵的事件
	  				if($(this).text() == '修改'){	
	  			         //取得預修改的欄位的資料
	  				    
	  				     var title = $(this).parents('tr').find('td:nth-child(5)').text();
	  				     var descriptions = $(this).parents('tr').find('td:nth-child(6)').text();
	  				 	 var tag = $(this).parents('tr').find('td:nth-child(7)').text();
	  			       	
	  			       	 $(this).parents('tr').find('td:nth-child(5)').html('<input placeholder="標題" type="text" value="'+ title +'">');
	  			       	 $(this).parents('tr').find('td:nth-child(6)').html('<input placeholder="備註" type="text" value="'+ descriptions +'">');
	  			       	 $(this).parents('tr').find('td:nth-child(7)').html('<input placeholder="標籤" type="text" value="'+ tag +'">');
	  			       
	  			       	 $(this).text('確定');	//將原先"修改"變為"確定"
	  			       	  
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
	  							//只是把修改資料傳回後台 不需回傳東西, 或做輸入與法判斷
	  							loadTable(); //重新載入table內容
	  		 	       	  })   
	  			       	  $(this).text('修改');	   //將按鈕內容改回"修改"    	  
	  			       	}

	  		       });
	  			
	  			$('.deleteData').on('click',function(){         //刪除鍵的事件
	  				var mediaID = $(this).val();                //抓到當下的mediaID，此處的this是指向cell10，裡面的value為我先放入的id，目的是為了傳值回去給Servlet藉以執行刪除方法
	  				$('#myModal2').modal('show');               //顯示模態框
	  				var title = $(this).parents('tr').find('td:nth-child(5)').text();    //抓到該筆資料的名稱存入title變數
	  				$('#deleteNote').text("即將刪除影片<"+title+">，刪除後不可復原，是否確定?")       //字串串接
		  		 	$('.deleteConfirm').on('click', function(){                          //確認刪除事件觸發
// 					  	var mediaID = $('.deleteData').val();
					  	//alert(memberID);
				  		//把輸入在欄位上的資料經過post傳送
	 	       	  		$.post('<%=request.getContextPath()%>/GameMedia.do', {'action':'delete', 'mediaID':mediaID}, function(datas){
							//刪除資料 不需回傳東西, 或做輸入與法判斷
				  		$('.deleteData').parents('tr').empty();  //把刪除的那一列移除，否則資料庫雖沒資料但網頁仍會顯現
	 	       	  		loadTable();                             //刪除後重新載入table內容
	 	       	 		})
			  		}) 
	  			})


	  		}
	  		function insert(){
	  			var season = null;
	  			var group = null;
	  			
	  			
	  			$('#seasonlist').change(function(){              //連鎖查詢(2)，藉由選擇完(1)以後觸發
	  				season = $('select[name="season1"]').val();  //抓到select標籤中含有name=season1的值
	  				$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'findGroupNameBySeasonID' , 'seasonID':season},function(data){
	  					$('#grouplist').empty();                 //把grouplist中的其他選項清空，如果不這麼做的話，使用者重選賽季時，剛剛賽季底下的選項仍舊會存在
	  					$('#grouplist').append($("<option></option>").text('請選擇'));   //載入第一選項為"請選擇"
	  					$.each(data, function(index,group){
 	  					//console.log(group);
	  						$('#grouplist').append($("<option></option>").attr("value",group.groupID).attr("id",group.groupID).text(group.groupName));
	  					})
	  				})
	  			})
	  			
	  			$('#grouplist').change(function(){               //連鎖查詢(3)，藉由選擇完(2)以後觸發
	  				group = $('select[name="group1"]').val();
  	  				//console.log(group)
	  				$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'getGameInformation' , 'groupID':group},function(data){
	  					$('#gamelist').empty();
	  					$('#gamelist').append($("<option></option>").text('請選擇'));
	  					$.each(data, function(index,game){	
	  						$('#gamelist').append($("<option></option>").attr("value",game.gameID).text(game.teamA+"VS"+game.teamB+" "+game.gameBeginDate));
	  					})
	  				})
	  				
	  			})
	  			
	  			$('#insertConfirm').click(function(){
	  				console.log("按下確定鍵")
	  				
	  				
	  				var gameID = $('#gamelist').val();
		  			var title = $('#insertTitle').val();
		  			var descriptions = $('#insertDescriptions').val();
		  			var tag = $('#mySingleFieldTags').val();
	  				var gamePhoto = $('#result').attr('src');
					
	  				$.post('<%=request.getContextPath()%>/GameMedia.do', {'action':'insertVideo','gameID':gameID,'mediasName':title,'descriptions':descriptions,'tag':tag, 'gamePhoto':gamePhoto}, function(datas){
	  				    console.log("傳值");
	  					loadTable();
	  				})
	  				season = null;
	  				group = null;
	  				
	  				//if select file then upload 
	  				
	  				 
	  			
	  			})
	  			$('#insertCancel').click(function(){
	  				console.log("移除")
	  				$('#insertTitle').val("");
	  				$('#insertDescriptions').val("");
	  				$('#result').hide().value("");	
	  			})
	  		}
	});

	
		
	</script>
		  			
	<script>
// 	  				$("#upload_file").on('change', uploadVideo);   
// 						function uploadVideo(event){   
// 	    				//file object   
// 	   					var gameVideo = event.target.files;   
// 	    				var data = new FormData(gameVideo);   
	    				
// 	  					console.log("影片上傳中")
// 	    				$.ajax({   
// 	            			url: '/BuzzerBeater/GameMedia.do?action=insertVideo',   
// 	            			type: 'POST',   
// 	            			data: data,
// 	            			processData: false, // Don't process the files   
// 	            			contentType: 'video/mp4', // Set content type to false as jQuery will tell the server its a query string request   
// 	        			});   
// 	  				} 
	</script>
	<script>
	var count = 0; 
	$('video').click(function(){   //讓影片按一下就播放，再按一下就停止     
		if(count%2==0){
			this.play();        
			count++; 
		}else{
			this.pause();
			count++; 
		}
	})
	</script>

	<jsp:include page="/footer_css.jsp" />  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
</body>
</html>
