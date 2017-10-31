<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<title>BuzzerBeater-球員管理</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
			<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
			<!-- ***套用新的模太框檔案*** -->
<script src="<%=request.getContextPath()%>/dist/jdialog.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/jdialog.min.css">
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
			<jsp:include page="/header_css.jsp" />
			<style>
            #img1 {
                width: 40px;
                height: 40px;
                margin: auto;
            }
            </style>
			
		</head>

		<body>

			<jsp:include page="/header.jsp" />
			<!--主文(開始)-->
			<div class="container">
				<div class="jumbotron">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button type="button" class="btn btn-warning" data-toggle="JDialog" data-target="dialog-4" id="button_insert">新增</button>
<!-- 								<button type="submit" class="btn btn-warning">新增球員</button> -->
								<input type="hidden" name="action" value="insertMyPlayer">
						</div>
						<div class="col-md-4"></div>
					</div>
					<div class="col-md-4"></div>
					<!--表格(開始)-->
					<!--****************-->
					<!-- 第一列(開始) -->
					<!--****************-->
					<div class="row">
						<!--第一列-左邊表格-格式_.col-md-8-->
						<div class="col-md-12">
							<div class="col-md-12">
								<table class="table table-bordered" id="table">
									<thead>
										<tr>
										    <th>球員照片</th>
											<th>球員姓名</th>
											<th>身分證ID</th>
											<th>背號</th>
											<th>位置</th>
											<th>身高</th>
											<th>體重</th>
											<th>生日</th>
											<th>國籍</th>
											<th></th>
											<th></th>

										</tr>
									</thead>
									<tbody>
										<c:forEach var="playersVO" items="${playerSvc.allPlayer}">
											<tr align='center' valign='middle'>
											    <td><img id="img1" src="data:image/jpeg;base64,${playersVO.photo}"></td>
												<td>${playersVO.playerName}</td>
												<td>${playersVO.id}</td>
												<td></td>
												<td></td>
												<td>${playersVO.height}</td>
												<td>${playersVO.weights}</td>
												<td>${playersVO.birthday}</td>
												<td>${playersVO.nationality}</td>
												<td>
													<Form method="post" action="<%=request.getContextPath() %>/Players.do">
														<button type="submit" class="btn btn-info">修改</button>
                                                        <input type="hidden" name="action" value="updatePlayer">
                                                        <input type="hidden" name="photo" value="${playersVO.photo}">
                                                        <input type="hidden" name="playerID" value="${playersVO.playerID}">
                                                        <input type="hidden" name="playerName" value="${playersVO.playerName}">
                                                        <input type="hidden" name="id" value="${playersVO.id}">
                                                        <input type="hidden" name="height" value="${playersVO.height}">
                                                        <input type="hidden" name="weights" value="${playersVO.weights}">
                                                        <input type="hidden" name="birthday" value="${playersVO.birthday}">
                                                        <input type="hidden" name="nationality" value="${playersVO.nationality}">
													</Form>
													</td>
												<td>
													<Form method="post" action="<%=request.getContextPath() %>/Players.do">
														<button type="submit" class="btn btn-danger">刪除</button> <input type="hidden" name="playerID" value="${playersVO.playerID}">														<input type="hidden" name="action" value="delete">
													</Form>
												</td>
											</tr>



										</c:forEach>
								</table>
<div class="col-md-4"></div>
                                        <div class="col-md-4">
                                            <!-- Button -->
                                            <div class="col-md-4">
                                            <form action="<%=request.getContextPath() %>/Teams.do">
                                                <button type="submit" class="btn btn-warning">上一步</button>
                                                <input type="hidden" name="action" value="insertMyTeam">
										
										</form>
                                            </div>
                            </Form>
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <form action="<%=request.getContextPath() %>/Players.do">
                                    <button type="submit" class="btn btn-warning">下一步</button>
                                    <input type="hidden" name="action" value="goTolistAllPlayer_back">
										
                                </form>
                            </div>
                            </div>
                            <div class="col-md-4"></div>
							</div>
						</div>
					</div>

					<jsp:include page="/footer.jsp" />

				</div>
			</div>
			<!--主文(結束)-->

<%-- 			<jsp:include page="/footer_css.jsp" /> --%>
			<!-- 模太框 -->
	<div class="jDialog" id="dialog-4">
		<div class="content">
		 <H3>新增帳號</H3>
			     <input id="MemberInfoVO_acc" placeholder="會員帳號" type="text" value="" required>
			     <input id="MemberInfoVO_name"  placeholder="會員名稱" type="text" value="" required>
			     <input id="MemberInfoVO_auth"  placeholder="權限"  type="text" value="" required>
			 <div>
				<button class="button" data-dismiss="JDialog" id="jDialogButton">確定</button>
			</div>
		</div>
	</div>

			<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
			<script>
			$(function(){	

				
				//模太框相關按鈕
				$(".JDialog").jDialog({		
				     skinClassName : 'demo',
				     animationType : 'flip',
				     allowOverlay : false
		       });
			    
				$('#button_insert').on('click', function(){ 
					console.log(123);

			    });
				$('#jDialogButton').on('click', function(){
					//抓input 的值
					var acc =  $('#MemberInfoVO_acc').val();
					var name = $('#MemberInfoVO_name').val();
					var auth = $('#MemberInfoVO_auth').val();
					if(acc!= '' & name!= '' & auth != '' ){
						//取得目前時間
						registerTimeToMs = Date.now() + 28800000; //台北時間+8小時
						//alert(registerTimeToMs);
						registerTime = new Date(registerTimeToMs);
						
						//把input 清空
						$('#MemberInfoVO_acc').val('');
						$('#MemberInfoVO_name').val('');
						$('#MemberInfoVO_auth').val('');
						
						var dataStr = JSON.stringify({ acc:acc, name:name, auth:auth, registerTime:registerTime })
						$.post('/BuzzerBeater/memberInfoServlet.do', {'action':'INSERT', 'data':dataStr}, function(datas){
							//只是把新增資料傳回後台 不需回傳東西, 或做輸入與法判斷
							alert("新增成功");
							location.reload();
				       	}) 
				    }else {
				    	alert("新增失敗");
				    }
					
				});
				
				
		        $('#table').DataTable({
					columnDefs: [{ width: 200, targets: 6}],
					"lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
					"pagingType": "full_numbers",
					"language": {
						"lengthMenu":"每一頁顯示_MENU_ 筆資料",
						"zeroRecords":"查無資料",
						"info":"現在正在第_PAGE_ 頁，總共有_PAGES_ 頁",
						"infoEmpty":"無資料",
						"infoFiltered":"(總共搜尋了_MAX_ 筆資料)",
						"search":"搜尋：",
						"paginate":{
							"first":"第一頁",
							"previous":"上一頁",
							"next":"下一頁",
							"last":"最末頁"					
						}
				  }
				})
       });
			</script>
			
 			

		</body>

		</html>