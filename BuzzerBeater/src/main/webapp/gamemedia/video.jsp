<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>EEIT97-第一組</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="/header_css.jsp" />
    <!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
    
    <style>
		#video{
			width:105%;
			height:100%;
			padding-bottom:30px;
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
			<h2>精彩賽事影音</h2>
			<div class="row" style="background-color: rgba(220, 175, 171, 0.37);height: 489px;">
                <div class="col-md-10" style="padding-left: 30px;">
            		<div class="row" id="mediaplayer" oncontextmenu="window.event.returnValue=false">            
                		<video controls id="video" src="<%=request.getContextPath()%>/videos/${gameMediaSvc.getOneGameMedia(6001).gameVideo}" type="video/mp4">
            			</video>
					</div>
				</div>
				<div class="col-md-2" id="videolist">
<!-- 					<h3>精選影片</h3> -->
					<h5 class="mName"></h5>
				</div>
           	</div>
				
           	<div class="row">
				<c:forEach var="gameMediaSvc" items="${gameMediaSvc.all}">
					<div>
					</div>
				</c:forEach>
           	</div>
			<jsp:include page="/footer.jsp" />  
        
    </div>
    </div>
    <!--主文(結束)-->
	<jsp:include page="/footer_css.jsp" />        
	
    <script>
//     $(function(){
//     	$('#medias').click(function(){
// 			//抓到上方cell8讀到的gameVideo內部的值
           
// 	  		//字串串接路徑
<%-- 	  		var videoNo1 = "<%=request.getContextPath()%>/videos/"+"002.mp4"; --%>
// 			$('#video').attr("src", videoNo1)
// 		}) 
//     })
	$(function(){
		
		getlist();
		
		function getlist(){
			$.getJSON('<%=request.getContextPath()%>/GameMedia.do', {'action':'getAll'},function(data){
				var list = $('#videolist');
				list.empty();
				var cell1 = $('<h3>影片列表</h3>');
				list.append(cell1);
				
				$.each(data, function(index,gMVO){
					if(gMVO.mediaType =='video'){
						var mediaID = gMVO.mediaID;
						var name = $('<h5 style="margin:10px 0px 10px 0px; background-color:red;"></h5>').text(gMVO.mediasName).attr('id',''+mediaID+'');
						list.append(name);
					}
				})
			})
		}
	})	  				
		
    </script>
</body>
</html>