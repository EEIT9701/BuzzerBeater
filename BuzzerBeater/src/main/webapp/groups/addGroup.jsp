<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	eeit.season.model.SeasonService sSvc = new eeit.season.model.SeasonService();
	Integer seasonID = Integer.valueOf(request.getParameter("seasonID"));
	request.setAttribute("seasonVO", sSvc.findBySeasonID(seasonID));
%>

<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
		
    	<jsp:include page="/header_css.jsp" />  
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
            	<a class="blockUI" href="<%=request.getContextPath() %>/index.jsp">
            		<span>使用者功能</span>
            	</a>
        	</span>
        	&gt;
        	<span>
            	<a class="blockUI" href="<%=request.getContextPath() %>/season/seasonList_back.jsp">
            		<span>賽季管理</span>
            	</a>
        	</span>
        	&gt;
        	<span>
            	<a class="blockUI" href="<%=request.getContextPath() %>/groups/groupList_back.jsp?seasonID=${seasonVO.seasonID}">
            		<span>${seasonVO.seasonName}</span>
            	</a>
        	</span>
        	&gt;
        	<span>新增分組</span>
    	</div>
    	<!--上層導覽列(結束) -->
			<div class="col-md-12">

			<h2>新增分組</h2>
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
			
			<div class="col-md-12">
			<form method="post" action="<%=request.getContextPath()%>/Groups.do" id="addSeason">
				<input type="hidden" name="action" value="ADD_GROUP">
				<input type="hidden" name="seasonID" value="${seasonVO.seasonID}">
				
				<div class="form-group row">
					<label for="seasonName" class="col-2 col-form-label">分組名稱</label>
					<input class="form-control" type="text" value="${groupsVO.groupName}" id="groupName" name="groupName">
				</div>
				
				<div class="form-group row">
					<label for="seasonBeginDate" class="col-2 col-form-label">球隊數量上限</label>
					<input class="form-control" type="number" value="${groupsVO.maxTeams}" id="maxTeams" name="maxTeams">
				</div>

				<div class="form-group row">
					<label for="seasonEndDate" class="col-2 col-form-label">球隊數量下限</label>
					<input class="form-control" type="number" value="${groupsVO.minTeams}" id="minTeams" name="minTeams">
				</div>
				
				<div class="form-group row">
					<label for="signUpBegin" class="col-2 col-form-label">球隊成員上限</label>
					<input class="form-control" type="number" value="${groupsVO.maxPlayers}" id="maxPlayers" name="maxPlayers">
				</div>

				<div class="form-group row">
					<label for="signUpEnd" class="col-2 col-form-label">球隊成員下限</label>
					<input class="form-control" type="number" value="${groupsVO.minPlayers}" id="minPlayers" name="minPlayers">
				</div>
				
				<br>
				
				<div class="col-md-3 col-md-offset-9">
				    <input type="submit" id="submit_move" class="btn btn-success btn-lg" value="建立分組">
					<a href="<%=request.getContextPath() %>/groups/groupList_back.jsp?seasonID=${seasonVO.seasonID}">
						<input type="button" class="btn btn-danger btn-lg blockUI" value="取消">
					</a>
				</div>
				
			</form>
		    <br><br><br><br><br><br><br><br>
			</div>
				
		    </div>
		    <jsp:include page="/footer.jsp" />
		    </div>
	    </div>
		<jsp:include page="/footer_css.jsp" />
		
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css">
  		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
  		
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
			
	        $('.blockUI').click(function(){
				$.blockUI({ message: '<h3>處理中，請稍候</h3><img src="<%=request.getContextPath()%>/images/loading01.gif">'});
			})
			
		})
	
	
		</script>
		
    </body>
    </html>