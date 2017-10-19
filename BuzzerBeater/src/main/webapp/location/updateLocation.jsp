<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
  	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
   	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
   	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
   	
    <title>場地維護</title>
</head>

<body>
	<jsp:include page="/header.jsp" />
	
	<div class="container">
		<div class="col-md-12">
			<form action="<%=request.getContextPath()%>/Locationinfo.do" method="post">
				<input name="action" value="UPDATE_LOCATION" type="hidden">
				<input name="locationID" value="${locVO.locationID}" type="hidden">
			    <table class="table table-bordered">
			        <thead>
			        </thead>
			
			        <tbody>
			        	<tr>
			        		<td>場地名稱</td>
			        		<td><input type="text" name="locationName" value="${locVO.locationName}"></td>
			        	</tr>
			        	<tr>
			        		<td>場地地址</td>
			        		<td><input type="text" name="locationAddr" value="${locVO.locationAddr}"></td>
			        	</tr>
			        	<tr>
			        		<td>
								<a href="https://www.google.com.tw/maps/place/${loc.locationName}" target="blank">
									<img src="http://maps.googleapis.com/maps/api/staticmap?size=400x250&markers=color:red%7clabel=${loc.locationName}&key=AIzaSyAS6MEEhoGriCE2up42rqcoLK01YTwQoUA&format=jpg-baseline">
								</a>
							</td>
			        	</tr>
			        </tbody>
			    </table>
			    <input type="submit" value="確認">
			    <input type="reset" value="重置">
		    </form>
		</div>
	</div>
	    
	    
	<jsp:include page="/footer.jsp" />
</body>

</html>