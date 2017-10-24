<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <title>Season</title>
        <jsp:include page="/header_css.jsp" />
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<!-- 網頁內容 -->
			<h1>${locationVO.locationName}</h1>
			
			<p>${locationVO.locationAddr}</p>
			
			<a href="https://www.google.com.tw/maps/place/${loc.locationName}" target="blank">
				<img src="http://maps.googleapis.com/maps/api/staticmap?size=1000x550&markers=color:red%7c
				label=${locationVO.locationMark}&key=AIzaSyAS6MEEhoGriCE2up42rqcoLK01YTwQoUA&format=jpg-baseline">
			</a>
		
			<!-- 網頁內容END -->
	    	<jsp:include page="/footer.jsp" />
	    </div><!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>