<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ page import="java.util.*"%>
            <%@ page import="eeit.teams.model.*"%>
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Insert title here</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                    <!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
                    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/iEdit.css">
                    <script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
                    <script src="<%=request.getContextPath() %>/js/iEdit.js"></script>
                    <jsp:include page="/header_css.jsp" />

                    <style>
                        #result {
                            width: 300px;
                            height: 220px;
                            margin: auto;
                        }
                    </style>
                </head>

                <body>

                    <jsp:include page="/header.jsp" />


                    <!--主文(開始)-->

                    <div class="container">
                        <div class="jumbotron">
                            <c:if test="${not empty errorMsgs}">
                                <font color='red'>請修正以下錯誤:
                                    <ul>
                                        <c:forEach var="message" items="${errorMsgs}">
                                            <li>${message}</li>
                                        </c:forEach>
                                    </ul>
                                </font>
                            </c:if>
                            <Form class="form-horizontal" method="post" action="<%=request.getContextPath() %>/Teams.do">
                                <fieldset>
                                    <!-- Form Name -->
                                    <legend>球隊新增</legend>

                                    <input type="hidden" name="teamID" value="${teamID}">


                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">隊徽:</label>
                                        <input type="file" id="file">
                                        <div class="col-md-4">
                                            <img id="result" src="data:image/jpeg;base64,${teamBadge}"><br>
                                            <input type="hidden" id="photo" name="teamBadge" value="${teamBadge}">
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">球隊名稱:</label>
                                        <div class="col-md-4">
                                            <input type="text" name="teamName" class="form-control" id="exampleInputEmail1" value="${teamName}">
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">隊長Email:</label>
                                        <div class="col-md-4">
                                            <input type="text" name="captainEmail" class="form-control" id="exampleInputEmail1" value="${captainEmail}">
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">隊長連絡電話:</label>
                                        <div class="col-md-4">
                                            <input type="text" name="captainPhone" class="form-control" id="exampleInputEmail1" value="${captainPhone}">
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">總教練:</label>
                                        <div class="col-md-4">
                                            <input type="text" name="coachName" class="form-control" id="exampleInputEmail1" value="${coachName}">
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">老闆:</label>
                                        <div class="col-md-4">
                                            <input type="text" name="bossName" class="form-control" id="exampleInputEmail1" value="${bossName}">
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">勝場數:</label>
                                        <div class="col-md-4">
                                            <input type="text" name=totalWin class="form-control" id="exampleInputEmail1" value="${totalWin}">
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">敗場數:</label>
                                        <div class="col-md-4">
                                            <input type="text" name="totalLose" class="form-control" id="exampleInputEmail1" value="${totalLose}">
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">勝率:</label>
                                        <div class="col-md-4">
                                            <input type="text" name="winRate" class="form-control" id="exampleInputEmail1" value="${winRate}">
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">備註:</label>
                                        <div class="col-md-4">
                                            <input type="text" name="remarks" class="form-control" id="exampleInputEmail1" value="${remarks}">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-4">
                                            <!-- Button -->
                                            <div class="col-md-4">
                                                <input type="submit" class="btn btn-warning" value="送出">
                                                <input type="hidden" name="action" value="insert">
                                            </div>
                            </Form>
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <form action="<%=request.getContextPath() %>/Teams.do">
                                    <button type="submit" class="btn btn-danger">取消</button>
                                    <input type="hidden" name="action" value="goTolistAllTeam_back">
                                </form>
                            </div>
                            </div>
                            <div class="col-md-4"></div>
                            </div>

                            <jsp:include page="/footer.jsp" />
                            </fieldset>

                        </div>
                    </div>
                    <!--主文(結束)-->

                    <jsp:include page="/footer_css.jsp" />
                    <script>
                        $("#file").change(function (e) {

                            var img = e.target.files[0];

                            if (!img.type.match('image.*')) {
                                alert("Whoops! That is not an image.");
                                return;
                            }
                            iEdit.open(img, true, function (res) {
                                $("#result").attr("src", res);
                                $("#photo").attr("value", res);
                            });

                        });
                    </script>
                </body>

                </html>