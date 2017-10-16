<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>EEIT97-第一組</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <style>
    	#search{
    		margin-bottom:10px;
    		margin-right:0px;
    		padding-right:0px;
    	}
    	#botton{
    		margin-left:0px;
    		padding-left:0px;
    	}
    </style>

</head>
<body>

<jsp:include page="/header.jsp" />
    <!--主文(開始)-->
    <div class="container">
        <div class="jumbotron">
            <!--表格(開始)-->
            <!--****************-->
            <!-- 第一列(開始) -->
            <!--****************-->
            <div class="row">
            	<div class="col-md-offset-9 col-md-2" id="search"> 
					<input class="form-control input-sm" type="text" placeholder="請輸入標籤內容">
				</div>
				<div class="col-md-1" id="botton">
					<input type="button" value="go">
				</div>
			</div>
			<br/>
            <div class="row">
                <!--第一列-左邊表格-格式_.col-md-8-->
                <div class="col-md-offset-1 col-md-7" id="video1">
                	<div class="embed-responsive embed-responsive-21by9">
  						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/l2ZuvLnHtmI" width="600" height="480" allowfullscreen></iframe>
					</div>
				</div>
                <!--第一列-右邊表格-格式_.col-md-4-->
              	<div class="col-md-offset-1 col-md-2" id="videoblock2">
              		<div class="embed-responsive embed-responsive-21by9">
  						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/l2ZuvLnHtmI" width="200" height="140" allowfullscreen></iframe>
  						<span height:"20">影片一</span>
					</div>
					<div class="embed-responsive embed-responsive-21by9">
  						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/l2ZuvLnHtmI" width="200" height="140" allowfullscreen></iframe>
						<span height:"20">影片二</span>
					</div>
					<div class="embed-responsive embed-responsive-21by9">
  						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/l2ZuvLnHtmI" width="200" height="140" allowfullscreen></iframe>
						<span height:"20">影片三</span>
					</div>
              	</div>
            </div>
           
        </div>
    </div>
    <!--主文(結束)-->

<jsp:include page="/footer.jsp" />  
        
</body>
</html>
