<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	<!--數據王("2-1")-->
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/style_1.css">
	<!--icon載入-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="js/modernizr.js"></script>
	<style>
	body {
        background-color:rgba(197, 197, 197, 0.78);
        }
    .jumbotron{
        background-color: rgb(243, 242, 241);
        }
    thead{
    	font-family:微軟正黑體;  
    	font-size:larger;
    	font-weight:bold;
/*     	text-align:center; */
    }
    tbody{
    	font-family:微軟正黑體;  
/*     	text-align:center; */
    }
    .buttonStyle {
     /* Green */
    /*background-color: #4CAF50;*/
    	border: none;
    	color: white;
    	padding: 10px 15px;
    	text-align: center;
    	text-decoration: none;
    	display: inline-block;
    	font-size: 15px;
    	margin: 4px 2px;
    	cursor: pointer;
    	-webkit-transition-duration: 0.4s;
    	transition-duration: 0.4s;
    	border-radius: 10px;
    }

    .button1 {
    	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
    }

    .button2:hover {
    	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
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
            <div class="row">
  				<div class="col-md-6">
					<div id="countdown">
						<div>2017-18例行賽&nbsp;&nbsp;報名倒數 :</div>
					</div>
					<p style="color:#303030" id="note"></p>
				</div>
  				<div class="col-md-6">
  				<!--臉書分享("2-1")-->
  				<div>

    			<button class="buttonStyle button2 " style="background:rgb(59, 89, 152)">
        			<i class="fa fa-facebook-f fa-lg"></i>
   					 &nbsp;&nbsp;Facebook
    			</button>
    			<button class="buttonStyle button2 " style="background:rgb(29, 161, 242)">
        			<i class="fa fa-twitter fa-lg"></i>
        			&nbsp;&nbsp;Twitter
    			</button>
    			<button class="buttonStyle button2 " style="background:#00b900">
    			<img src="<%=request.getContextPath()%>/images//share-b.png" style="margin-bottom: -10px;width: 25px;"/>
    			&nbsp;&nbsp;Line
    			</button>

  				</div>
				<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fbeater.buzzer.562%2Fposts%2F103332380444755&width=500" width="500" height="171" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>  

				</div>
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
    			
    		<div class="cd-pricing-container">
                <ul class="cd-pricing-list cd-bounce-invert">
                    <li>
                        <ul class="cd-pricing-wrapper">
                            <li data-type="monthly" class="is-visible" style="box-shadow: inset 0 0 20px 3px #e97d68;">
                                <header class="cd-pricing-header">
                             	   <h3>2016-17例行賽</h3><br>
                                    <h2>Kawhi Leonard</h2>
                                    <div class="cd-price">
                                        <!--<span class="cd-currency">$</span>-->
                                        <span class="cd-value"><img src="images/Kawhi Leonard.jpg" /></span>
                                        <!--<span class="cd-duration">mo</span>-->
                                    </div>
                                </header> <!-- .cd-pricing-header -->
                                <div class="cd-pricing-body">
                                    <ul class="cd-pricing-features">
                                        <li style="font-size: x-large;"><em>得分王</em></li>
                                        <!--<li><em>1</em> User</li>-->
                                    </ul>
                                </div>
                            </li>
                        </ul> <!-- .cd-pricing-wrapper -->
                    </li>
                    <li class="cd-popular">
                        <ul class="cd-pricing-wrapper">
                            <li data-type="monthly" class="is-visible" style="box-shadow: inset 0 0 20px 3px #e97d68;">
                                <header class="cd-pricing-header">
                                	<h3>2016-17例行賽</h3><br>
                                    <h2>James Harden</h2>
                                    <div class="cd-price">
                                        <!--<span class="cd-currency">$</span>-->
                                        <span class="cd-value"><img src="images/James Harden.jpg" /></span>
                                        <!--<span class="cd-duration">mo</span>-->
                                    </div>
                                </header> <!-- .cd-pricing-header -->
                                <div class="cd-pricing-body">
                                    <ul class="cd-pricing-features">
                                        <li style="font-size: x-large;"><em>助攻王</em> </li>
                                        <!--<li><em>3</em> Users</li>
                                        <li><em>24/7</em> Support</li>-->
                                    </ul>
                                </div> <!-- .cd-pricing-body -->
                            </li>
                        </ul> <!-- .cd-pricing-wrapper -->
                    </li>
                    <li>
                        <ul class="cd-pricing-wrapper">
                            <li data-type="monthly" class="is-visible" style="box-shadow: inset 0 0 20px 3px #e97d68;">
                                <header class="cd-pricing-header">
                                	<h3>2016-17例行賽</h3><br>
                                    <h2> James Harden </h2>
                                    <div class="cd-price">
                                        <!--<span class="cd-currency">$</span>-->
                                        <span class="cd-value"><img src="images/James Harden.jpg" /></span>
                                        <!--<span class="cd-duration">mo</span>-->
                                    </div>
                                </header> <!-- .cd-pricing-header -->
                                <div class="cd-pricing-body">
                                    <ul class="cd-pricing-features">
                                        <li style="font-size: x-large;"><em>籃板王</em></li>
                                        <!--<li><em>5</em> Users</li>-->
                                    </ul>
                                </div> <!-- .cd-pricing-body -->
                            </li>

                        </ul> <!-- .cd-pricing-wrapper -->
                    </li>
                </ul> <!-- .cd-pricing-list -->
            </div> <!-- .cd-pricing-container -->
    		
    
                </div>

            </div>

            <!--表格(結束)-->

            <!--標尾(開始)-->
			<jsp:include page="/footer.jsp" />  
            <!--標尾(結束)-->

        </div>
    </div>
    <!--主文(結束)-->
    
    
	<jsp:include page="/footer_css.jsp" />
    <!--數據王("2-2")-->
	<script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/main.js"></script>
    
    <!-- 輪播廣告("2-2") -->
    <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/posterTvGrid.js"></script>
    <script type="text/javascript">
                var posterTvGrid = new posterTvGrid('posterTvGrid', { className: "posterTvGrid" }, [
                        { "img": "images\/1.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" },
                        { "img": "images\/2.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" },
                        { "img": "images\/3.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" },
                        { "img": "images\/4.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" },
                        { "img": "images\/5.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" },
                        { "img": "images\/6.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" },
                        { "img": "images\/7.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" },
                        { "img": "images\/8.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" },
                        { "img": "images\/9.jpg", "title": "Lorem ipsum dolor sit amet", "url": "<%=request.getContextPath() %>/index.jsp" }
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
	<!--臉書分享("2-2")-->
	<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.11';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
</body>
</html>