<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>EEIT97-第一組</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <style>
    #table{
	table-layout: fixed;
	}
	#thead{
	font-weight:bold;
	}
    </style>

</head>
<body>

<jsp:include page="/header.jsp" />
<jsp:useBean id="gameMediaSvc"  scope="page" class="eeit.gamemedia.model.GameMediaService" />
    <!--主文(開始)-->
    <div class="container">
        <div class="jumbotron">
            <div class="row">
				<div class="col-md-3">
					<h2>影片內容修改</h2>
				</div>
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
    					</tr>
  					</thead>
  					<tbody>
  						<tr align='center' valign='middle' id='data'>
  							<td>${gameMediaVO.gamesVO.gameID}</td>
      						<td>${gameMediaVO.mediaID}</td>
      						<td>${gameMediaVO.mediaDate}</td>
      						<td>${gameMediaVO.mediasName}</td>
      						<td>${gameMediaVO.descriptions}</td>
      						<td>${gameMediaVO.tag}</td>
      						<td>
      							<form>
      								<input type="submit" value="確定" id="check">
      								<input type="hidden" name="action" value="Update">
      								<input type="hidden" name="" value="Update">
      							</form>
      							<form>
      								<input type="button" value="取消" id="cancel">
      							</form>
      							
      						</td>
  						</tr>
  					</tbody>
  				</table>
			</div>
        </div>
    </div>
    <!--主文(結束)-->

<jsp:include page="/footer.jsp" />
<script>
	$('#check').click(function(){
		$('#check').css("value","取消")
	})
</script>        
</body>
</html>
