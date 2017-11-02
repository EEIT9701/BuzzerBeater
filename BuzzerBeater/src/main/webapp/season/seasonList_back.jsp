<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="seasonSvc" scope="page" class="eeit.season.model.SeasonService" />
<jsp:useBean id="date" scope="page" class="java.util.Date"/>

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    	
		
        <title>Season</title>
        <jsp:include page="/header_css.jsp" />
        <jsp:include page="/font_css.jsp" />
        <style>
        thead{
	      background-color: #d62d67;
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
            		<span>使用者功能</span>
            	</a>
        	</span>&gt;
        	<span><span>賽季管理</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
			<!-- 網頁內容 -->
			<div class="col-md-12">
		        <h2>賽季列表</h2>
		        <h4><a href="<%=request.getContextPath() %>/season/addSeason.jsp" class="btn btn-primary">新增賽季</a></h4>
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
			        			<td><a href="<%=request.getContextPath() %>/Season.do?action=TO_GROUPS_BACK&seasonID=${sVO.seasonID}">${sVO.seasonName}</a></td>
			        			<td><fmt:formatDate value="${sVO.seasonBeginDate}" pattern="yyyy-MM-dd"/></td>
			        			<td><fmt:formatDate value="${sVO.seasonEndDate}" pattern="yyyy-MM-dd"/></td>
			        			<c:choose>
			        				<c:when test="${date>sVO.signUpEnd}">
			        					<td><del><fmt:formatDate value="${sVO.signUpBegin}" pattern="yyyy-MM-dd HH:mm"/></del>已截止</td>
			        					<td><del><fmt:formatDate value="${sVO.signUpEnd}" pattern="yyyy-MM-dd HH:mm"/></del>已截止</td>
			        				</c:when>
			        				<c:otherwise>
			        					<td><fmt:formatDate value="${sVO.signUpBegin}" pattern="yyyy-MM-dd HH:mm"/></td>
			        					<td><fmt:formatDate value="${sVO.signUpEnd}" pattern="yyyy-MM-dd HH:mm"/></td>
			        				</c:otherwise>
			        			</c:choose>
			        			<td>
			        				<form action="<%=request.getContextPath() %>/Season.do" method="post">
			        					<input type="submit" class="btn btn-warning updateData"value="修改">
			        					<input type="hidden" name="action" value="GET_ONE_TO_UPDATE">
			        					<input type="hidden" name="seasonID" value="${sVO.seasonID}">
			        				</form>
			        			</td>
			        			<td>
			        				<form action="<%=request.getContextPath() %>/Season.do" method="post">
			        					<input type="submit" class="btn btn-danger" value="刪除">
			        					<input type="hidden" name="action" value="DELETE_SEASON">
			        					<input type="hidden" name="seasonID" value="${sVO.seasonID}">
			        				</form>
			        			</td>
			        		</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
		    </div>
		
			<!-- 網頁內容END -->
	    	<jsp:include page="/footer.jsp" />
	    	</div>
	    </div><!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>