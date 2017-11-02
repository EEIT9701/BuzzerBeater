<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>EEIT97-第一組</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="/header_css.jsp" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <style>
    #table{
		table-layout: fixed;
	}
	#thead{
		font-weight:bold;
	}
	#video{
		width:100%;
		height:100%;
		padding-top:20px;
		padding-left:0px;
		padding-right:0px;
		align:middle;
	}
	#myModalLabel{
		width:200px
	}
	#myModalLabel1{
		width:200px
	}
	#videoset{
		margin-top:-75px;
		padding-top:0px;
	
	}
	#x{
		margin-right:-20px;
	}
	#x1{
		margin-right:-20px;
	}
    </style>

</head>
<body>

<jsp:include page="/header.jsp" />

    <!--主文(開始)-->
    <div class="container">
        <div class="jumbotron">
            <div class="row">
				<div class="col-md-3">
					<h2>檢視照片資料</h2>
				</div>
			</div>
			<div>
				<c:if test="${not empty errorMsgs}">
					<font color='red'>請修正以下錯誤:
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>
			</div>
			<div class="row">
				<table class="table table-bordered" id="table">
  					<thead>
    					<tr align='center' valign='middle' id="thead">
      						<td>分組</td>
      						<td>賽事</td>
      						<td>最後上傳/修改時間</td>
      						<td>標題</td>
      						<td>備註</td>
      						<td>標籤</td>
      						<td></td>
      						<td></td>
    					</tr>
  					<thead>
  					<tbody>
  						<tr align='center' valign='middle' id='data'>
  							<td>${gameMediaVO.gamesVO.groupsVO.groupName}</td>
      						<td>${gameMediaVO.gamesVO.teamAVO.teamName} </br>VS</br> ${gameMediaVO.gamesVO.teamBVO.teamName}</td>
      						<td>${gameMediaVO.mediaDate}</td>
      						<td>${gameMediaVO.mediasName}</td>
      						<td>${gameMediaVO.descriptions}</td>
      						<td>${gameMediaVO.tag}</td>
      						<td>
     							<button class="btn btn-info" id="priviewButton"  data-toggle="modal" data-target="#myModal">預覽</button>
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
    								<div class="modal-dialog">
        							<div class="modal-content">
            							<div class="modal-header">
                							<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="x">&times;</button>
                							<h4 class="modal-title" id="myModalLabel">預覽照片</h4>
            							</div>
            						<div class="modal-body">
            							<img src="data:image/jpeg;base64,${gameMediaVO.gamePhoto}">
            						</div>
            						<div class="modal-footer">
                						<button type="button" class="btn btn-warning" data-dismiss="modal">離開</button>
            						</div>
        							</div>
    								</div>
								</div>
      						</td>
      						<td>
								<button class="btn btn-warning" id="updateButton"  data-toggle="modal" data-target="#myModal">修改</button>
								<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true" data-backdrop="false">
    								<div class="modal-dialog">
        							<div class="modal-content">
            							<div class="modal-header">
                							<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="x1">&times;</button>
                							<h4 class="modal-title" id="myModalLabel1">修改照片</h4>
            							</div>
            						<div class="modal-body">
            							<div class="input-group">
            								<span class="input-group-addon">標題</span>
            								<input type="text" class="form-control" value="${gameMediaVO.mediasName}">
        								</div>
        								</br>
        								<div class="input-group">
            								<span class="input-group-addon">備註</span>
            								<input type="text" class="form-control" value="${gameMediaVO.descriptions}">
        								</div>
        								</br>
        								<div class="input-group">
            								<span class="input-group-addon">標籤</span>
            								<input type="text" class="form-control" value="${gameMediaVO.tag}">
        								</div>
            						</div>
            						<div class="modal-footer">
                						<button type="button" class="btn btn-warning" data-dismiss="modal">離開</button>
            						</div>
        							</div>
    								</div>
								</div>
      						</td>
  						</tr>
  					</tbody>
  				</table>
  				</br>
  				<form>
  					<button class="btn btn-danger" type="submit">回上頁</button>
  					<input type="hidden" name="action" value="cancel">
  				</form>	
			</div>
			<jsp:include page="/footer.jsp" />
        </div>
    </div>
    <!--主文(結束)-->

<jsp:include page="/footer_css.jsp" />
<script>
	
</script>        
</body>
</html>
