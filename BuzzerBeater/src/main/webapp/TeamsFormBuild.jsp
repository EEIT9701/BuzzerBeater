<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
    <html lang="zh" class="no-js">

    <head>
      	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    	<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    	
        <title>Season</title>
        <jsp:include page="/header_css.jsp" />
        <script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
        <style>
        .img {
        position: relative;
    	background-position: center;
    	background-repeat: no-repeat;
    	background-size: contain;
    	width: 200px;
    	height: 200px;
    	background-color: #353535;
    	float: left;
    	padding: 0;
    	margin: 10px;
    	border-radius: 3px;
    	}
    	</style>
    	<script>
    	$(function () {
            function format_float(num, pos) {
                var size = Math.pow(10, pos);
                return Math.round(num * size) / size;
            }
            function preview(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('.preview').attr('src', e.target.result);
                        var KB = format_float(e.total / 1024, 2);
                        $('.size').text("檔案大小：" + KB + " KB");
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("body").on("change", ".upl", function () {
                preview(this);
            })
        })
        </script>
    </head>

    <body>
	    <jsp:include page="/header.jsp" />
	
		<div class="container">
		<div class="jumbotron">
			<!-- 網頁內容 -->
			<form class="form-horizontal">
        <fieldset>
            <!-- Form Name -->
            <legend >球隊建立</legend>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="teamName">球隊名稱</label>
                <div class="col-md-4">
                    <input id="teamName" name="teamName" placeholder="球隊名稱" class="form-control input-md" type="text" required>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="captainEmail">隊長Email</label>
                <div class="col-md-4">
                    <input id="captainEmail" name="captainEmail" placeholder="隊長Email" class="form-control input-md"  type="text" required>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="captainPhone">隊長連絡電話</label>
                <div class="col-md-4">
                    <input id="captainPhone" name="captainPhone" placeholder="隊長連絡電話" class="form-control input-md" type="text" required>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="coachName">總教練</label>
                <div class="col-md-4">
                    <input id="coachName" name="coachName" placeholder="總教練" class="form-control input-md" type="text" required>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="bossName">老闆</label>
                <div class="col-md-4">
                    <input id="bossName" name="bossName" placeholder="老闆" class="form-control input-md" type="text" required>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
          	    <label class="col-md-4 control-label" for="remarks">備註</label>
                <div class="col-md-4">
                    <textarea id="remarks" name="remarks" placeholder="備註" class="form-control input-md"  style="resize: none"  type="text"></textarea>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="teamBadge">隊徽</label>
                <input type='file' class="upl" id="teamBadge">
                <div class="col-md-4">
                    <img class="preview" style="max-width: 150px; max-height: 150px;">
                    <div class="size"></div>
                </div>
            </div>

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="send"></label>
                <div class="col-md-4">
                    <button id="send" name="send" class="btn btn-primary">送出</button>
                </div>
            </div>

        </fieldset>
    </form>
		
			<!-- 網頁內容END -->
	    	<jsp:include page="/footer.jsp" />
	    	</div>
	    </div><!-- End of container -->
	    
	    
	    <jsp:include page="/footer_css.jsp" />
    </body>

    </html>