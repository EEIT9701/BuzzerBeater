<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh" class="no-js">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/htmleaf-demo.css">
<title>報隊</title>
<jsp:include page="/header_css.jsp" />
<jsp:include page="/font_css.jsp" />
<style type="text/css">
		 .demo{
			padding: 2em 0;
			background: linear-gradient(to right, #2c3b4e, #4a688a, #2c3b4e);
              }
              .progress{
                  height: 25px;
                  background: #262626;
                  padding: 5px;
                  overflow: visible;
                  border-radius: 20px;
                  border-top: 1px solid #000;
                  border-bottom: 1px solid #7992a8;
                  margin-top: 50px;
              }
              .progress .progress-bar{
                  border-radius: 20px;
                  position: relative;
                  animation: animate-positive 2s;
              }
              .progress .progress-value{
                  display: block;
                  padding: 3px 7px;
                  font-size: 13px;
                  color: #fff;
                  border-radius: 4px;
                  background: #191919;
                  border: 1px solid #000;
                  position: absolute;
                  top: -40px;
                  right: -10px;
              }
              .progress .progress-value:after{
                  content: "";
                  border-top: 10px solid #191919;
                  border-left: 10px solid transparent;
                  border-right: 10px solid transparent;
                  position: absolute;
                  bottom: -6px;
                  left: 26%;
              }
              .progress-bar.active{
                  animation: reverse progress-bar-stripes 0.40s linear infinite, animate-positive 2s;
              }
              @-webkit-keyframes animate-positive{
                  0% { width: 0; }
              }
              @keyframes animate-positive{
                  0% { width: 0; }
              }
	</style>
</head>

<body>
	<jsp:include page="/header.jsp" />

	<div class="container">
		<div class="jumbotron">
			<!-- 網頁內容 -->
		<div class="row">
	                <div class="col-md-offset-3 col-md-6">
	                    <div class="progress">
	                        <div id="divValue" class="progress-bar progress-bar-info progress-bar-striped active" style="width: 0%;">
	                            <div class="progress-value">0%</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div>
	            <button id="Button01">上一步</button>
	            <button id="Button02">下一步</button>
	            </div>
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
		</div>
	</div>
	
	
	<jsp:include page="/footer_css.jsp" />
	<script src="<%=request.getContextPath()%>/js/index_1.js"></script>
<script>
$(function(){
	

	
	$('#Button01').on('click', function(){
		var currentWidth = $("#divValue").width();
// 		alert(currentWidth)
		if(currentWidth!=0){
		currentWidth = currentWidth - 121;
		}
		var currentWidth01 = currentWidth/484 *100;
		currentWidthString = currentWidth01 + '%';
// 		alert(currentWidthString)
		$("#divValue").width(currentWidth);
		$("#divValue>div").text(currentWidthString);
	})
	
	$('#Button02').on('click', function(){
		var currentWidth = $("#divValue").width();
// 		alert(currentWidth)
		if(currentWidth<484){
		currentWidth = currentWidth + 121;
		}
		var currentWidth01 = currentWidth/484 *100;
		currentWidthString = currentWidth01 + '%';
// 		alert(currentWidthString)
		$("#divValue").width(currentWidth);
		$("#divValue>div").text(currentWidthString);
	})
	
})
</script>
</body>

</html>
