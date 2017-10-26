<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <title>EEIT97-第一組</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <jsp:include page="/header_css.jsp" />
            <!--滑鼠移入，顯示表格(jquery設定"2-1")-->
            <link href="<%=request.getContextPath() %>/css/jquery-ui-1.12.1.css" rel="stylesheet">
            <style>
                #img1 {
                    width: 300px;
                    height: 220px;
                    margin: auto;
                }
            </style>
            <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
        </head>

        <body>

            <jsp:include page="/header.jsp" />
            <!--主文(開始)-->
            <div class="container">
                <div class="jumbotron">
                    <!-- 第二列(開始) -->
                    <!--****************-->
                    <div class="row">
                        <!--第二列-左邊表格-格式_.col-md-4-->
                        <div class="col-md-4">
                            <div class="col-md-12">
                                <img id="img1" src="data:image/png;base64,${teamsVO.teamBadge}">
                                <!--球員照片-->
                            </div>
                        </div>
                        <!--第二列-中間表格-格式_ .col-md-4-->
                        <div class="col-md-4">

                            <div class="col-md-12">
                                <h2>${teamsVO.teamName}</h2>
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>教練 | ${teamsVO.coachName}</td>
                                        </tr>
                                        <tr>
                                            <td>老闆 | ${teamsVO.bossName}</td>
                                        </tr>
                                        <tr>
                                            <td>球場 | 甲骨文體育館</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        <!--第二列-右邊表格-格式_.col-md-4-->
                        <div class="col-md-4">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-4">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <td>
                                                <h2>${teamsVO.totalWin}<span>勝</span></h2>

                                            </td>
                                            <td>
                                                <h2>-</h2>
                                            </td>
                                            <td>
                                                <h2>${teamsVO.totalLose}<span>負</span></h2>

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                            <div class="col-md-4">
                            </div>

                            <div class="col-md-12">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>平均</br>得分</th>
                                            <th>平均</br>籃板</th>
                                            <th>平均</br>助攻</th>
                                            <th>平均</br>失分</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>排名</td>
                                            <td>6th</td>
                                            <td>6th</td>
                                            <td>6th</td>
                                            <td>6th</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--****************-->
                    <!-- 第二列(結束) -->
                    <!--****************-->
                    <div class="row">
                        <!--第二列-左邊表格-格式_.col-md-4-->

                        <div class="col-md-12">
                            <!--滑鼠移入，顯示表格(開始)-->
                            <div id="tabs">
                                <ul>
                                    <li><a href="#tabs-1">球員名單</a></li>
                                    <li><a href="#tabs-2">過去賽事</a></li>
                                    <li><a href="#tabs-3">未來賽事</a></li>
                                </ul>
                                <div id="tabs-1">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>背號</th>
                                                <th>照片</th>
                                                <th>姓名</th>
                                                <th>位置</th>
                                                <th>身高</th>
                                                <th>體重</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="tabs-2">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>比賽時間</th>
                                                <th>比賽地點</th>
                                                <th>對戰隊伍</th>
                                                <th>比分</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <div id="tabs-3">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>比賽時間</th>
                                                <th>比賽地點</th>
                                                <th>對戰隊伍</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--滑鼠移入，顯示表格(結束)-->




                            <jsp:include page="/footer.jsp" />

                        </div>
                    </div>
                </div>
            </div>
            <!--主文(結束)-->

            <jsp:include page="/footer_css.jsp" />
            <!--滑鼠移入，顯示表格(jquery設定"2-2")-->
            <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
            <script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
            <script>
                $(function () {
                    $("#tabs").tabs({
                        event: "mouseover"
                    });
                });
            </script>
        </body>

        </html>