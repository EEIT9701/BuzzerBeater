<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="locSvc" class="eeit.locationinfo.model.LocationinfoService" scope="page"/>
<jsp:useBean id="groupRegSvc" class="eeit.groupreg.model.GroupRegService" scope="page"/>

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <jsp:include page="/header_css.jsp" />
        <jsp:include page="/font_css.jsp" />
        <style>
/*         thead{ */
/* 	      background-color: #d62d67; */
/*     	  color: #e9e9e9; */
/*         } */
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
        table,form[name="addLocation"] {
        	font-size: 18px;
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
            	<a class="blockUI" href="<%=request.getContextPath() %>/index.jsp">
            		<span>使用者功能</span>
            	</a>
        	</span>&gt;
        	<span>
            	<a class="blockUI" href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
            		<span>賽季管理</span>
            	</a>
        	</span>&gt;
        	        	<span>
            	<a href="<%=request.getContextPath() %>/Season.do?action=TO_GROUPS_BACK&seasonID=1003">
            		<span>分組列表</span>
            	</a>
        	</span>&gt;
        	<span><span>自動賽程安排系統</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
			<!-- 網頁內容 -->
			<h2>自動賽程安排系統</h2>
				<table class="table table-bordered">
		            <thead style="background-color:#d62d67;color:#e9e9e9;">
			            <tr>
                    		<td>賽季名稱</td>
                    		<td>分組名稱</td>
		                    <td>隊伍數量上限</td>
		                    <td>隊伍數量下限</td>
		                    <td>目前隊伍數量</td>
		                    <td>球隊成員上限</td>
		                    <td>球隊成員下限</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<tr>
			        		<td>${groupsVO.seasonVO.seasonName}</td>
			        		<td>${groupsVO.groupName}</td>
			        		<td>${groupsVO.maxTeams}</td>
			        		<td>${groupsVO.minTeams}</td>
			        		<td>${groupsVO.currentTeams}</td>
			        		<td>${groupsVO.maxPlayers}</td>
			        		<td>${groupsVO.minPlayers}</td>
			        	</tr>
			        </tbody>
			    </table>
			    
			    <table class="table table-bordered">
		            <thead style="background-color:#d62d67;color:#e9e9e9;">
			            <tr>
                    		<td>隊伍名稱</td>
		                    <td>報隊成員數量</td>
                    		<td>報名時間</td>
			            </tr>
			        </thead>
			
			        <tbody>
			        	<c:forEach var="groupRegVO" items="${groupsVO.groupRegSet}">
				        	<tr>
				        		<td>${groupRegVO.teamsVO.teamName}</td>
				        		<%--計算該隊報名此分組人數 --%>
				        		<c:set var="groupID" value="${groupRegVO.groupsVO.groupID}"/>
				        		<c:set var="teamID" value="${groupRegVO.teamsVO.teamID}"/>
				        		<c:set var="count" value="0"/>
				        		<c:forEach var="signUpPlayer" items="${groupRegSvc.findSignUpPlayer(groupID,teamID)}" varStatus="s">
				        			<c:set var="count" value="${s.index+1}"/>
				        		</c:forEach>
				        		<td>${count}</td>
				        		<td><fmt:formatDate value="${groupRegVO.registerDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				        	</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
			    
			    <div class="form-group row">
			    	<div class="col-md-2 col-md-offset-1">
					    <select class="form-control" id="gameSelect">
					    	<option>請選擇賽制</option>
					    	<option>單淘汰賽</option>
					    	<option>雙淘汰賽</option>
					    	<option>循環賽</option>
					    </select>
				    </div>
				    <span id="gamesNeeded" style="font-size:18px"></span>
			    </div>
			    
			    <form action="<%=request.getContextPath()%>/Groups.do" method="post" name="addLocation">
			    	<input type="hidden" name="action" value="SPLIT_LOCATIONS">
			    
			    	<div class="form-group col-md-5">
			    		<label>比賽地點</label>
						<select name="locationID" class="form-control">
							<c:forEach var="locVO" items="${locSvc.allList}">
								<option value="${locVO.locationID},${locVO.locationName}">${locVO.locationName}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group col-md-5">
				    	<label>單場賽事時間</label>
				        <select name="timeUnit" class="form-control">
				        	<c:forEach var="time" begin="10" end="300" step="10">
				        		<c:choose>
					        		<c:when test="${time==90}">
						    			<option value="${time}" selected="selected">${time} 分鐘</option>
					        		</c:when>
					        		<c:otherwise>
					        			<option value="${time}">${time} 分鐘</option>
					       			</c:otherwise>
				        		</c:choose>
				        	</c:forEach>
				        </select>
				    </div>
					
					<div class="form-group col-md-5">
						<label>時間(起)</label>
				    	<input type="text" class="form-control" name="beginDate" id="beginDate">
				    </div>
				    
				    <div class="form-group col-md-5">
				    	<label>時間(迄)</label>
				    	<input type="text" class="form-control" name="endDate" id="endDate">
				    </div>
				    
					<div class="col-md-1">
						<br><br>
				    	<input type="button" class="btn btn-primary" id="btnAddLocation" value="新增">
				    </div>
			    </form>
			    <table class="table table-bordered" id="timeList">
		            <thead>
			       		
			       		<tr style="background-color:#d62d67;color:#e9e9e9;">
                    		<td>#</td>
                    		<td>地點</td>
                    		<td>日期</td>
                    		<td>時間</td>
                    		<td>比賽時間</td>
			            </tr>
			            
			        </thead>
			
			        <tbody>
<%-- 			        	<c:forEach var="timeList" items="${timeList}" varStatus="s"> --%>
<!-- 				        	<tr> -->
<%-- 				        		<td>${s.index+1}</td> --%>
<%-- 				        		<td>${timeList.locationName}</td> --%>
<%-- 	                    		<td><fmt:formatDate value="${timeList.beginTime}" pattern="yyyy-MM-dd"/></td> --%>
<%-- 	                    		<td><fmt:formatDate value="${timeList.beginTime}" pattern="HH:mm"/> ~ <fmt:formatDate value="${timeList.endTime}" pattern="HH:mm"/></td> --%>
<%-- 	                    		<td>${timeList.timeUnit}分鐘</td> --%>
<!-- 	                    		<td> -->
<%-- 	                    			<form action="<%=request.getContextPath()%>/Groups.do" method="post"> --%>
<!-- 	                    				<input type="hidden" name="action" value="REMOVE_TIMELIST"> -->
<%-- 	                    				<input type="hidden" name="index" value="${s.index}"> --%>
<!-- 	                    				<input type="submit" value="刪除"> -->
<!-- 	                    			</form> -->
<!-- 	                    		</td> -->
<!-- 				        	</tr> -->
<%-- 			        	</c:forEach> --%>
			        </tbody>
			        <tfoot>
		        		
			        </tfoot>
			    </table>
			    
			    <div class="col-md-1">
		    		<button class="btn btn-info" onclick="history.back()">返回上一步</button>
				</div>
			    
			    <div class="col-md-2 col-md-offset-8">
					<form action="<%=request.getContextPath()%>/Groups.do" method="post">
						<input type="hidden" name="groupID" value="${groupsVO.groupID}">
						<input type="hidden" name="action" value="MAKE_SCHEDULE">
						<input type="submit" class="btn btn-success btn-lg blockUI" id="submit_move" value="自動安排賽程">
					</form>
				</div>
				<br><br><br><br><br><br>
			<!-- 網頁內容END -->
			<jsp:include page="/footer.jsp" />
	    	</div>
	    </div>    
	    <jsp:include page="/footer_css.jsp" />
	    
	    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
  		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
  		<%--timepicker套件，可選日期時間 --%>
		<link href='<%=request.getContextPath()%>/css/jquery-ui-timepicker-addon.css' rel='stylesheet'>
  		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-timepicker-addon.js"></script>
  		<script type='text/javascript' src='<%=request.getContextPath()%>/js/jquery-ui-sliderAccess.js'></script>
  		<%--遮罩插件 --%>  		
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-blockUI-1.33.js"></script>
	    
	<script type="text/javascript">
	var isChange = false;
	
	$(function(){
		
		// 定義一個全域變數在資料改變時為真
		$("input,textarea,select").change(function () {
            isChange = true;
            $(this).addClass("editing");
        });
		
		// 若資料有改變，離開頁面時會提示(Chrome似乎會蓋掉自訂提示?)
        $(window).bind('beforeunload', function (e) {
            if (isChange || $(".editing").get().length > 0) {
                return '資料尚未存檔，確定是否要離開？';
            }
        });
		
     	// 某些按鈕屬於正常流程便不須提示
        $("input:submit").click(function () {
            $(window).unbind('beforeunload');
        });
     	
     	$('#gameSelect').change(function(){
     		$('#gamesNeeded').text('需要安排 ${gamesNeeded} 場賽事');
     	})
		
		// 讀取頁面時自動取得
		loadList();
		
		// 取得JSON格式的場地列表
		function loadList(){
			$.getJSON("<%=request.getContextPath()%>/Groups.do",
				{'action':'GET_TIMELIST_JSON'}, function(data) {
				
				var docFrag = $(document.createDocumentFragment());
				var tb = $('#timeList>tbody');
				tb.empty();
				
				$.each(data, function(index, list) {
					var cell1 = $('<td></td>').text(index+1);
					var cell2 = $('<td></td>').text(list.locationName);
					var cell3 = $('<td></td>').text(list.date);
					var cell4 = $('<td></td>').text(list.beginTime + " ~ " + list.endTime);
					var cell5 = $('<td></td>').text(list.timeUnit);
					var cell6 = $('<td></td>').html('<input type="button" class="btn btn-danger" id="btnRemoveLocation" value="刪除">');
					
					var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);
					docFrag.append(row);
					tb.append(docFrag);
					
				})
			})
		}
		
		// 新增場地
		$('#btnAddLocation').on('click',function(){
			var timeList = $('form[name="addLocation"]').serialize();
			
			$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
			setTimeout(function(){
				$.unblockUI();
			},500)
			
			$.post('<%=request.getContextPath()%>/Groups.do', timeList, function(){
				loadList();
				$.unblockUI();
			})
		})
		
		// 移除場地
		$('#timeList').on('click', '#btnRemoveLocation', function(){
			var id = $(this).parents('tr').find('td:first-child').text();
			
			$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
			setTimeout(function(){
				$.unblockUI();
			},300)
			
			$.post('<%=request.getContextPath()%>/Groups.do?',
					{'listIndex':id, 'action':'REMOVE_TEMP_LIST'}, function(){
				loadList();
			})
		})
		
		// 時間選擇器
		var optTime = { dateFormat : 'yy-mm-dd',
						timeFormat : 'HH:mm:ss' };
		
		$('#beginDate').datetimepicker(optTime);
		$('#endDate').datetimepicker(optTime);
		
		// 處理中
		$('.blockUI').click(function(){
			$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
		})
	})
	</script>
    </body>

    </html>