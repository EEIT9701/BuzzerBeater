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
	<script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
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
			background-color:#BEBEBE;
			padding-left:-15px;
			width:100%;
			height:100%;
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
            <div class="row">
            	
            	
            </div>
            <div class="row">
            	<div class="col-md-4" style="font-family:'DFKai-sb'"><h2>精采賽事照片</h2></div>	
			</div>
		
			<br/>
            <div class="row" id="mediaplayer">

            	<!--廣告輪播(開始)-->
            	<!--800x600(50萬像素),1024x768(80萬像素),1280x960(130萬像素)-->
            	<div class="carousel slide" id="myCarousel">
                	<ol class="carousel-indicators">
                    	<li class="active" data-slide-to="0" data-target="#myCarousel"></li>
                    	<li data-slide-to="1" data-target="#myCarousel" class=""></li>
                    	<li data-slide-to="2" data-target="#myCarousel" class=""></li>
                    	<li data-slide-to="3" data-target="#myCarousel" class=""></li>
                	</ol>
                	<div class="carousel-inner">
                		<c:forEach var="gameMediaSvc" items="${gameMediaSvc.all}" varStatus="loop">
                			<c:forEach var="gameMediaType" items="${gameMediaSvc.mediaType}">
                				<c:if test="${gameMediaType eq 'photo'}">
                    				<div class='item'>
                        				<img class="img-responsive center-block"  src="data:image/jpeg;base64,${gameMediaSvc.gamePhoto}">
                    				</div>
                    			</c:if>
                    		</c:forEach>
                		</c:forEach>   
                	</div>

                	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    	<span class="glyphicon glyphicon-chevron-left"></span>
                	</a>
                	<a class="right carousel-control" href="#myCarousel" data-slide="next">
                    	<span class="glyphicon glyphicon-chevron-right"></span>
                	</a>
            	</div>
            <!--廣告輪播(結束)-->
           	</div>
           	</br>
           	<div class="addTagPhoto">
				<c:forEach var="gameMediaVO" items="${gameMediaSvc.all}">	
					<c:forEach var="gameMediaType" items="${gameMediaVO.mediaType}">
						<c:if test="${gameMediaType eq 'photo'}">
							<div class="card col-md-3">
								<img class="card-img-top img-rounded center-block" src="data:image/jpeg;base64,${gameMediaVO.gamePhoto}">
  								<div class="card-block">
    								<h4 class="card-title" align="center">${gameMediaVO.mediasName}</h4>
    									<p class="card-text" align="center">
    										<img src="<%=request.getContextPath()%>/images/tag.png">
    										<c:forEach var="tag" items="${gameMediaVO.tag}">
    											<a class="tagFunction">${tag}</a>
    										</c:forEach>
    									</p>
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
			</div>
			<jsp:include page="/footer.jsp" />  
        </div>
    </div>
    <!--主文(結束)-->
    <script>
    
    	$(document).ready(function(){
    		$('.item:first').addClass('active');
    	})
    
    
    </script>

<jsp:include page="/footer_css.jsp" />        
</body>
</html>
