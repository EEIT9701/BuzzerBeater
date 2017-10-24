<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>EEIT97-第一組</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <style>
    	#search-box {
  			font-size: 13px;
  			width: 120px;
  			background: #E6E6E6 url('<%=request.getContextPath()%>/images/search.png') no-repeat 3px 3px;
  			padding: 3px 3px 3px 22px;
  			margin-right:50px;
  			margin-top:30px;
  			border: 1px solid black;
  			border-radius: 50px;
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
            	<div class="col-md-offset-1 col-md-4"><h2>精彩賽事影音</h2></div>
				<div class="col-md-offset-5 col-md-2">
					<input id="search-box" type="text" name="search-box" />
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
