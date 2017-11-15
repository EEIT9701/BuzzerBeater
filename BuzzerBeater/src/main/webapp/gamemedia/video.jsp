<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=request.getContextPath()%>/css/jquery.tagit.css" rel="stylesheet" type="text/css">
	<jsp:include page="/header_css.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
	

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
		#h3{
			text-align:center;
			font-family: DFKai-sb;
			background-color: #f34c2a;
			width: 115%;
			margin-left: -21px;
			border-top-right-radius: 10px;
			border-top-left-radius: 10px;
			color: white;
			box-shadow: inset 0 0 20px 1px #eb0000;
		}
		.videolist{
			 overflow-y: hidden;
		}
		.card-img-top{
			width:98%;
			border:solid 3px black;
			border-radius:10px;
			object-fit:cover;
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
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
  		var js, fjs = d.getElementsByTagName(s)[0];
  		if (d.getElementById(id)) return;
  		js = d.createElement(s); js.id = id;
  		js.src = 'https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.11';
  		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<jsp:useBean id="gameMediaSvc" scope="page" class="eeit.gamemedia.model.GameMediaService" />
<jsp:include page="/header.jsp"/>
    <!--主文(開始)-->
    <div class="container">
        <div class="jumbotron">
        
        	<!--上層導覽列(開始) -->
			<div id="pathWay">
        		<span>
            		<a class="blockUI" href="<%=request.getContextPath() %>/index.jsp">
            			<span>首頁</span>
            		</a>
        		</span>&gt;
        		<span>
            		<span>影音</span>
        		</span>&gt;
        		<span>
        			<span>影片</span>
        		</span>
    		</div>
    		<!--上層導覽列(結束) -->

            <!--表格(開始)-->
            <!--****************-->
            <!-- 第一列(開始) -->
            <!--****************-->
            <div class='row'>           	
				<h2 style="font-family:'DFKai-sb';text-align:center;">精彩賽事影音</h2>
			</div>
			<div class="row" style="background-color:#d6aaaa42;height: 100%;">
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
           	<div class="addTagPhoto row">
				<c:forEach var="gameMediaVO" items="${gameMediaSvc.all}">	
					<c:forEach var="gameMediaType" items="${gameMediaVO.mediaType}">
						<c:if test="${gameMediaType eq 'video'}">
							<div class="card col-md-3">
								<img class="card-img-top img-rounded center-block changeVideo" id="${gameMediaVO.gameVideo}" src="data:image/jpeg;base64,${gameMediaVO.gamePhoto}">
  								<div class="card-block">
    								<h4 class="card-title" align="center">${gameMediaVO.mediasName}</h4>
<!--     								</br> -->
    									<p class="card-text">
    										<img src="<%=request.getContextPath()%>/images/tag.png">
    										<c:forEach var="tag" items="${gameMediaVO.tag}">
    											<button class="btn-success btn-sm tagFunction" style="border-radius:5px;">${tag}</button>
    										</c:forEach>
    									</p>
<!--     								</br> -->
  								</div>
								<div class="card-block">
  								</div>
							</div>	
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
			
			</br>
			<div class='row'>           	
				<h2 style="font-family:'DFKai-sb'; margin:10px; text-align:center;" >Facebook精彩影片</h2>
			</div>
			<div class="row" align="center">
			<div style="margin-right:30px;" class="fb-video" data-href="https://www.facebook.com/beater.buzzer.562/videos/104365737008086/" data-width="450" data-show-text="false"><blockquote cite="https://www.facebook.com/beater.buzzer.562/videos/104365737008086/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/beater.buzzer.562/videos/104365737008086/"></a><p>關鍵時刻就是要球給老大!!!</p>由 <a href="#" role="button">Buzzer Beater</a> 貼上了 2017年11月14日</blockquote></div>
			<div class="fb-video" data-href="https://www.facebook.com/beater.buzzer.562/videos/104142513697075/" data-width="450" data-show-text="false"><blockquote cite="https://www.facebook.com/beater.buzzer.562/videos/104142513697075/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/beater.buzzer.562/videos/104142513697075/"></a><p>最新賽事影片</p>由 <a href="#" role="button">Buzzer Beater</a> 貼上了 2017年11月14日</blockquote></div>
			</div>
			<jsp:include page="/footer.jsp" />  
        <jsp:include page="/footer_css.jsp" /> 
    </div>
    </div>
    <!--主文(結束)-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-blockUI-1.33.js"></script>
	<script>
		$('.changeVideo').on('click',function(){
			var video = $(this).attr('id');
			$('#video').attr('src','<%=request.getContextPath()%>/videos/'+video);
		})
	</script>
    <script>
	$(function(){
		getlist();
		tagFunction();
		
		
		function getlist(){
			$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'getAll'},function(data){
				var list = $('#videolist');
				list.empty();
				var cell1 = $('<h3 id="h3" style="font-family:DFKai-sb">影片列表</h3>');
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
			$(document).on('click','.tagFunction',function(){
				var tag = $(this).text()
				$.post('<%=request.getContextPath()%>/GameMedia.do',{'action':'searchTag','tag':tag},function(data){
					$('.addTagPhoto').empty();
						console.log(data)
					$.each(JSON.parse(data),function(ind,taglist){
						var cell1 = $('<div></div>').addClass("card col-md-3");
						var cell2 = $('<img class="card-imp-top img rounded center-block changeVideo">').attr("src","data:image/jpeg;base64,"+taglist.gamePhoto).attr("id", taglist.gameVideo).css({'width':'98%','border':'solid 3px black','border-radius':'10px','object-fit':'cover'});
						var cell3 = $('<div></div>').addClass("card-block");
						var cell4 = $('<h4 class="card-title"></h4>').text(taglist.mediasName);
						var cell5 = $('<p></p>').addClass("card-text").css('align','center');
						var cell6 = $('<img src="<%=request.getContextPath()%>/images/tag.png">');
						var cell7 = ''; 
	
						$.each(taglist.tag,function(index,tagArray){
							console.log(tagArray)
							cell7 = cell7 + '<button class="btn-success btn-sm tagFunction" style="border-radius:5px; margin-left:3px">'+tagArray+'</button>'+' ';
						})

						cell5.append([cell6, cell7]);
						cell3.append([cell4, cell5]);
						cell1.append([cell2, cell3]);
						
						var row = $('<div></div>').append(cell1)
						$('.addTagPhoto').append(row);
					})
					$('.changeVideo').on('click',function(){

						var video = $(this).attr('id');
						$('#video').attr('src','<%=request.getContextPath()%>/videos/'+video);
					})
				})
			})	
			
			
		}
			
		$(document).on('click','.tagFunction',function(){
			$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
			setTimeout(function(){
				$.unblockUI()
			},500);
		})
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
	       
</body>
</html>