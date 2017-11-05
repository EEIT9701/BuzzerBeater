<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="date" scope="page" class="java.util.Date"/>
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
        <style>
        thead{
	      background-color: rgba(237, 125, 49, 0.8);
    	  color: #e9e9e9;
        }
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
            	<a href="<%=request.getContextPath() %>/index.jsp">
            		<span>首頁</span>
            	</a>
        	</span>&gt;
        	<span><span>賽季</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
    	
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
			        			<td><a href="<%=request.getContextPath() %>/groups/groupList.jsp?seasonID=${sVO.seasonID}">${sVO.seasonName}</a></td>
			        			<td><fmt:formatDate value="${sVO.seasonBeginDate}" pattern="yyyy-MM-dd"/></td>
			        			<td><fmt:formatDate value="${sVO.seasonEndDate}" pattern="yyyy-MM-dd"/></td>
			        			<c:choose>
			        				<c:when test="${date>sVO.signUpEnd}">
			        					<td><del><fmt:formatDate value="${sVO.signUpBegin}" pattern="yyyy-MM-dd HH:mm"/></del> 已截止</td>
			        					<td><del><fmt:formatDate value="${sVO.signUpEnd}" pattern="yyyy-MM-dd HH:mm"/></del> 已截止</td>
			        				</c:when>
			        				<c:otherwise>
			        					<td><fmt:formatDate value="${sVO.signUpBegin}" pattern="yyyy-MM-dd HH:mm"/></td>
			        					<td><fmt:formatDate value="${sVO.signUpEnd}" pattern="yyyy-MM-dd HH:mm"/></td>
			        				</c:otherwise>
			        			</c:choose>
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


// 	    $(document).ready(function() {
// 	    	$('#seasonList').DataTable();
	    	
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
	    	
	    	
// 	    	var td_odd_over={'background-color':'rgba(237, 125, 49, 0.18)'};
// 	    	var td_odd_out={'background-color':'rgba(202, 108, 44, 0.52)'};
// 	    	var td_even_over={'background-color':'rgba(237, 125, 49, 0.41)'};
// 	    	var td_even_out={'background-color':'rgba(223, 109, 32, 0.56)'};
// 	    	$('#seasonList').children('tbody').find('tr:nth-child(odd)').css(td_odd_over);
// 	    	$('#seasonList').children('tbody').find('tr:nth-child(odd)').mouseover(odd_over);
// 	    	$('#seasonList').children('tbody').find('tr:nth-child(odd)').mouseout(odd_out);
// 	    	$('#seasonList').children('tbody').find('tr:nth-child(even)').css(td_even_over);
// 	    	$('#seasonList').children('tbody').find('tr:nth-child(even)').mouseover(even_over);
// 	    	$('#seasonList').children('tbody').find('tr:nth-child(even)').mouseout(even_out);
// 	    	function odd_over(){
// 	    		$(this).css(td_odd_out);
// 	    	}
// 	    	function odd_out(){
// 	    		$(this).css(td_odd_over);
// 	    	}
// 	    	function even_over(){
// 	    		$(this).css(td_even_out);

// 	    	}
// 	    	function even_out(){
// 	    		$(this).css(td_even_over); 
// 	    	}
// 	    	});
	    </script>
    </body>

    </html>