<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
  	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
   	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		    	
    <jsp:include page="/header_css.jsp" />
    
    <title>修改分組</title>
</head>

<body>
	<jsp:include page="/header.jsp" />
	
	<div class="container">
		<div class="col-md-12">
		
			<h1>修改分組</h1>
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
			    <input type="submit" value="送出">
			    <input type ="button" onclick="history.back()" value="取消"></input>
			</form>
		</div>
	</div>
	    
	    
	<jsp:include page="/footer.jsp" />
</body>
<jsp:include page="/footer_css.jsp" />
</html>