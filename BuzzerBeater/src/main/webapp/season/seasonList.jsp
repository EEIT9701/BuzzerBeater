<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="eeit.season.model.*"%> --%>
<%-- <%@ page import="java.util.*"%> --%>

<%
// 	SeasonService dao = new SeasonService();
// 	Set<HashMap<String,Object>> set = dao.getAll();
// 	pageContext.setAttribute("set", set);
%>

<jsp:useBean id="seasonSvc" scope="page" class="eeit.season.model.SeasonService" />

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
    	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
        <title>Season</title>
        
    </head>
    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
		<div class="jumbotron">
			<div class="col-md-12">
		        <h2>賽季列表</h2>

		        <table class="table table-bordered" id="seasonList">
		            <thead>
			            <tr>
			                <td>賽季名稱</td>
			                <td>賽季開始日期</td>
			                <td>賽季結束日期</td>
			                <td>報名開始日期</td>
			                <td>報名結束日期</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="sVO" items="${seasonSvc.all}">
			        		<tr>
			        			<td><a href="<%=request.getContextPath() %>/Season.do?action=GET_GROUPS&seasonID=${sVO.seasonID}">${sVO.seasonName}</a></td>
			        			<td>${sVO.seasonBeginDate}</td>
			        			<td>${sVO.seasonEndDate}</td>
			        			<td>${sVO.signUpBegin}</td>
			        			<td>${sVO.signUpEnd}</td>
			        		</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
		    </div>
	    	<jsp:include page="/footer.jsp" />
	    </div>
	    </div>
	    
	    
	    <jsp:include page="/footer_css.jsp" />
	    
	    <script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	    <script>
	    $(document).ready(function() {
	    	$('#seasonList').DataTable();
	    	
// 	    	var td_thead_over={'background-color':'#032f4f',
// 	    					   'color': '#fff'};
// 	    	var td_thead_out={'background-color':'#006bb6',
// 	    		    		  'box-shadow': 'inset 0 20px 0 -16px #efaa10'};
// 	    	$('#seasonList').children('thead').find('tr').css(td_thead_over);
// 	    	$('#seasonList').children('thead').find('tr').mouseover(thead_over);
// 	    	$('#seasonList').children('thead').find('tr').mouseout(thead_out);
// 	    	function thead_over(){
// 	    		$(this).css(td_thead_out);
// 	    	}
// 	    	function thead_out(){
// 	    		$(this).css(td_thead_over);
// 	    	}
	    	
	    	
	    	var td_odd_over={'background-color':'#f9f9f9'};
	    	var td_odd_out={'background-color':'rgb(208, 207, 207)'};
	    	var td_even_over={'background-color':'#eaeaea'};
	    	var td_even_out={'background-color':'rgb(197, 196, 197)'};
	    	$('#seasonList').children('tbody').find('tr:nth-child(odd)').css(td_odd_over);
	    	$('#seasonList').children('tbody').find('tr:nth-child(odd)').mouseover(odd_over);
	    	$('#seasonList').children('tbody').find('tr:nth-child(odd)').mouseout(odd_out);
	    	$('#seasonList').children('tbody').find('tr:nth-child(even)').css(td_even_over);
	    	$('#seasonList').children('tbody').find('tr:nth-child(even)').mouseover(even_over);
	    	$('#seasonList').children('tbody').find('tr:nth-child(even)').mouseout(even_out);
	    	function odd_over(){
	    		$(this).css(td_odd_out);
	    	}
	    	function odd_out(){
	    		$(this).css(td_odd_over);
	    	}
	    	function even_over(){
	    		$(this).css(td_even_out);

	    	}
	    	function even_out(){
	    		$(this).css(td_even_over); 
	    	}
	    	});
	    </script>
    </body>

    </html>