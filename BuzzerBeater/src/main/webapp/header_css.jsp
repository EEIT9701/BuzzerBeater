<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon5.ico" type="image/x-icon">
	<link rel="icon" href="<%=request.getContextPath()%>/images/favicon5.ico" type="image/x-icon" /> 
<!--標頭樣式2-1-->
    <link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/fonts/FontAwesome/font-awesome.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <link href="<%=request.getContextPath() %>/css/animate.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/bootsnav.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/htmleaf-demo.css" rel="stylesheet" type="text/css" >
    <link href="<%=request.getContextPath() %>/css/overwrite.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/color.css" rel="stylesheet">
   
    <style>
        .pageheader.fixed-demo.dark {
            padding-top:30px
        }
/*         log-in */
        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
		.Login_button {
            background-color: #4CAF50 !important;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
                opacity: 0.5;
            }
        a:hover {
                opacity: 0.5;
            }            

        /* Extra styles for the cancel button */
        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        /* Center the image and position the close button */
        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
            position: relative;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }

        /* Modal Content/Box */
        .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto;
        border: 1px solid #888;

        }

        /* The Close Button (x) */
        .close {
            position: absolute;
            right: 25px;
            top: 0;
            color: #000;
            font-size: 35px;
            font-weight: bold;
        }
            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

        /* Add Zoom Animation */
        .animate {
            -webkit-animation: animatezoom 0.6s;
            animation: animatezoom 0.6s;
        }

        @-webkit-keyframes animatezoom {
            from {
                -webkit-transform: scale(0);
            }
            to {
                -webkit-transform: scale(1);
            }
        }

        @keyframes animatezoom {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
            .cancelbtn {
                width: 100%;
            }
        }
        .pageheader.fixed-demo.dark{
        padding-top:90px;
        }
        body {
        background-color:rgba(197, 197, 197, 0.78);
        }
        .jumbotron{
        background-color: rgb(243, 242, 241);
        }
        #footer{
        font-family:微軟正黑體;
        }
    </style>


