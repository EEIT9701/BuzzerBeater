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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>EEIT97-第一組</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="/header_css.jsp" />
    <!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/iEdit.css">
    <link href="<%=request.getContextPath()%>/css/jquery.tagit.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/js/tag-it.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/iEdit.js"></script>
	<style>
	#x {
		margin-right: -20px;
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
	</style>
</head>
<body>
<jsp:include page="/header.jsp"/>
    <!--主文(開始)-->
    <div class="container">
        <div class="jumbotron">
        	<div class="row">
        		<div class="col-md-4" id="topic">
					<h1>照片專區</h1>
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
            </br>
            <div class="row">
            	<table class="table table-bordered" id="table">
  						<thead>
    						<tr align='center' valign='middle' id="thead">
      							<td><nobr>分組</nobr></td>
      							<td>賽事</td>
      							<td>最後上傳/修改時間</td>
      							<td>標題</td>
      							<td>備註</td>
      							<td>標籤</td>
      							<td></td>
      							<td></td>
      							
    						</tr>
  						</thead>
  						<tbody>
  							<c:forEach var="gameMediaSvc" items="${gameMediaSvc.all}">
								<c:forEach var="gameMediaType" items="${gameMediaSvc.mediaType}">
									<c:if test="${gameMediaType eq 'photo'}">
  										<tr align='center' valign='middle'>
      										<td>${gameMediaSvc.gamesVO.groupsVO.groupName}</td>
      										<td>${gameMediaSvc.gamesVO.teamAVO.teamName} </br>VS</br> ${gameMediaSvc.gamesVO.teamBVO.teamName}</td>
      										<td>${gameMediaSvc.mediaDate}</td>
      										<td>${gameMediaSvc.mediasName}</td>
      										<td>${gameMediaSvc.descriptions}</td>
      										<td>${gameMediaSvc.tag}</td>
      										<td>
      											<Form method="post" action="<%=request.getContextPath() %>/GameMedia.do" id="update">
      												<button type="submit" class="btn btn-info">檢視</button>
      												<input type="hidden" name="mediaID" value="${gameMediaSvc.mediaID}"> 
                                           			<input type="hidden" name="action" value="getOnePhotoForUpdate">
                                       			</Form>
                                    		</td>
                                    		<td>
                                        		<Form method="post" action="<%=request.getContextPath() %>/GameMedia.do" id="delete">    
      												<button type="submit" class="btn btn-danger">刪除</button>
													<input type="hidden" name="mediaID" value="${gameMediaSvc.mediaID}"> 
                                           			<input type="hidden" name="action" value="deletePhoto">
												</Form>
      										</td>
    									</tr>
    								</c:if>
  								</c:forEach>
  							</c:forEach>
  						</tbody>
				</table>
				</br>
				<div class="row">
				<button class="btn btn-warning" data-toggle="modal" data-target="#myModal" style="margin-left:15px">選擇檔案</button>
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
									<!--連鎖查詢功能(1)賽季-->
									<div class="col-md-3">
										<select id="seasonlist" name="season1">
											<option selected>請選擇</option> <!--預設選項-->
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
    								<div class=col-md-3>
										<input type="file" name="upload_file" id="file">
										<img id="result" src="">  
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
            						<input name="tags" id="mySingleFieldTags" value="Curry, Harden , Paul, Leonard">            						
       							</form>
								</div>
							</div>
							<div class="modal-footer">
								<!--確認按鈕觸發事件-->
								<button type="submit" class="btn btn-warning" data-dismiss="modal" id="insertConfirm" >確認上傳</button>
								<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
							</div>
						</div>
					</div>
				</div>
			</div>
            </div>
			<jsp:include page="/footer.jsp" />  
            
        </div>
    </div>
    <!--主文(結束)-->
	<script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
	<script>
		$('#mySingleFieldTags').tagit({
			allowSpaces:true
		});
	</script>
	<script>
	$(document).ready(function () {
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
		$.fn.dataTable.ext.errMode = 'none';
		insert();
		
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
  			
  			 $("#file").change(function (e) {
                 var img = e.target.files[0];

                 if (!img.type.match('image.*')) {
                    alert("Whoops! That is not an image.");
                    return;
                 }
                 iEdit.open(img, true, function (res) {
                    $("#result").attr("src", res);
                    $("#photo").attr("value", res);
                 });

           	});
  			
  			$('#insertConfirm').click(function(){
  				console.log("按下確定鍵")
  				var gameID = $('#gamelist').val();
	  			var title = $('#insertTitle').val();
	  			var descriptions = $('#insertDescriptions').val();
	  			var tag = $('#mySingleFieldTags').val();
  				 
				
  				$.post('<%=request.getContextPath()%>/GameMedia.do', {'action':'insertVideo','gameID':gameID,'mediasName':title,'descriptions':descriptions,'tag':tag}, function(datas){
  				    console.log("傳值");
  					loadTable();
  				})
  				season = null;
  				group = null;	
  				//if select file then upload 
  			})
  			
  			
  		}
	});
	</script>

	<jsp:include page="/footer_css.jsp" />        
   	<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
</body>
</html>
