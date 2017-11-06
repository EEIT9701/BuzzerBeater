<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--新增前先將存在session中的資料刪除 --%>
<%request.getSession().removeAttribute("seasonVO"); %>
<%request.getSession().removeAttribute("groupsSet"); %>

<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
		
    	<jsp:include page="/header_css.jsp" />  
<%--     	<jsp:include page="/font_css.jsp" /> --%>
	<style>
		h2,h3 {		
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
        #addSeason {
        	font-size: 22px;
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
        	</span>
        	&gt;
        	<span>
            	<a href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
            		<span>賽季管理</span>
            	</a>
        	</span>
        	&gt;
        	<span>新增賽季</span>
    	</div>
    	<!--上層導覽列(結束) -->
			<div class="col-md-12">

			<h2>新增賽季</h2>
			<c:if test="${not empty errorMsgs}">
				<p style="color:red">請修正以下錯誤:</p>
				<ul style="color:red">
					<c:forEach var="message" items="${errorMsgs}">
						<c:if test="${not empty message}">
							<li >${message}</li>
						</c:if>
					</c:forEach>
				</ul>
			</c:if>
			
			<div class="col-md-2 col-md-offset-9">
				<a href="<%=request.getContextPath()%>/season/addSeason_excel.jsp">
					<input type="submit" class="btn btn-info btn-lg" value="使用EXCEL建立完整賽季">
				</a>
			</div>
			
			<div class="col-md-12">
			<form method="post" action="<%=request.getContextPath()%>/Season.do" id="addSeason">
				<input type="hidden" name="action" value="TO_ADD_GROUPS">
				
				<div class="form-group row">
					<label for="seasonName" class="col-2 col-form-label">賽事名稱</label>
					<input class="form-control" type="text" value="${seasonVO.seasonName}" id="seasonName" name="seasonName">
				</div>
				
				<div class="form-group row">
					<label for="seasonBeginDate" class="col-2 col-form-label">賽季開始日期</label>
					<input class="form-control" type="text" value="${seasonVO.seasonBeginDate}" id="seasonBeginDate" name="seasonBeginDate">
				</div>

				<div class="form-group row">
					<label for="seasonEndDate" class="col-2 col-form-label">賽季結束日期</label>
					<input class="form-control" type="text" value="${seasonVO.seasonEndDate}" id="seasonEndDate" name="seasonEndDate">
				</div>
				
				<div class="form-group row">
					<label for="signUpBegin" class="col-2 col-form-label">報名開始時間</label>
					<input class="form-control" type="text" value="${seasonVO.signUpBegin}" id="signUpBegin" name="signUpBegin">
				</div>

				<div class="form-group row">
					<label for="signUpEnd" class="col-2 col-form-label">報名截止時間</label>
					<input class="form-control" type="text" value="${seasonVO.signUpEnd}" id="signUpEnd" name="signUpEnd">
				</div>
				
				<div class="form-group row">
					<label for="descriptions">備註</label>
					<textarea class="form-control" rows="5" id="descriptions" name="descriptions">${seasonVO.descriptions}</textarea>
				</div>
				
				<br>
				
				<div class="col-md-1">
		    		<button class="btn btn-info blockUI" onclick="history.back()">取消新增</button>
				</div>
								
				<div class="col-md-3 col-md-offset-8">
				    <input type="submit" id="submit" class="btn btn-success btn-lg blockUI" value="下一步，建立分組">
				</div>
				
				    <br><br><br><br><br><br><br><br>
			</form>
			</div>
				
		    </div>
		    <jsp:include page="/footer.jsp" />
		    </div>
	    </div>
		<jsp:include page="/footer_css.jsp" />
		
		
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css">
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
	        $("#submit").click(function () {
	            $(window).unbind('beforeunload');
	        });
			
			// time-picker套件，需先匯入script上面6行
			var opt = { dateFormat : 'yy-mm-dd',
						showTime : false,
						timeFormat : '' };
		
			$('#seasonBeginDate').datetimepicker(opt);
			$('#seasonEndDate').datetimepicker(opt);
			
			var optTime = { dateFormat : 'yy-mm-dd',
							timeFormat : 'HH:mm:ss' };
			
			$('#signUpBegin').datetimepicker(optTime);
			$('#signUpEnd').datetimepicker(optTime);
			
			// 處理中
			$('a,.blockUI').click(function(){
				$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
			})
			
	    
		})
	
	
		</script>
		
    </body>
    </html>