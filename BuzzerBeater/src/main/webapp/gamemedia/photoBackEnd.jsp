<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>EEIT97-第一組</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="/header_css.jsp" />
    <!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
    
    <style>
		
    </style>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
</head>
<body>
<jsp:useBean id="gameMediaSvc" scope="page" class="eeit.gamemedia.model.GameMediaService" />
<jsp:include page="/header.jsp"/>
    <!--主文(開始)-->
    <div class="container">
        <div class="jumbotron">
        	<div class="row">
        		<div class="col-md-4" id="topic">
					<h1>照片專區</h1>
					</br>
					<c:if test="${not empty errorMsgs}">
					請修正以下錯誤:
                    	<ul>
                        	<c:forEach var="message" items="${errorMsgs}">
                            	<li>${message}</li>
                        	</c:forEach>
                    	</ul>
                	</c:if>
				</div>
        	</div>
            </br>
            <div class="row">
            	<table class="table table-bordered" id="table">
  						<thead>
    						<tr align='center' valign='middle' id="thead">
      							<td><nobr>分組</nobr></td>
      							<td>賽事</td>
      							<td>最後上傳/修改時間</td>
      							<td>標題</td>
      							<td>備註</td>
      							<td>標籤</td>
      							<td></td>
      							<td></td>
      							
    						</tr>
  						</thead>
  						<tbody>
  							<c:forEach var="gameMediaSvc" items="${gameMediaSvc.all}">
								<c:forEach var="gameMediaType" items="${gameMediaSvc.mediaType}">
									<c:if test="${gameMediaType eq 'photo'}">
  										<tr align='center' valign='middle'>
      										<td>${gameMediaSvc.gamesVO.groupsVO.groupName}</td>
      										<td>${gameMediaSvc.gamesVO.teamAVO.teamName} </br>VS</br> ${gameMediaSvc.gamesVO.teamBVO.teamName}</td>
      										<td>${gameMediaSvc.mediaDate}</td>
      										<td>${gameMediaSvc.mediasName}</td>
      										<td>${gameMediaSvc.descriptions}</td>
      										<td>${gameMediaSvc.tag}</td>
      										<td>
      											<Form method="post" action="<%=request.getContextPath() %>/GameMedia.do" id="update">
      												<button type="submit" class="btn btn-info">檢視</button>
      												<input type="hidden" name="mediaID" value="${gameMediaSvc.mediaID}"> 
                                           			<input type="hidden" name="action" value="getOnePhotoForUpdate">
                                       			</Form>
                                    		</td>
                                    		<td>
                                        		<Form method="post" action="<%=request.getContextPath() %>/GameMedia.do" id="delete">    
      												<button type="submit" class="btn btn-danger">刪除</button>
													<input type="hidden" name="mediaID" value="${gameMediaSvc.mediaID}"> 
                                           			<input type="hidden" name="action" value="deletePhoto">
												</Form>
      										</td>
    									</tr>
    								</c:if>
  								</c:forEach>
  							</c:forEach>
  						</tbody>
				</table>
            </div>
            
			<jsp:include page="/footer.jsp" />  
        </div>
    </div>
    <!--主文(結束)-->
	<jsp:include page="/footer_css.jsp" />        
   <script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
	$(document).ready(function () {
		$('#table').DataTable();
	});
	</script>

</body>
</html>
