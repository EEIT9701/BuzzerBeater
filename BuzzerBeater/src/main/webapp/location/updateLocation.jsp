<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="eeit.memberinfo.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="eeit.season.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="seasonSvc" scope="page" class="eeit.season.model.SeasonService" />
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>EEIT97-第一組</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>

<style>
#st1 {
	padding: 30px;
	background-color: #1E90FF;
}
#table1{
	font-weight:bold;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
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

	<!--主文(結束)-->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>
	
</body>
</html>