<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	eeit.groups.model.GroupsService groupSvc = new eeit.groups.model.GroupsService();
	Integer groupID = Integer.valueOf(request.getParameter("groupID"));
	request.setAttribute("groupsVO", groupSvc.findByGroupID(groupID));
%>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
  	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
   	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		    	
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
            	<a href="<%=request.getContextPath() %>/Season.do?action=TO_GROUPS_BACK&seasonID=1001">
            		<span>分組列表</span>
            	</a>
        	</span>&gt;
        	<span><span>修改分組</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
		<div class="col-md-12">
		
			<h2>修改分組</h2>
            	<c:if test="${not empty errorMsgs}">
					請修正以下錯誤:
                    <ul>
                        <c:forEach var="message" items="${errorMsgs}">
                            <li>${message}</li>
                        </c:forEach>
                    </ul>
                </c:if>

		    <Form method="post" action="<%=request.getContextPath() %>/Groups.do">
				<input type="hidden" name="action" value="UPDATE_GROUP">
				<input type="hidden" name="groupID" value="${groupsVO.groupID}">
				
				<table class="table table-bordered" id="seasonList">
			        <tbody>
						<tr>
							<td>分組名稱</td>
							<td><input type="text" name="groupName" value="${groupsVO.groupName}"></td>
						</tr>
						<tr>
							<td>目前球隊</td>
							<td><input type="text" name="currentTeams" value="${groupsVO.currentTeams}"></td>
						</tr>
						<tr>
							<td>球隊上限</td>
							<td><input type="text" name="maxTeams" value="${groupsVO.maxTeams}"></td>
						</tr>
						<tr>
							<td>球隊下限</td>
							<td><input type="text" name="minTeams" value="${groupsVO.minTeams}"></td>
						</tr>
						<tr>
							<td>球員上限</td>
							<td><input type="text" name="maxPlayers" value="${groupsVO.maxPlayers}"></td>
						</tr>
						<tr>
							<td>球員下限</td>
							<td><input type="text" name="minPlayers" value="${groupsVO.minPlayers}"></td>
						</tr>
					
			        </tbody>
			        
			    </table>
			    <input type="submit" class="btn btn-success" id="submit_move" value="送出">
			    <input type ="button" class="btn btn-danger" onclick="history.back()" value="取消"></input>
			</form>
		</div>
	<jsp:include page="/footer.jsp" />
	</div>
	</div>
		<script>
	$(document).ready(function(){
		var td_1={'font-family':'微軟正黑體',
 		 		'text-align':'center',
 		 		'line-height': '60px',
	    		'font-size': '20px'}
		var submit={'margin-left': '876px'}
	$("tr td:first-child").css(td_1)
	$("#submit_move").css(submit)
	})
	</script>
	    
</body>
<jsp:include page="/footer_css.jsp" />
</html>