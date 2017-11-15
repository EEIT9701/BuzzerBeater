<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	eeit.locationinfo.model.LocationinfoService svc = new eeit.locationinfo.model.LocationinfoService();
	Integer locationID = Integer.valueOf(request.getParameter("locationID"));
	request.setAttribute("locationVO", svc.findByID(locationID));
%>

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <jsp:include page="/header_css.jsp" />
        <jsp:include page="/font_css.jsp" />
        <style>
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
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="jumbotron">
			
			<!--上層導覽列(開始) -->
			<div id="pathWay">
	        	<span>
	            	<a class="blockUI" href="<%=request.getContextPath() %>/index.jsp">
	            		<span>首頁</span>
	            	</a>
	        	</span>
	        	&gt;
	        	<span>
	            	<span>場地列表</span>
	        	</span>
	        	&gt;
	        	<span>${locationVO.locationName}</span>
	    	</div>
	    	<!--上層導覽列(結束) -->
			<!-- 網頁內容 -->
			
			<h1>${locationVO.locationName}</h1>
			
			<p>${locationVO.locationAddr}</p>
			
			<br>
			
			<div class="col-md-offset-2">
				<a href="https://www.google.com.tw/maps/place/${locationVO.locationName}" target="blank">
					<img src="http://maps.googleapis.com/maps/api/staticmap?size=1000x550&markers=color:red%7c
					label=${locationVO.locationMark}&key=AIzaSyAS6MEEhoGriCE2up42rqcoLK01YTwQoUA&format=jpg-baseline">
				</a>
			</div>
		
		
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>