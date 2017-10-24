<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="eeit.locationinfo.model.*" %>
<%@ page import="java.util.*" %>

<%
	LocationinfoService dao = new LocationinfoService();
	Set<LocationinfoVO> locSet = dao.getAll();
	pageContext.setAttribute("locSet",locSet);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
  	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
   	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
   	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    
	<title>場地列表</title>
</head>

<body>
	<jsp:include page="/header.jsp" />
	<div class="container">
		<div class="col-md-12">
		
			<table border='1'>
				<thead>
				</thead>
				<tbody>
					<c:forEach var="loc" items="${locSet}">
						<tr>
							<td>${loc.locationName}</td>
							<td>${loc.locationAddr}</td>
							<td>
								<a href="https://www.google.com.tw/maps/place/${loc.locationName}" target="blank">
									<img src="http://maps.googleapis.com/maps/api/staticmap?size=400x250&markers=color:red%7clabel=${loc.locationMark}&key=AIzaSyAS6MEEhoGriCE2up42rqcoLK01YTwQoUA&format=jpg-baseline">
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>