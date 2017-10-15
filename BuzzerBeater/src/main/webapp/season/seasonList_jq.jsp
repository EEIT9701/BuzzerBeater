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
			<div class="col-md-12">
		        <h2>賽季列表</h2>
		        <h4><a href="<%=request.getContextPath() %>/season/addSeason.jsp">新增賽季</a></h4>
		        <table class="table table-bordered" id="seasonList">
		            <thead>
			            <tr>
			                <td>賽季名稱</td>
			                <td>賽季開始日期</td>
			                <td>賽季結束日期</td>
			                <td>報名開始日期</td>
			                <td>報名結束日期</td>
			            </tr>
			        </thead>
			
			        <tbody>
			                <!-- table of seasonList -->
			        </tbody>
			    </table>
		    </div>
	    </div>
	    <jsp:include page="/footer.jsp" />

        <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
        <script>
            $(document).ready(function() {

                loadSeason();

                //查詢
                function loadSeason() {
                    $('#seasonList tbody tr').remove();

                    $.getJSON('<%=request.getContextPath() %>/Season.do', {
                            'action': 'GET_ALL_SEASON'
                        },
                        function(datas) {
                            var frag = $(document.createDocumentFragment());
                            $.each(datas, function(idx, season) {
                                var cell1 = $('<td></td>').text(season.seasonName);
                                //三元運算子 (條件式) ? (if true) : (if false)
                                var cell2 = (season.seasonBeginDate == null) ? $('<td></td>').text("") : $('<td></td>').text(season.seasonBeginDate);
                                var cell3 = (season.seasonEndDate == null) ? $('<td></td>').text("") : $('<td></td>').text(season.seasonEndDate);
                                var cell4 = (season.signUpBegin == null) ? $('<td></td>').text("") : $('<td></td>').text(season.signUpBegin);
                                var cell5 = (season.signUpEnd == null) ? $('<td></td>').text("") : $('<td></td>').text(season.signUpEnd);
                                // var cell6 = $('<td></td>').text(season.descritpions);
                                var cell7 = $('<td></td>').html('<FORM name="updateSeason" method="post" action="<%=request.getContextPath() %>/Season.do"><input type="submit" value="修改"><input type="hidden" name="season_ID" value="' + season.seasonID + '"><input type="hidden" name="action" value="GET_ONE_FOR_UPDATE"></FORM>');
                                var cell8 = $('<td></td>').html('<FORM name="updateSeason" method="post" action="<%=request.getContextPath() %>/Season.do"><input type="submit" value="刪除"><input type="hidden" name="season_ID" value="' + season.seasonID + '"><input type="hidden" name="action" value="DELETE_SEASON"></FORM>');
                                var row = $('<tr></tr>');
                                row.append([cell1, cell2, cell3, cell4, cell5, cell7, cell8]);
                                frag.append(row);
                            })

                            $('#seasonList>tbody').append(frag);
                        })
                }


            })
        </script>
    </body>

    </html>