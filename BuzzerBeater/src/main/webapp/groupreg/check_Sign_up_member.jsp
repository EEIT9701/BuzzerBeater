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

        </head>

        <body>
            <jsp:include page="/header.jsp" />

            <div class="container">
                <div class="jumbotron">
                    <!-- 網頁內容 -->
                            <h2>繳費</h2>
                    <form class="form-horizontal" method="post" action="<%= request.getContextPath() %>/GroupReg.do">
                        <fieldset>
                            <!-- Form Name -->
                            <!-- Text input-->

                            <div class="form-group">
                                <div class="col-md-3">
                                    	<p>自行繳費</p>
                                </div>
                                <label class="col-md-3 control-label" for="account">帳號後五碼</label>
                                <div class="col-md-3">
                                    <input id="account" name="account" placeholder="請輸入帳號後五碼" class="form-control input-md" type="text" required>
                                </div>
                                <div class="col-md-3" >
                                    <button type="submit" id="send" name="send" class="btn btn-primary" style="margin-top: 6px;">送出</button>
                                    <input type="hidden" name="action" value="INSERT">
                                </div>
                            </div>
                        </fieldset>
                    </form>
                             <div >
                                <label class="col-md-4 control-label" for="account"><a href="https://tw.yahoo.com/">123</a></label>
                                <div class="col-md-4">
                                </div>
                            </div>
                            <button type="button" class="btn btn-lg btn-danger">確認</button>

                    <!-- 網頁內容END -->
                    <jsp:include page="/footer.jsp" />
                </div>
            </div>
            <!-- End of container -->


            <jsp:include page="/footer_css.jsp" />
        </body>

        </html>