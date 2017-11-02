<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/header_css.jsp" />
	
	 <!--滑鼠移入，顯示表格("2-1")-->
    <link href="js/jquery-ui.css" rel="stylesheet">    
     <!--計時器("2-1")-->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/jquery.countdown.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
	<!--廣告輪播("2-1")-->
    <link rel="stylesheet" type="text/css" href="css/normalize_2.css" />
	<link rel="stylesheet" type="text/css" href="css/htmleaf-demo_3.css">
	<link type="text/css" rel="stylesheet" href="css/posterTvGrid.css"> 
	<style>
	body {
        background-color:rgba(197, 197, 197, 0.78);
        }
        .jumbotron{
        background-color: rgb(243, 242, 241);
        }
	</style>
</head>
<body id="home">

	<!--標頭(開始)-->
	<jsp:include page="/header.jsp" />
	<!--標頭(結束)-->
	
	
	    <!--計時器(開始)-->
<!--     <div class="pageheader fixed-demo dark" style="padding-top:0px"> -->

<!--         <div class="container"> -->
<!--             <div class="row">           -->
<!--                     <div id="countdown"> -->
<!--                         <div>報名日期倒數 :</div> -->
<!--                     </div> -->
<!--                     <p style="color:#303030" id="note"></p> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
	
	
    <!--主文(開始)-->
    
    <div class="container">
        <div class="jumbotron">
        <!--計時器(開始)-->
			<div class="row">          
				<div id="countdown">
					<div>賽季報名日期倒數 :</div>
				</div>
				<p style="color:#303030" id="note"></p>
            </div>
           <!--*****************-->
            <!--廣告輪播(開始)-->
            <!--800x600(50萬像素),1024x768(80萬像素),1280x960(130萬像素)-->
            <div class="htmleaf-container" style="margin-left: -80px;">
                <div class="htmleaf-content">
                    <div id="posterTvGrid" style="margin:40px auto 0 auto"></div>
                </div>
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
    
    <!-- 輪播廣告("2-2") -->
    <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/posterTvGrid.js"></script>
    <script type="text/javascript">
                var posterTvGrid = new posterTvGrid('posterTvGrid', { className: "posterTvGrid" }, [
                        { "img": "images\/1.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" },
                        { "img": "images\/2.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" },
                        { "img": "images\/3.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" },
                        { "img": "images\/4.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" },
                        { "img": "images\/5.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" },
                        { "img": "images\/6.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" },
                        { "img": "images\/7.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" },
                        { "img": "images\/8.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" },
                        { "img": "images\/9.jpg", "title": "Lorem ipsum dolor sit amet", "url": "http:\/\/www.htmleaf.com\/" }
                ]
                );
     </script>

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