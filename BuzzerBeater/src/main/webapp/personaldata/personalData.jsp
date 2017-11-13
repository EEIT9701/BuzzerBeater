<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="eeit.personaldata.model.*"%>
<%@ page import="java.util.*"%>
<%
	eeit.season.model.SeasonService svc = new eeit.season.model.SeasonService();
	request.setAttribute("seasonSet", svc.getAll());


	PersonalDataService playerSvc = new PersonalDataService();
	List<PersonalDataVO> list = playerSvc.getAll();
	request.setAttribute("personalDataSet", list);

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
	
		<div class="container-fluid">
			<div class="jumbotron">
			<!-- 網頁內容 -->
			
			<!--上層導覽列(開始) -->
				<div id="pathWay">
        			<span>
            			<a class="blockUI" href="<%=request.getContextPath() %>/index.jsp">
            				<span>首頁</span>
            			</a>
        			</span>&gt;
        			<span>
            			<span>數據</span>
        			</span>&gt;
        			<span>
        				<span>個人數據</span>
        			</span>
    			</div>
    		<!--上層導覽列(結束) -->
    				<h2>個人數據</h2>
    	
			賽季:<select name="season" >
				<option>請選擇</option>
				<c:forEach var="season" items="${seasonSet}">
					<option value="${season.seasonID}">${season.seasonName}</option>
				</c:forEach>			
			</select>
			
			組別:<select name="group">
			</select>
			
		<br><br>
			<table border="1" id="personalData">
				<thead>
					<tr>
						<th>球員姓名</th>
								<th>球員</th>
								<th>球隊名稱</th>
								<th>出場次數</th>
								<th>平均出場時間(分)</th>						
								<th>投籃(%)</th>							
								<th>三分(%)</th>							
								<th>罰球(%)</th>
								<th>進攻籃板</th>
								<th>防守籃板</th>
								<th>平均籃板</th>
								<th>助攻</th>
								<th>抄截</th>
								<th>阻攻</th>
								<th>失誤</th>
								<th>犯規</th>
								<th>得分</th>
					</tr>
				</thead>
			
				<tbody>
							<c:forEach var="personalDataVO" items="${personalDataSet}">
								<tr>
									<td>
										<a href="<%=request.getContextPath()%>/players/playerInformation.jsp?playerID=${personalDataVO.playersVO.playerID}">${personalDataVO.playersVO.playerName}</a>
									</td>
									<td>
									    <c:if test="${not empty personalDataVO.playersVO.photo}">
											<img src="data:image/png;base64,${personalDataVO.playersVO.photo}" height="67.5" width="45">
										</c:if> 
										<c:if test="${empty personalDataVO.playersVO.photo}">
											<img src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png" height="67.5" width="45">
										</c:if>
									</td>
									<td>
										<a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID=${personalDataVO.teamsVO.teamID}">${personalDataVO.teamsVO.teamName}</a>
									</td>
									
									<td>${personalDataVO.gameID}</td>
									
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.gameTime/personalDataVO.gameID/60}" maxFractionDigits="1"/></td>
								
									<td>
									    <c:if test="${'0'==personalDataVO.twoPointShot}">0</c:if>
									    <c:if test="${'0' != personalDataVO.twoPointShot}">
									      <fmt:formatNumber type="number" value="${personalDataVO.twoPoint/personalDataVO.twoPointShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									
									<td>
									    <c:if test="${'0'==personalDataVO.threePointShot}">0</c:if>
									    <c:if test="${'0' != personalDataVO.threePointShot}">
									      <fmt:formatNumber type="number" value="${personalDataVO.threePoint/personalDataVO.threePointShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									
									<td>
									    <c:if test="${'0'==personalDataVO.fgShot}">0</c:if>
									    <c:if test="${'0' != personalDataVO.fgShot}">
									      <fmt:formatNumber type="number" value="${personalDataVO.fg/personalDataVO.fgShot*100}" maxFractionDigits="1"/>
									    </c:if>
									</td>
									
									<td><fmt:formatNumber type="number" value="${personalDataVO.offReb/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.defReb/personalDataVO.gameID}" maxFractionDigits="1"/></td>	
									<td><fmt:formatNumber type="number" value="${personalDataVO.offReb/personalDataVO.gameID+personalDataVO.defReb/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.assist/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.steal/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.blocks/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.turnover/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.personalFouls/personalDataVO.gameID}" maxFractionDigits="1"/></td>
									<td><fmt:formatNumber type="number" value="${personalDataVO.points/personalDataVO.gameID}" maxFractionDigits="1"/></td>
								</tr>
							</c:forEach>
				</tbody>
			</table>
		
		
		
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
	    
  		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
  		<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
  		<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
  		<script type="text/javascript">
  		$(function(){
  			
  			var seasonSel = null;
  			
  			$('select[name="season"]').change(function(){
  				seasonID = $('select[name="season"]').val();
  				var select = $('select[name="group"]');
  				select.empty();
  				
  				//下拉選單
  				$.getJSON('<%=request.getContextPath()%>/Season.do',
  						{'action':'GET_GROUP','seasonID':seasonID},function(data){
  			 	var cell1 = $('<option></option>').text("請選擇"); 
  					select.append(cell1); 
  							
  					$.each(data,function(idx,group){
  						var cell2 = $('<option></option>').attr('value',group.groupID).text(group.groupName);
  						select.append(cell2);
  					})
  				})
  				
  				//表格
  				var tb = $('#personalData>tbody');
  				tb.empty();
  				
  				var docFrag = $(document.createDocumentFragment());
  				$.getJSON('<%=request.getContextPath()%>/PersonalData.do',
  						{'action':'FIND_BY_SEASONID','seasonID':seasonID},function(data){
  							
  					$.each(data,function(idx,pdata){
  						var cell1 = $('<td></td>').html('<a href="<%=request.getContextPath()%>/players/playerInformation.jsp?playerID='+pdata.playersVO.playerID+'">'+pdata.playersVO.playerName+'</a>');
  						if( pdata.playersVO.photo == null ){
  							var cell2 = $('<td></td>').html('<img src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png" height="67.5" width="45">');
  						}else{
	  						var cell2 = $('<td></td>').html('<img src="data:image/png;base64,'+pdata.playersVO.photo+'" height="67.5" width="45">');
  						}
  						var cell3 = $('<td></td>').html('<a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID='+pdata.teamsVO.teamID+'">'+pdata.teamsVO.teamName+'</a>');
  						var cell4 = $('<td></td>').text(pdata.gameID);
  						var cell5 = $('<td></td>').text((pdata.gameTime/pdata.gameID/60).toFixed(1));
  						if(pdata.twoPointShot == 0){
  							var cell6=$('<td></td>').text(0);
  						}else{
  						    var cell6 = $('<td></td>').text((pdata.twoPoint/pdata.twoPointShot*100).toFixed(1));
  						}
  						if(pdata.threePointShot == 0){
  							var cell7=$('<td></td>').text(0);
  						}else{
  						    var cell7 = $('<td></td>').text((pdata.threePoint/pdata.threePointShot*100).toFixed(1));
  						}
  						if(pdata.fgShot == 0){
  							var cell8=$('<td></td>').text(0);
  						}else{
  						    var cell8 = $('<td></td>').text((pdata.fg/pdata.fgShot*100).toFixed(1));
  						}
  						var cell9 = $('<td></td>').text((pdata.offReb/pdata.gameID).toFixed(1));
  						var cell10 = $('<td></td>').text((pdata.defReb/pdata.gameID).toFixed(1));
  						var cell11 = $('<td></td>').text(((pdata.offReb+pdata.defReb)/pdata.gameID).toFixed(1));
  						var cell12 = $('<td></td>').text((pdata.assist/pdata.gameID).toFixed(1));
  						var cell13 = $('<td></td>').text((pdata.steal/pdata.gameID).toFixed(1));
  						var cell14 = $('<td></td>').text((pdata.blocks/pdata.gameID).toFixed(1));
  						var cell15 = $('<td></td>').text((pdata.turnover/pdata.gameID).toFixed(1));
  						var cell16 = $('<td></td>').text((pdata.personalFouls/pdata.gameID).toFixed(1));
  						var cell17 = $('<td></td>').text((pdata.points/pdata.gameID).toFixed(1));
  						//****補完****
  						var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9,cell10,cell11,cell12,cell13,cell14,cell15,cell16,cell17]);
  						docFrag.append(row);
  						tb.append(docFrag);
  					})
  				})
  				
  			})
  			
  			
  			$('select[name="group"]').change(function(){
  				var groupID=$('select[name="group"]').val();
  				var docFrag = $(document.createDocumentFragment());
	  			var tb = $('#personalData>tbody');
	  			tb.empty();
	  			
	  			//表格
  				$.getJSON('<%=request.getContextPath()%>/PersonalData.do',
  						{'action':'FIND_BY_GROUPID','groupID':groupID},function(data){
  							
  					$.each(data,function(idx,pdata){
  						var cell1 = $('<td></td>').html('<a href="<%=request.getContextPath()%>/players/playerInformation.jsp?playerID='+pdata.playersVO.playerID+'">'+pdata.playersVO.playerName+'</a>');
  						if( pdata.playersVO.photo == null ){
  							var cell2 = $('<td></td>').html('<img src="<%=request.getContextPath()%>/images/placholder_testimonial-180x180.png" height="67.5" width="45">');
  						}else{
	  						var cell2 = $('<td></td>').html('<img src="data:image/png;base64,'+pdata.playersVO.photo+'" height="67.5" width="45">');
  						}
  						var cell3 = $('<td></td>').html('<a href="<%=request.getContextPath()%>/Teams.do?action=GET_ONE_TEAM&teamID='+pdata.teamsVO.teamID+'">'+pdata.teamsVO.teamName+'</a>');
  						var cell4 = $('<td></td>').text(pdata.gameID);
  						var cell5 = $('<td></td>').text((pdata.gameTime/pdata.gameID/60).toFixed(1));
  						if(pdata.twoPointShot == 0){
  							var cell6=$('<td></td>').text(0);
  						}else{
  						    var cell6 = $('<td></td>').text((pdata.twoPoint/pdata.twoPointShot*100).toFixed(1));
  						}
  						if(pdata.threePointShot == 0){
  							var cell7=$('<td></td>').text(0);
  						}else{
  						    var cell7 = $('<td></td>').text((pdata.threePoint/pdata.threePointShot*100).toFixed(1));
  						}
  						if(pdata.fgShot == 0){
  							var cell8=$('<td></td>').text(0);
  						}else{
  						    var cell8 = $('<td></td>').text((pdata.fg/pdata.fgShot*100).toFixed(1));
  						}
  						var cell9 = $('<td></td>').text((pdata.offReb/pdata.gameID).toFixed(1));
  						var cell10 = $('<td></td>').text((pdata.defReb/pdata.gameID).toFixed(1));
  						var cell11 = $('<td></td>').text(((pdata.offReb+pdata.defReb)/pdata.gameID).toFixed(1));
  						var cell12 = $('<td></td>').text((pdata.assist/pdata.gameID).toFixed(1));
  						var cell13 = $('<td></td>').text((pdata.steal/pdata.gameID).toFixed(1));
  						var cell14 = $('<td></td>').text((pdata.blocks/pdata.gameID).toFixed(1));
  						var cell15 = $('<td></td>').text((pdata.turnover/pdata.gameID).toFixed(1));
  						var cell16 = $('<td></td>').text((pdata.personalFouls/pdata.gameID).toFixed(1));
  						var cell17 = $('<td></td>').text((pdata.points/pdata.gameID).toFixed(1));
  						//****補完****
  						var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9,cell10,cell11,cell12,cell13,cell14,cell15,cell16,cell17]);
  						docFrag.append(row);
  						tb.append(docFrag);
  					})
  				})
  				
  				
  				
  				
  				
  			})
  			
  			
  			
  			
  		})
  		
  		$(document).ready(function() {
			$('#personalData').DataTable({
				"lengthMenu": [[10, 15, 25, -1], [10, 15, 25, "All"]],
				"pagingType": "full_numbers",
				"language": {
					"lengthMenu":"每一頁顯示_MENU_ 筆資料",
					"zeroRecords":"查無資料",
					"info":"現在正在第_PAGE_ 頁，總共有_PAGES_ 頁",
					"infoEmpty":"無資料",
					"infoFiltered":"(總共搜尋了_MAX_ 筆資料)",
					"search":"搜尋：",
					"paginate":{
						"first":"第一頁",
						"previous":"上一頁",
						"next":"下一頁",
						"last":"最末頁"					
					}
			  }
			})
		});

  		</script>
  		
    </body>

    </html>