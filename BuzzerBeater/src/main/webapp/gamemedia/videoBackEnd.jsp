<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="eeit.season.model.*"%>
<%@ page import="eeit.groups.model.*"%>
<<<<<<< HEAD
<%@ page import="java.util.*"%>
<%
// 	SeasonService seasonSvc = new SeasonService();
// 	List<HashMap<String, Object>> list = seasonSvc.getAll();
	SeasonDAO_Hibernate dao = new SeasonDAO_Hibernate();
	Set<SeasonVO> list = dao.getAll();
	request.setAttribute("list", list);

	SeasonVO seasonVO = new SeasonVO();
	Set<GroupsVO> groupSet = seasonVO.getGroupsSet();
	request.setAttribute("groupSet", groupSet);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EEIT97-第一組</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" -->
<!-- 	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />

<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->

<style>
#search {
	margin-bottom: 10px;
	margin-right: 0px;
	padding-right: 0px;
}

#button {
	padding: 7px;
}

#search-button {
	margin-left: 0px;
	padding-left: 0px;
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
					<h2>影片專區</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<div class="btn-group">
						<button type="button" class="btn btn-primary" id="button">賽季</button>
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span><span></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="list" items="${list}">
								<li id="season">${list.seasonName}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="btn-group">
						<button type="button" class="btn btn-primary" id="button">組別</button>
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span><span></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="set" items="${list}">
								<c:forEach var="g" items="${set.groupsSet}">
									<li>${g.groupName}</li>
								</c:forEach>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="btn-group">
						<button type="button" class="btn btn-primary" id="button">球隊</button>
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span><span></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="list" items="${list}">
								<li>${list.seasonName}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-offset-3 col-md-2" id="search">
					<input class="form-control input-sm" type="text"
						placeholder="請輸入標籤內容">
				</div>
				<div class="col-md-1" id="search-button">
					<input type="button" value="go">
				</div>
			</div>
			<div class="row"></div>
		</div>
	</div>
	<!--主文(結束)-->

	<jsp:include page="/footer.jsp" />
	<script>
		// 		$(function() {
		// 			$(".btn btn-primary dropdown-toggle").toggle();
		// 		});
	</script>
=======
<%@ page import="eeit.gamemedia.model.*"%>
<%@ page import="java.util.*"%>
<%
	SeasonService seasonSvc = new SeasonService();
	Set<HashMap<String, Object>> list = seasonSvc.getAll();
// 	SeasonDAO_Hibernate dao = new SeasonDAO_Hibernate();
// 	Set<SeasonVO> list = dao.getAll();
	request.setAttribute("list", list);

	SeasonVO seasonVO = new SeasonVO();
	Set<GroupsVO> groupSet = seasonVO.getGroupsSet();
	request.setAttribute("groupSet", groupSet);
	
	GameMediaDAO_JNDI gameMediaVO = new GameMediaDAO_JNDI();
	List<GameMediaVO> media = gameMediaVO.getAll();
	request.setAttribute("gameMediaVO", media);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EEIT97-第一組</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" -->
<!-- 	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />

<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->

<style>
#search {
	margin-bottom: 10px;
	margin-right: 0px;
	padding-right: 0px;
}

#button {
	padding: 7px;
}

#search-button {
	margin-left: 0px;
	padding-left: 0px;
	height:10px;
}
#myModalLabel{
	width:200px
}
#table{
	table-layout: fixed;
}
#uploadButton{
	margin:5px;
}
#cancelButton{
	margin:5px
}
#tabletopic{
	margin-left:3px
}
#thead{
	font-weight:bold;
}
#upload{
	height:5px;
	padding:17px;
	line-height:1px;
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
					<h2>影片專區</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<div class="btn-group">
						<button type="button" class="btn btn-primary" id="button">賽季</button>
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span><span></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="list" items="${list}">
								<li id="season">${list.seasonName}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="btn-group">
						<button type="button" class="btn btn-primary" id="button">組別</button>
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span><span></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="set" items="${list}">
								<c:forEach var="g" items="${set.groupsSet}">
									<li>${g.groupName}</li>
								</c:forEach>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="btn-group">
						<button type="button" class="btn btn-primary" id="button">球隊</button>
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span><span></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="list" items="${list}">
								<li>${list.seasonName}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-offset-3 col-md-2" id="search">
					<input class="form-control input-sm" type="text"
						placeholder="請輸入標籤內容">
				</div>
				<div class="col-md-1" id="search-button">
					<input type="button" value="go">
				</div>
			</div>
			</br>
			<div id="tabletopic"><h3>影音管理</h3></div>
			<div class="row">
				<table class="table table-bordered" id="table">
  						<thead>
    						<tr align='center' valign='middle' id="thead">
      							<td>分組</td>
      							<td>賽事</td>
      							<td>上傳日期</td>
      							<td>標題</td>
      							<td>備註</td>
      							<td>標籤</td>
      							<td></td>
    						</tr>
  						</thead>
  						<tbody>
  							<c:forEach var="gameMediaVO" items="${gameMediaVO}">
  								<tr align='center' valign='middle'>
      								<td>${gameMediaVO.gamesVO.gameID}</td>
      								<td>${gameMediaVO.gamesVO.gameID}</td>
      								<td>${gameMediaVO.mediaDate}</td>
      								<td>${gameMediaVO.mediasName}</td>
      								<td>${gameMediaVO.descriptions}</td>
      								<td>${gameMediaVO.tag}</td>
      								<td>
      									<input type="button" value="修改">
										<input type="button" value="刪除">
      								</td>
    							</tr>
  							</c:forEach>
  						</tbody>
				</table>
			</div>
			
			<div class="row">
				<div class="col-md-3"><h3>影片上傳</h3></div>
			</div>
			<div class="row">
				<button class="btn btn-sm" id="uploadButton"  data-toggle="modal" data-target="#myModal">選擇檔案</button>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
    					<div class="modal-dialog">
        					<div class="modal-content">
            					<div class="modal-header">
                					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                					<h4 class="modal-title" id="myModalLabel">檔案上傳</h4>
            					</div>
            				<div class="modal-body">
            					<div class="row">
  									<div class="col-md-12">
    									<div class="input-group">
      										<span class="input-group-btn">
        										<button class="btn btn-default" type="button" id="upload">選擇檔案</button>
      										</span>
      										<input type="text" class="form-control">
   										</div><!-- /input-group -->
									</div><!-- /.row -->
            					</div>
            					</br>
            					<div class="input-group">
            						<span class="input-group-addon">標題</span>
            							<input type="text" class="form-control">
        						</div>
        						</br>
        						<div class="input-group">
            						<span class="input-group-addon">備註</span>
            							<input type="text" class="form-control">
        						</div>
        						</br>
        						<div class="input-group">
            						<span class="input-group-addon">標籤</span>
            							<input type="text" class="form-control" placeholder="請用以,分格標籤     ex:張君雅,單手爆扣">
        						</div>
        						<div class="row">
        							<div class="col-md-offset-3">
            							<video controls>
            								<source src="D:/001.mp4" type="video/mp4">
            							</video>
            						</div>
        						</div>
        						
            				</div>
            				<div class="modal-footer">
                				<button type="button" class="btn btn-default" data-dismiss="modal">確認上傳</button>
                				<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
            				</div>
        					</div>
    					</div>
					</div>
			</div>
					
			
			
		</div>
	</div>
	<!--主文(結束)-->

<jsp:include page="/footer.jsp" />
<script>

</script>
>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git


</body>
</html>
