<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
  	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
   	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
   	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
   	
    <title>Season</title>
</head>

<body>
	<jsp:include page="/header.jsp" />
	
	<div class="container">
		<div class="col-md-12">

		    
		        	<form action="<%=request.getContextPath()%>/ImgServlet" method="post" enctype="multipart/form-data">
		        		<input type="file" name="locationPhoto">
		        		<input type="hidden" name="action" value="TEST_IMG">
		        		<input type="submit" value="送出">
		        	</form>
		        
		        <img src="data:image/png;base64,${base64code}">
		   
		</div>
	</div>
	    
	    
	<jsp:include page="/footer.jsp" />
</body>

</html>