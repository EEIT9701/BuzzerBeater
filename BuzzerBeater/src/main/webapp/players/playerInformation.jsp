<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <%@ page import="java.util.*"%>
            <%@ page import="eeit.players.model.*"%>
                <%
    Integer playerID = new Integer(request.getParameter("playerID"));
    PlayerService PlayerSvc = new PlayerService();
    PlayersVO playerVO = PlayerSvc.getOnePlayerID(playerID);
	pageContext.setAttribute("playerVO", playerVO);
    %>

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
                                width: 200px;
                                height: 300px;
                                margin: 50px 50px 50px 50px;
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
                                            <img id="img1" src="data:image/jpeg;base64,${playerVO.photo}">
                                            <!--球員照片-->
                                        </div>
                                    </div>
                                    <!--第二列-中間表格-格式_ .col-md-4-->
                                    <div class="col-md-4">

                                        <div class="col-md-12">
                                            <h2>${playerVO.playerName}</h2>
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>球隊 |
                                                            <c:forEach var="team" items="${playerVO.teamCompositionSet}">${team.teamsVO.teamName}</c:forEach>
                                                        </td>
                                                        <td>生日 | ${playerVO.birthday}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>背號 | #30</td>
                                                        <td>國籍 | ${playerVO.nationality}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>身高 | ${playerVO.height}公分</td>
                                                        <td>體重 | ${playerVO.weights}公斤</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>平均得分</th>
                                                        <th>平均籃板</th>
                                                        <th>平均助攻</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>29.0</td>
                                                        <td>4.7</td>
                                                        <td>5.0</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!--第二列-右邊表格-格式_.col-md-4-->
                                    <div class="col-md-4">

                                        <div class="col-md-12">
                                            <img id="img1" alt="" src="<%=request.getContextPath() %>\players\500px-Golden.png">
                                            <!--球員照片-->
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
                                                <li><a href="#tabs-1">本季數據</a></li>
                                                <li><a href="#tabs-2">進五場數據</a></li>
                                            </ul>
                                            <div id="tabs-1">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>比賽場次 </th>
                                                            <th>出場時間 </th>
                                                            <th>二分命中 </th>
                                                            <th>二分出手數 </th>
                                                            <th>三分命中 </th>
                                                            <th>三分出手數 </th>
                                                            <th>罰球命中 </th>
                                                            <th>罰球出手數 </th>
                                                            <th>進攻籃板 </th>
                                                            <th>防守籃板 </th>
                                                            <th>助攻 </th>
                                                            <th>抄截 </th>
                                                            <th>阻攻 </th>
                                                            <th>失誤 </th>
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
                                                            <td></td>
                                                            <td></td>
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
                                                            <th>出場時間 </th>
                                                            <th>二分命中 </th>
                                                            <th>二分出手數 </th>
                                                            <th>三分命中 </th>
                                                            <th>三分出手數 </th>
                                                            <th>罰球命中 </th>
                                                            <th>罰球出手數 </th>
                                                            <th>進攻籃板 </th>
                                                            <th>防守籃板 </th>
                                                            <th>助攻 </th>
                                                            <th>抄截 </th>
                                                            <th>阻攻 </th>
                                                            <th>失誤 </th>
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
                                                            <td></td>
                                                            <td></td>
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

                                        </div>
                                        <!--滑鼠移入，顯示表格(結束)-->




                                    </div>
                                </div>
                                <jsp:include page="/footer.jsp" />

                            </div>
                        </div>
                        <!--主文(結束)-->

                        <jsp:include page="/footer_css.jsp" />
                        <!--滑鼠移入，顯示表格(jquery設定"2-2")-->
                        <script src="<%=request.getContextPath()%>/js/jquery-table-1.12.4.js"></script>
                        <script src="<%=request.getContextPath()%>/js/jquery-ui-table.js"></script>
                        <script>
                            $(function () {
                                $("#tabs").tabs({
                                    event: "mouseover"
                                });
                            });
                        </script>
                    </body>

                    </html>