<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	try {
		eeit.season.model.SeasonService seasonSvc = new eeit.season.model.SeasonService();
		Integer seasonID = Integer.valueOf(request.getParameter("seasonID"));
		pageContext.setAttribute("seasonVO", seasonSvc.findBySeasonID(seasonID));
		// 若有錯誤導向首頁可避免500
	} catch(Exception e) {
		response.sendRedirect(request.getContextPath());
	}
%>
<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
        	<span>
            	<a href="<%=request.getContextPath() %>/season/seasonList.jsp">
            		<span>賽季</span>
            	</a>
        	</span>&gt;
        	<span><span>${seasonVO.seasonName}</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
			<div class="col-md-12">
				<h2>${seasonVO.seasonName}</h2>
				<h6 align="center">${seasonVO.seasonBeginDate} ~ ${seasonVO.seasonEndDate}</h6>
				<p>${seasonVO.descriptions}</p>
				
				<c:forEach var="groupsSet" items="${seasonVO.groupsSet}">
					<c:if test="${not empty groupsSet.gamesSet}">
						<h2>${groupsSet.groupName}</h2>
						<table class="table table-bordered test" id="season_group">
							<thead>
								<tr>
								  <td>比賽時間</td>
				              	  <td>比賽地點</td>
				              	  <td>主隊</td>
				              	  <td>比分</td>
				              	  <td>客隊</td>
				                </tr>
							</thead>
							<tbody>
								<c:forEach var="gamesSet" items="${groupsSet.gamesSet}">
									<tr>
										<td><fmt:formatDate value="${gamesSet.gameBeginDate}" pattern="yyyy-MM-dd HH:mm"/></td>
										<td><a href="<%=request.getContextPath() %>/Locationinfo.do?action=GET_ONE_LOCATION&locationID=${gamesSet.locationinfoVO.locationID}">${gamesSet.locationinfoVO.locationName}</a></td>
										<td><a href="<%=request.getContextPath() %>/Teams.do?action=GET_ONE_TEAM&teamID=${gamesSet.teamAVO.teamID}">${gamesSet.teamAVO.teamName}</a></td>
										<td><a href="<%=request.getContextPath() %>/PersonalData.do?action=Get_singlefieldData&gameID=${gamesSet.gameID}">${gamesSet.teamAScore} - ${gamesSet.teamBScore}</a></td>
										<td><a href="<%=request.getContextPath() %>/Teams.do?action=GET_ONE_TEAM&teamID=${gamesSet.teamBVO.teamID}">${gamesSet.teamBVO.teamName}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
			        </c:if>
				</c:forEach>
			    
			    
		    </div>
		    <jsp:include page="/footer.jsp" />
		    </div>
	    	<!-- 網頁內容END -->
	    </div>
	    <!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
	    <script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	    <script>
// 	    $(document).ready(function() {
// 	    	$('#season_cycle').DataTable();
// 	    	});
	    $(document).ready(function() {
	    	$('.test').DataTable();
	    	
// 	    	var td_odd_over={'background-color':'#f9f9f9'};
// 	    	var td_odd_out={'background-color':'rgb(208, 207, 207)'};
// 	    	var td_even_over={'background-color':'#eaeaea'};
// 	    	var td_even_out={'background-color':'rgb(197, 196, 197)'};
// 	    	$('#season_group').children('tbody').find('tr:nth-child(odd)').css(td_odd_over);
// 	    	$('#season_group').children('tbody').find('tr:nth-child(odd)').mouseover(odd_over);
// 	    	$('#season_group').children('tbody').find('tr:nth-child(odd)').mouseout(odd_out);
// 	    	$('#season_group').children('tbody').find('tr:nth-child(even)').css(td_even_over);
// 	    	$('#season_group').children('tbody').find('tr:nth-child(even)').mouseover(even_over);
// 	    	$('#season_group').children('tbody').find('tr:nth-child(even)').mouseout(even_out);
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
	    	});
	    </script>
    </body>

    </html>