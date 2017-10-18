<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    	
        <title>Season</title>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
	 <div class="container">
        <div class="jumbotron">
            <!--表格(開始)-->
            <!--****************-->
            <!-- 第一列(開始) -->
            <!--****************-->
            <div class="row">
                <!--第一列-左邊表格-格式_.col-md-8-->
                <div class="賽季">
                                                       賽季
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>賽季名稱</th>
                                <th>賽季開始時間</th>
                                <th>賽季結束時間</th>
                                <th>報名開始時間</th>
                                <th>報名截止時間</th>
                                <th>狀態</th>
                            </tr>
                        </thead>
                        
                        <tbody>
			        	<c:forEach var="sVO" items="${set}">
			        		<tr>
			        			<td><a href="<%=request.getContextPath() %>/Season.do?action=GET_GROUPS&seasonID=${sVO.seasonID}">${sVO.seasonName}</a></td>
			        			<td>${sVO.seasonBeginDate}</td>
			        			<td>${sVO.seasonEndDate}</td>
			        			<td>${sVO.signUpBegin}</td>
			        			<td>${sVO.signUpEnd}</td>
			        		</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
		    </div>
	    </div>

                    </table>
                    <!--</div>-->
                </div>
	    <jsp:include page="/footer.jsp" />


    </body>

    </html>