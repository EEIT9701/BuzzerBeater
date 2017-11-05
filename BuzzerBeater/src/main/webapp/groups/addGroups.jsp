<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <jsp:include page="/header_css.jsp" />
        <style>
        thead {
	    	background-color: rgba(237, 125, 49, 0.8);
    		color: #FFFFFF;
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
        #seasonVO,#groupList {
        	text-align:center;
        	font-size: 18px;
        }
        </style>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
		<div class="jumbotron">
		
		<!--上層導覽列 -->
		<div id="pathWay">
        	<span>
            	<a href="<%=request.getContextPath() %>/index.jsp">
            		<span>使用者功能</span>
            	</a>
        	</span>&gt;
        	<span>
            	<a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
            		<span>賽季管理</span>
            	</a>
        	</span>&gt;
        	<span><span>新增分組</span></span>
    	</div>
    	
			<!-- 網頁內容 -->
			<h2 align="center">新增分組</h2>
			
			<c:if test="${not empty errorMsgs}">
				<p style="color:red">請修正以下錯誤:</p>
				<ul style="color:red">
					<c:forEach var="message" items="${errorMsgs}">
						<c:if test="${not empty message}">
							<li>${message}</li>
						</c:if>
					</c:forEach>
				</ul>
			</c:if>
			
			<table class="table table-bordered" id="seasonVO">
				<thead>
					<tr>
						<td>賽季名稱</td>
						<td>賽季開始日期</td>
						<td>賽季結束日期</td>
						<td>報名開始時間</td>
						<td>報名結束時間</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${seasonVO.seasonName}</td>
			        	<td>
			        		<c:if test="${empty seasonVO.seasonBeginDate}">未輸入</c:if>
			        		<fmt:formatDate pattern="yyyy-MM-dd" value="${seasonVO.seasonBeginDate}"/>
			        	</td>
			        	<td>
			        		<c:if test="${empty seasonVO.seasonEndDate}">未輸入</c:if>
			        		<fmt:formatDate pattern="yyyy-MM-dd"  value="${seasonVO.seasonEndDate}"/>
			        	</td>
			        	<td>
			        		<c:if test="${empty seasonVO.signUpBegin}">未輸入</c:if>
			        		<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${seasonVO.signUpBegin}"/>
			        	</td>
			        	<td>
			        		<c:if test="${empty seasonVO.signUpEnd}">未輸入</c:if>
			        		<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${seasonVO.signUpEnd}"/>
			        	</td>
					</tr>
				</tbody>
			</table>
			
			<p>${seasonVO.descriptions}</p>		
			
				
			<table class="table table-bordered" id="groupList">
			    <thead>
			    	<tr>
			    		<td>分組名稱</td>
			    		<td>球隊數量上限</td>
			    		<td>球隊數量下限</td>
			   			<td>球員數量上限</td>
			   			<td>球員數量下限</td>
			   		</tr>
			   	</thead>
		    	<tbody>
		    		<%! int i = 0; %>
		    		<c:forEach var="groupsSet" items="${groupsSet}">
			    		<tr>
			    			<td>${groupsSet.groupName}</td>
				    		<td>${groupsSet.maxTeams}</td>
				    		<td>${groupsSet.minTeams}</td>
				    		<td>${groupsSet.minPlayers}</td>
				    		<td>${groupsSet.minPlayers}</td>
				    		<form action="<%=request.getContextPath()%>/Groups.do" method="post">
				    			<input type="hidden" name="action" value="UPDATE_GROUP_TEMP">
				    			<input type="hidden" name="setIndex" value="<%= i %>">
				    			<td><input type="submit" id="btnDelGroup" class="btn btn-info" value="修改"></td>
				    		</form>
				    		<form action="<%=request.getContextPath()%>/Groups.do" method="post">
				    			<input type="hidden" name="action" value="REMOVE_GROUP_TEMP">
				    			<input type="hidden" name="setIndex" value="<%= i++ %>">
				    			<td><input type="submit" id="btnDelGroup" class="btn btn-danger" value="刪除"></td>
				    		</form>
			    		</tr>
		    		</c:forEach>
		    		<% i=0; %>
		    	</tbody>
		    	
		    	<tfoot>
					<form action="<%=request.getContextPath()%>/Groups.do" method="post" name="addGroup">
						<tr>
						<input type="hidden" name="action" value="CHECK_GROUP">
				    		<td><input type="text" class="form-control" name="groupName" value='<c:out value="${groupsVO.groupName}" default=""/>'></td>
					    	<td><input type="number" class="form-control" name="maxTeams" min="2" value='<c:out value="${groupsVO.maxTeams}" default="16"/>'></td>
					    	<td><input type="number" class="form-control" name="minTeams" min="2" value='<c:out value="${groupsVO.minTeams}" default="2"/>'></td>
					    	<td><input type="number" class="form-control" name="maxPlayers" min="7" value='<c:out value="${groupsVO.maxPlayers}" default="15"/>'></td>
					    	<td><input type="number" class="form-control" name="minPlayers" min="7" value='<c:out value="${groupsVO.minPlayers}" default="7"/>'></td>
					    	<td><input type="submit" class="btn btn-primary" id="btnAddGroup" value="新增"></td>
					    	<td><input type="reset" class="btn btn-info" value="清除"></td>
				    	</tr>
			    	</form>
		    	</tfoot>
		    	
		    </table>
		    
		    <div class="col-md-1">
		    	<button class="btn btn-info" onclick="history.back()">返回上一步</button>
			</div>
			
		    <div class="col-md-1 col-md-offset-9">
			    <form action="<%=request.getContextPath()%>/Season.do" method="post">
			    	<input type="hidden" name="action" value="ADD_SEASON">
			    	<input type="submit" class="btn btn-success btn-lg" id="submit_move" value="確認新增">
			    </form>
		    </div>
		
			<br><br><br><br><br><br>
			<!-- 網頁內容END -->
	    	<jsp:include page="/footer.jsp" />
	    	</div>
	    </div><!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script type="text/javascript">
			$(function() {
				
				
// 				getGroups();
// 				function getGroups() {
<%-- 					$.getJSON('<%=request.getContextPath()%>/Groups.do', --%>
// 						{'action':'GET_ALL_JSON'}, function(data) {
							
// 						var docFrag = $(document.createDocumentFragment());
// 						var tb = $('#groupList>tbody');
// 						tb.empty();
						
// 						$.each(data, function(index, vo){
// 							var cell1 = $('<td></td>').text(vo.groupName);
// 							var cell2 = $('<td></td>').text(vo.maxTeams);
// 							var cell3 = $('<td></td>').text(vo.minTeams);
// 							var cell4 = $('<td></td>').text(vo.maxPlayers);
// 							var cell5 = $('<td></td>').text(vo.minPlayers);
// 							var cell6 = $('<td></td>').html('<input type="button" class="btn btn-info btnDeleteGroup" value="修改">');
// 							var cell7 = $('<td></td>').html('<input type="button" class="btn btn-danger btnDeleteGroup" value="刪除">');
							
// 							var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7]);
// 							docFrag.append(row);
// 							tb.append(docFrag);	
// 						})
// 					})
// 				}
				
// 				$('#btnAddGroup').on('click',function(){
// 					var group = $('form[name="addGroup"]').serialize();
// 					console.log(group);
					
<%-- 					$.post('<%=request.getContextPath()%>/Groups.do', --%>
// 						group, function(){
						
// 							getGroups();
							
// 						})
// 				})

			})
		</script>
    </body>

    </html>