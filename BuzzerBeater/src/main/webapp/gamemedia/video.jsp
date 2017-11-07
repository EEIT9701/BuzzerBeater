<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>EEIT97-第一組</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=request.getContextPath()%>/css/jquery.tagit.css" rel="stylesheet" type="text/css">
	<jsp:include page="/header_css.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/js/tag-it.js" type="text/javascript" charset="utf-8"></script>

    <!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
    
    <style>
		#video{
			width:105%;
			height:100%;
			margin-left:-15px;
			margin-right:-35px;
		}
		#mediaplayer{
			padding-left:-15px;
			width:100%;
			height:100%;
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
		#medias{
			height:100%;
			width:100%;
			text-align:left;
		}
		h3{
			text-align:center;
		}
		.videolist{
			 overflow-y: hidden;
		}
		.item { 
			width: 220px; 
			margin: 10px; 
			float: left; 
		}
		.card-img-top{
			width:98%;
			border:solid 3px black;
			border-radius:10px;
			object-fit:cover;
		}
		.card{
			width:25%;
		}
    </style>

</head>
<body>
<jsp:useBean id="gameMediaSvc" scope="page" class="eeit.gamemedia.model.GameMediaService" />
<jsp:include page="/header.jsp"/>
    <!--主文(開始)-->
    <div class="container">
        <div class="jumbotron">
            <!--表格(開始)-->
            <!--****************-->
            <!-- 第一列(開始) -->
            <!--****************-->
            <div class='row'>           	
				<h2 style="font-family:'DFKai-sb'">精彩賽事影音</h2>
			</div>
			<div class="row" style="background-color:#d0d0d0;height: 100%;">
                <div class="col-md-9" style="padding-left: 30px;">
            		<div class="row" id="mediaplayer" oncontextmenu="window.event.returnValue=false">            
                		<video controls id="video" src="<%=request.getContextPath()%>/videos/${gameMediaSvc.getOneGameMedia(6001).gameVideo}" type="video/mp4">
            			</video>
					</div>
				</div>
				<div class="col-md-3" id="videolist" style="height:300px">
					<h5 class="mName"></h5>
				</div>
           	</div>
           	</br>
           	<div class="row card">
           	
				<c:forEach var="gameMediaVO" items="${gameMediaSvc.all}">	
					<c:forEach var="gameMediaType" items="${gameMediaVO.mediaType}">
						<c:if test="${gameMediaType eq 'photo'}">
							<div class="card col-md-3">
								<img class="card-img-top img-rounded center-block" src="data:image/jpeg;base64,${gameMediaVO.gamePhoto}">
  								<div class="card-block">
    								<h4 class="card-title" align="center">${gameMediaVO.mediasName}</h4>
<!--     								</br> -->
    									<nobr>
    										<p class="card-text" align="center">
    											<img src="<%=request.getContextPath()%>/images/tag.png">
    											<c:forEach var="tag" items="${gameMediaVO.tag}">
    												<a class="tagFunction" href="">${tag}</a>
    											</c:forEach>
    										</p>
    									</nobr>
<!--     								</br> -->
  								</div>
							<div class="card-block">
  							</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
				</div>
			<jsp:include page="/footer.jsp" />  
        
    </div>
    </div>
    <!--主文(結束)-->
	
    <script>
	$(function(){
		getlist();
		tagFunction();
		function getlist(){
			$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'getAll'},function(data){
				var list = $('#videolist');
				list.empty();
				var cell1 = $('<h3 style="font-family:DFKai-sb">影片列表</h3>');
				list.append(cell1);
				
				$.each(data, function(index,gMVO){
					if(gMVO.mediaType =='video'){
						var id = gMVO.mediaID.substr(1,4);
						
						var name = $('<h4 class="videolist1" style="fontfamily:"DFKai-sb" margin:10px 0px 10px 0px; background-color:white;"></h4>').text(gMVO.mediasName).attr('id',''+id+'');
						list.append(name);
						
						$('.videolist1').on('click',function(){
							var videoId = $(this).attr('id')
							$('#video').attr('src','<%=request.getContextPath()%>/videos/'+videoId+'.mp4');
							$(this).css('font-size','120%');
						}).hover(function(){
							$(this).css({'font-size':'200%','padding-left':'10px'});
						}, function() {
							$(this).css({'font-size':'150%','padding-left':'-10px'});
						})
					}
				})
			})
		}
		function tagFunction(){
			$('.tagFunction').click(function(){
				var tag = $('this').text()
				$.post('<%=request.getContextPath()%>/GameMedia.do',{'action':'searchTag','tag':tag},function(data){
					$('.card').empty();
				})
			})
		}
	});

	
		
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
</body>
</html>