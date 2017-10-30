<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EEIT97-第一組</title>
	<jsp:include page="/header_css.jsp" />
	
	 <!--滑鼠移入，顯示表格("2-1")-->
    <link href="js/jquery-ui.css" rel="stylesheet">
    
     <!--計時器("2-1")-->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/jquery.countdown.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body id="home">

	<!--標頭(開始)-->
	<jsp:include page="/header.jsp" />
	<!--標頭(結束)-->
	
	
	    <!--計時器(開始)-->
    <div class="pageheader fixed-demo dark" style="padding-top:0px">

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                </div>
                <div class="col-md-6">
                    <div id="countdown">
                        <div>報名日期倒數 :</div>
                    </div>
                    <p style="color:#303030" id="note"></p>
                </div>
            </div>
        </div>
    </div>
	
	
    <!--主文(開始)-->
    
    <div class="container">
        <div class="jumbotron">
           <!--*****************-->
            <!--廣告輪播(開始)-->
            <!--800x600(50萬像素),1024x768(80萬像素),1280x960(130萬像素)-->
            <div class="carousel slide" id="myCarousel">
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#myCarousel"></li>
                    <li data-slide-to="1" data-target="#myCarousel" class=""></li>
                    <li data-slide-to="2" data-target="#myCarousel" class=""></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img class="img-responsive center-block" alt="First slide" src="images/800x600_001.jpg">
                        <div class="carousel-caption">
                            <h4>First Thumbnail label</h4>
                            <p>測試1</p>
                        </div>
                    </div>
                    <div class="item">
                        <img class="img-responsive center-block" alt="Second slide" src="images/800x600_002.jpg">
                        <div class="carousel-caption">
                            <h4>Second Thumbnail label</h4>
                            <p>測試2</p>
                        </div>
                    </div>
                    <div class="item">
                        <img class="img-responsive center-block" alt="Third slide" src="images/800x600_003.jpg">
                        <div class="carousel-caption">
                            <h4>Third Thumbnail label</h4>
                            <p>測試3</p>
                        </div>
                    </div>
                </div>

                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
            <!--廣告輪播(結束)-->
            <hr>

            <!--表格(開始)-->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="2">1</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@TwBootstrap</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td colspan="2">Larry the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12">
                    <!--滑鼠移入，顯示表格(開始)-->
                    <div id="tabs">
                        <ul>
                            <!--<h3>戰績排行</h3>-->
                            <li><a href="#tabs-1">First</a></li>
                            <li><a href="#tabs-2">Second</a></li>
                            <li><a href="#tabs-3">Third</a></li>
                        </ul>
                        <div id="tabs-1">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="2">1</td>
                                        <td>Willy</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@TwBootstrap</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td colspan="2">Larry the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="tabs-2">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="2">1</td>
                                        <td>Billy</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@TwBootstrap</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td colspan="2">Larry the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="tabs-3">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="2">1</td>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@TwBootstrap</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td colspan="2">Larry the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--滑鼠移入，顯示表格(結束)-->
                    <!--表格(結束)-->
                </div>
            </div>
            <hr>

            <!--表格(結束)-->

            <!--標尾(開始)-->
			<jsp:include page="/footer.jsp" />  
            <!--標尾(結束)-->

        </div>
    </div>
    <!--主文(結束)-->
    
	<jsp:include page="/footer_css.jsp" />
    
    <!-- 輪播廣告 -->
	<script src="js/bootstrap.min.js"></script>

    <!--滑鼠移入，顯示表格("2-2")-->
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/jquery-ui.js"></script>
        <script>

                $(function () {
                    $("#tabs").tabs({
                        event: "mouseover"
                    });
                });
    </script>
    
    <!--計時器("2-2")-->
    <script src="js/jquery.countdown.js"></script>
    <script src="js/script.js" charset="big5" type="text/javascript" ></script>

</body>
</html>