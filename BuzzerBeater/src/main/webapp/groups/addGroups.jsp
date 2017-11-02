<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        h2,h3{		
  		  font-family:微軟正黑體;   	  
    	  text-align:center;
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
        	<span>
            	<a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
            		<span>賽季管理</span>
            	</a>
        	</span>&gt;
        	<span>
            	<a href="<%=request.getContextPath() %>/season/addSeason.jsp">
            		<span>新增賽季</span>
            	</a>
        	</span>&gt;
        	<span><span>新增分組</span></span>
    	</div>
			<!-- 網頁內容 -->
			<h2>新增分組</h2>
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
			<table class="table table-bordered" id="groupList">
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
			        	<td><c:out value="${seasonVO.seasonBeginDate}" default="未輸入"/></td>
			        	<td><c:out value="${seasonVO.seasonEndDate}" default="未輸入"/></td>
			        	<td><c:out value="${seasonVO.signUpBegin}" default="未輸入"/></td>
			        	<td><c:out value="${seasonVO.signUpEnd}" default="未輸入"/></td>
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
				    			<input type="hidden" name="action" value="REMOVE_GROUP_TEMP">
				    			<input type="hidden" name="setIndex" value="<%= i++ %>">
				    			<td><input type="submit" id="btnDelGroup" class="btn btn-danger" value="刪除"></td>
				    		</form>
			    		</tr>
		    		</c:forEach>
		    		<% i=0; %>
		    	</tbody>
		    	<tfoot>
					<form action="<%=request.getContextPath()%>/Groups.do" method="post">
						<input type="hidden" name="action" value="CHECK_GROUP">
						<tr>
				    		<td><input type="text" name="groupName" value='<c:out value="${groupsVO.groupName}" default=""/>'></td>
					    	<td><input type="text" name="maxTeams" value='<c:out value="${groupsVO.maxTeams}" default="16"/>'></td>
					    	<td><input type="text" name="minTeams" value='<c:out value="${groupsVO.minTeams}" default="2"/>'></td>
					    	<td><input type="text" name="maxPlayers" value='<c:out value="${groupsVO.maxPlayers}" default="15"/>'></td>
					    	<td><input type="text" name="minPlayers" value='<c:out value="${groupsVO.minPlayers}" default="7"/>'></td>
					    	<td><input type="submit" class="btn btn-primary" value="新增"></td>
					    	<td><input type="reset" class="btn btn-info" value="清除"></td>
				    	</tr>
			    	</form>
		    	</tfoot>
		    </table>
		    
		    <form action="<%=request.getContextPath()%>/Season.do" method="post">
		    	<input type="hidden" name="action" value="ADD_SEASON">
		    	<input type="submit" class="btn btn-success" id="submit_move" value="確認新增">
		    </form>
		    
		    
			
		
			<!-- 網頁內容END -->
	    	<jsp:include page="/footer.jsp" />
	    	</div>
	    </div><!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script type="text/javascript">
			$(document).ready(function(){
				var submit={'margin-left': '935px'}
			$("#submit_move").css(submit)
				

			})
		</script>
    </body>

    </html>