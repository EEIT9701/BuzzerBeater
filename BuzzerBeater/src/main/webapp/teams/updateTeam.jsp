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
                                    <legend>球隊修改</legend>

                                    <c:forEach var="teamsVO" items="${teamsVO}">


                                        <input type="hidden" name="teamName" value="${teamsVO.teamName}">

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">隊徽:</label>
                                            <input type="file" id="file">
                                            <div class="col-md-4">
                                                <img id="result" src="data:image/jpeg;base64,${teamsVO.teamBadge}"><br>
                                                <input type="hidden" id="photo" name="teamBadge" value="data:image/jpeg;base64,${teamsVO.teamBadge}">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">球隊名稱:</label>
                                            <div class="col-md-4">
                                                <input type="text" name="teamName" class="form-control" id="exampleInputEmail1" value ="${teamsVO.teamName}" >
                                            </div>
                                        </div>
                                         <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">隊長Email:</label>
                                            <div class="col-md-4">
                                                <input type="text" name="captainEmail" class="form-control" id="exampleInputEmail1" value="${teamsVO.captainEmail}">
                                            </div>
                                        </div>
                                         <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">隊長連絡電話:</label>
                                            <div class="col-md-4">
                                                <input type="text" name="captainPhone" class="form-control" id="exampleInputEmail1" value="${teamsVO.captainPhone}">
                                            </div>
                                        </div>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">總教練:</label>
                                            <div class="col-md-4">
                                                <input type="text" name="coachName" class="form-control" id="exampleInputEmail1" value="${teamsVO.coachName}">
                                            </div>
                                        </div>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">老闆:</label>
                                            <div class="col-md-4">
                                                <input type="text" name="bossName" class="form-control" id="exampleInputEmail1" value="${teamsVO.bossName}">
                                            </div>
                                        </div>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">備註:</label>
                                            <div class="col-md-4">
                                                <input type="text" name="remarks" class="form-control" id="exampleInputEmail1" value="${teamsVO.remarks}">
                                            </div>
                                        </div>
                                        



                                    </c:forEach>
                                    <!-- Button -->
                                    <input type="submit" class="btn btn-warning" value="送出">
                                    <input type="hidden" name="action" value="update">
                            </Form>

                            <form action="<%=request.getContextPath() %>/Teams.do">
                                <c:forEach var="teamsVO" items="${teamsVO}">
                                    <button type="submit" class="btn btn-danger">取消</button>
                                    <input type="hidden" name="action" value="goTolistAllPlayer_back">
                                    <!--                             <input type="hidden" name="action" value="getOne_For_Display"> -->
                                    <%--                             <input type="hidden" name="playerName" value="${playersIfo.playerName}"> --%>
                                </c:forEach>

                            </form>
                           



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