<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="locSvc" class="eeit.locationinfo.model.LocationinfoService" scope="page"/>
<jsp:useBean id="groupRegSvc" class="eeit.groupreg.model.GroupRegService" scope="page"/>

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <title>Season</title>
        <jsp:include page="/header_css.jsp" />
        <jsp:include page="/font_css.jsp" />
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="jumbotron">
			<!-- 網頁內容 -->
				<table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>賽季名稱</td>
                    		<td>分組名稱</td>
		                    <td>隊伍數量上限</td>
		                    <td>隊伍數量下限</td>
		                    <td>目前隊伍數量</td>
		                    <td>球隊成員上限</td>
		                    <td>球隊成員下限</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<tr>
			        		<td>${groupsVO.seasonVO.seasonName}</td>
			        		<td>${groupsVO.groupName}</td>
			        		<td>${groupsVO.maxTeams}</td>
			        		<td>${groupsVO.minTeams}</td>
			        		<td>${groupsVO.currentTeams}</td>
			        		<td>${groupsVO.maxPlayers}</td>
			        		<td>${groupsVO.minPlayers}</td>
			        	</tr>
			        </tbody>
			    </table>
			    
			    <table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>隊伍名稱</td>
		                    <td>報隊成員數量</td>
                    		<td>報名時間</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="groupRegVO" items="${groupsVO.groupRegSet}">
				        	<tr>
				        		<td>${groupRegVO.teamsVO.teamName}</td>
				        		<%--計算該隊報名此分組人數 --%>
				        		<c:set var="groupID" value="${groupRegVO.groupsVO.groupID}"/>
				        		<c:set var="teamID" value="${groupRegVO.teamsVO.teamID}"/>
				        		<c:set var="count" value="0"/>
				        		<c:forEach var="signUpPlayer" items="${groupRegSvc.findSignUpPlayer(groupID,teamID)}" varStatus="s">
				        			<c:set var="count" value="${s.index+1}"/>
				        		</c:forEach>
				        		<td>${count}</td>
				        		<td><fmt:formatDate value="${groupRegVO.registerDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				        	</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
			    
			    <p>有 ${groupsVO.currentTeams} 隊，循環賽共需打 ${gamesNeeded} 場比賽</p>
			    
			    <br>
			    <c:if test="${not empty errorMsgs}">
				                        請修正以下錯誤:
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<c:if test="${not empty message}">
								<li>${message}</li>
							</c:if>
						</c:forEach>
					</ul>
				</c:if>
			    	
			    <table class="table table-bordered">
		            <thead>
			            <tr>
                    		<td>地點</td>
                    		<td>日期</td>
                    		<td>時間</td>
                    		<td>比賽時間</td>
			            </tr>
			            <form action="<%=request.getContextPath()%>/Groups.do" method="post">
				        	<tr>
				        		<td>
				        			<select name="locationID">
					        			<c:forEach var="locVO" items="${locSvc.allList}">
					        				<option value="${locVO.locationID},${locVO.locationName}">${locVO.locationName}</option>
					        			</c:forEach>
				        			</select>
				        		</td>
				        		<td colspan="2">
				        			<input type="text" name="beginDate" style="width:40%" > ~ <input type="text" name="endDate" style="width:40%">
				        		</td>
				        		<td>
				        			<br>單場:<select name="timeUnit">
				        			<c:forEach var="time" begin="10" end="300" step="10">
				        				<c:choose>
				        					<c:when test="${time==90}">
					        					<option value="${time}" selected="selected">${time}</option>
				        					</c:when>
				        					<c:otherwise>
				        						<option value="${time}">${time}</option>
				        					</c:otherwise>
				        				</c:choose>
				        			</c:forEach>
				        			</select>分鐘
				        		</td>
				        		<td>
					       			<input type="hidden" name="action" value="SPLIT_LOCATION">
				        			<input type="submit" value="新增">
				        		</td>
				        	</tr>
			       		</form>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="timeList" items="${timeList}" varStatus="s">
				        	<tr>
				        		<td>${timeList.locationName}</td>
	                    		<td><fmt:formatDate value="${timeList.beginTime}" pattern="yyyy-MM-dd"/></td>
	                    		<td><fmt:formatDate value="${timeList.beginTime}" pattern="HH:mm"/> ~ <fmt:formatDate value="${timeList.endTime}" pattern="HH:mm"/></td>
	                    		<td>${timeList.timeUnit}分鐘</td>
	                    		<td>
	                    			<form action="<%=request.getContextPath()%>/Groups.do" method="post">
	                    				<input type="hidden" name="action" value="REMOVE_TIMELIST">
	                    				<input type="hidden" name="index" value="${s.index}">
	                    				<input type="submit" value="刪除">
	                    			</form>
	                    		</td>
				        	</tr>
			        	</c:forEach>
			        </tbody>
			        <tfoot>
		        		
			        </tfoot>
			    </table>
			    
				<form action="<%=request.getContextPath()%>/Groups.do" method="post">
					<input type="hidden" name="groupID" value="${groupsVO.groupID}">
					<input type="hidden" name="action" value="MAKE_SCHEDULE">
					<input type="submit" value="送出">
				</form>
		
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>