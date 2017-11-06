<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	eeit.season.model.SeasonService svc = new eeit.season.model.SeasonService();
	request.setAttribute("seasonSet", svc.getAll());
%>

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
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="jumbotron">
			<!-- 網頁內容 -->
			
			<select name="season">
				<option>請選擇</option>
				<c:forEach var="season" items="${seasonSet}">
					<option value="${season.seasonID}">${season.seasonName}</option>
				</c:forEach>			
			</select>
			
			<select name="group">
			</select>
			
			<table border="1" id="personalData">
				<thead>
					<tr>
						<td>兩分球</td>
						<td>三分球</td>
						<td>球員姓名</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="seasonVO" items="${seasonSet}">
						<c:forEach var="groupsVO" items="${seasonVO.groupsSet}">
							<c:forEach var="gamesVO" items="${groupsVO.gamesSet}">
								<c:forEach var="personalDataVO" items="${gamesVO.personalDataSet}">
									<tr>
										<td>${personalDataVO.twoPoint}</td>
										<td>${personalDataVO.threePoint}</td>
										<td>${personalDataVO.playersVO.playerName}</td>
									</tr>
								</c:forEach>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		
		
		
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
	    
  		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  		<script type="text/javascript">
  		$(function(){
  			
  			var seasonSel = null;
  			
  			$('select[name="season"]').change(function(){
  				seasonSel = $('select[name="season"]').val();
  				var select = $('select[name="group"]');
  				select.empty();
  				
  				var docFrag = $(document.createDocumentFragment());
  				var tb = $('#personalData>tbody');
  				tb.empty();
  				
  				
  				$.getJSON('<%=request.getContextPath()%>/Season.do',
  						{'action':'GET_GROUP','seasonID': seasonSel}, function(data){
  					
  					$.each(data,function(idx, groupsVO){

  						var cell = $('<option></option>').attr('value',groupsVO.groupID).text(groupsVO.groupName);
  						select.append(cell);
  						
  						
  						$.each(groupsVO.data,function(idxx,pdata){
  							var cell1 = $('<td></td>').text(pdata.twoPoint);
  							var cell2 = $('<td></td>').text(pdata.threePoint);
  							var cell3 = $('<td></td>').text(pdata.playerName);
  							
  							var row = $('<tr></tr>').append([cell1, cell2, cell3]);
  							docFrag.append(row);
  							tb.append(docFrag);
  						})
  					})
  				})
  			})
  			
  			
  			
  			
  			
  		})
  		</script>
  		
    </body>

    </html>