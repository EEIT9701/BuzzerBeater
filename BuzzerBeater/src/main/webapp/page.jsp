<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EEIT97-第一組</title>
        <!--標頭樣式2-1-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="fonts/FontAwesome/font-awesome.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/bootsnav.css" rel="stylesheet">
    <link href="css/htmleaf-demo.css" rel="stylesheet" type="text/css" >
    <link href="css/overwrite.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/color.css" rel="stylesheet">

    <style>
        .pageheader.fixed-demo.dark {
            padding-top:30px
        }
    </style>


</head>
<body id="home">

	<!--標頭(開始)-->
	<jsp:include page="/header.jsp" />
	<!--標頭(結束)-->
	
    <!--主文(開始)-->
    <div class="container">
        <div class="jumbotron">
            <!--表格(開始)-->
            <!--對分好比例的DIV而言，如果那個DIV裡面要放"表格"在內層還要放一個全比例的尺寸(col-md-12)-->
            <!--****************-->
            <!-- 第一列(開始) -->
            <!--****************-->
            <div class="row">
                <!--第一列-左邊表格-格式_.col-md-8-->
                <div class="col-md-8">
                    .col-md-8
                    <!--<div class="col-md-12">-->
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
                    <!--</div>-->
                </div>
                <!--第一列-右邊表格-格式_.col-md-4-->
                <div class="col-md-4">
                    .col-md-4
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
                </div>
            </div>
            <!-- 第一列(結束) -->
            <!--****************-->
            <!--表格(結束)-->

            <hr>
            <!--標尾(開始)-->
			<jsp:include page="/footer.jsp" />  
            <!--標尾(結束)-->

        </div>
    </div>
    <!--主文(結束)-->



    <!--標頭樣式2-2-->
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootsnav.js"></script>
</body>
</html>