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
    	  	
        <title>Season</title>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
			<div class="col-md-12">

			<h1>新增賽季</h1>
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
			
			<form method="post" action="<%=request.getContextPath()%>/Season.do">
				<input type="hidden" name="action" value="ADD_SEASON">
				<input type="hidden" name="seasonID" value="${sVO.seasonID}">
				
				<table class="table table-bordered" id="seasonList">
			        <tbody>
						<tr>
							<td>賽季名稱</td>
							<td><input type="text" name="seasonName" value="${sVO.seasonName}"></td>
						</tr>
						<tr>
							<td>賽季開始日期</td>
							<td><input type="date" name="seasonBeginDate" value="${sVO.seasonBeginDate}"></td>
						</tr>
						<tr>
							<td>賽季結束日期</td>
							<td><input type="date" name="seasonEndDate" value="${sVO.seasonEndDate}"></td>
						</tr>
						<tr>
							<td>報名開始時間</td>
							<td><input type="text" name="signUpBegin" value="${sVO.signUpBegin}"></td>
						</tr>
						<tr>
							<td>報名結束時間</td>
							<td><input type="text" name="signUpEnd" value="${sVO.signUpEnd}"></td>
						</tr>
						<tr>
							<td>備註</td>
							<td><textarea name="descriptions" >${sVO.descriptions}</textarea></td>
						</tr>
			        </tbody>
			        
			    </table>
			    
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
			    		<c:forEach var="groupsVO" items="${seasonVO.groupsSet}">
				    		<tr>
				    			<td><input type="text" name="groupName" value="${groupsVO.groupName}"></td>
					    		<td><input type="text" name="maxTeams" value="${groupsVO.maxTeams}"></td>
					    		<td><input type="text" name="minTeams" value="${groupsVO.minTeams}"></td>
					    		<td><input type="text" name="maxPlayers" value="${groupsVO.minPlayers}"></td>
					    		<td><input type="text" name="minPlayers" value="${groupsVO.minPlayers}"></td>
					    		<td><button type="button" id="btnDelGroup">刪除</button></td>
				    		</tr>
			    		</c:forEach>
			    	</tbody>
			    	<tfoot>
						
			    		<tr>
			    			<td><button type="button" id="btnAddGroup">新增分組</button></td>
			    		</tr>
			    	</tfoot>
			    </table>
			    
			    <input type="submit" value="送出">
				<input type="reset" value="重置">
			</form>
		    </div>
		    <jsp:include page="/footer.jsp" />
	    </div>
		<jsp:include page="/footer_css.jsp" />
		<script type="text/javascript">
			$(document).ready(function(){
				var i = 0;
				if($('#groupList>tbody').val() == ""){
					addGroup();
				}
				
				$('#btnAddGroup').on('click',function(){
					addGroup();
				})
				
				function addGroup(){
					var cell1 = $('<td></td>').html('<input type="text" name="groupName' + i + '" value="">');
					var cell2 = $('<td></td>').html('<input type="text" name="maxTeams' + i + '" value="">');
					var cell3 = $('<td></td>').html('<input type="text" name="minTeams' + i + '" value="">');
					var cell4 = $('<td></td>').html('<input type="text" name="maxPlayers' + i + '" value="">');
					var cell5 = $('<td></td>').html('<input type="text" name="minPlayers' + i + '" value="">');
					var cell6 = $('<td></td>').html('<button type="button" id="btnDelGroup">移除</button>');
					
					i++;
					
					var tr = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);
					$('#groupList>tbody').append(tr);
					
					tr.find('#btnDelGroup').on('click',function(){
						$(this).parent().parent().remove();
					})
					
				}
				

				
				
				
				
				
				
			})
		</script>
    </body>
    </html>