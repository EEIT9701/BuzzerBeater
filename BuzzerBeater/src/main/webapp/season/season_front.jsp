<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="eeit.memberinfo.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberInfoService dao = new MemberInfoService();
	List<MemberInfoVO> list = dao.getAll();
	pageContext.setAttribute("list", list);
%>
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
<jsp:include page="/font_css.jsp" />
</head>
<body>

	<jsp:include page="/header.jsp" />
	<!--主文(開始)-->
	<div class="container">
	  <div class="jumbotron">
		<br>
		<br>
		<!--****************-->
		<!-- 第二列(開始) -->
		<!--****************-->
		<div class="row">
                <!--第一列-左邊表格-格式_.col-md-8-->
                <div class="賽季">
                      <h2 align="center">賽季 </h2>
                      
                    <table class="table table-bordered" id="example">
                        <thead>
                           <tr align='center' valign='middle' id="table1">
                                <td>賽季名稱</td>
                                <td>賽季開始時間</td>
                                <td>賽季結束時間</td>
                                <td>報名開始時間</td>
                                <td>報名截止時間</td>
                                <td>狀態</td>  
                            </tr>
                        </thead>
                        
                        <tbody>
			        	<c:forEach var="sVO" items="${seasonSvc.all}">
			        		<tr align='center' valign='middle'>
			        			<td><a href="<%=request.getContextPath() %>/Season.do?action=GET_GROUPS&seasonID=${sVO.seasonID}">${sVO.seasonName}</a></td>
			        			<td>${sVO.seasonBeginDate}</td>
			        			<td>${sVO.seasonEndDate}</td>
			        			<td>${sVO.signUpBegin}</td>
			        			<td>${sVO.signUpEnd}</td>
			        			<td></td>
			        		</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
		    </div>
	    </div>
               
	    <jsp:include page="/footer.jsp" />
                </div>
	</div>
<jsp:include page="/footer_css.jsp" />
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