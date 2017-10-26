<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ page import="java.util.*"%>
            <%@ page import="eeit.players.model.*"%>
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

                            <Form method="post" action="<%=request.getContextPath() %>/Players.do">
                                <c:forEach var="playersIfo" items="${playersIfo}">


                                    <input type="hidden" name="playerID" value="${playersIfo.playerID}">

                                    <div class="form-group">
                                        <label for="exampleInputFile">球員照片:</label>
                                        <input type="file" id="file" >
                                        <br>
                                        <img id="result" src="data:image/jpeg;base64,${playersIfo.photo}"><br>
                                        <input type ="hidden" id="photo" name = "photo" value ="data:image/jpeg;base64,${playersIfo.photo}">
                                        
                                        <br>
                                        <label for="exampleInputEmail1">球員姓名:</label>
                                        <input type="text" name="playerName" class="form-control" id="exampleInputEmail1" value="${playersIfo.playerName}">
                                        <label for="exampleInputEmail1">身分證ID:</label>
                                        <input type="text" name="id" class="form-control" id="exampleInputEmail1" value="${playersIfo.id}">
                                        <label for="exampleInputEmail1">身高(cm):</label>
                                        <input type="text" name="height" class="form-control" id="exampleInputEmail1" value="${playersIfo.height}">
                                        <label for="exampleInputEmail1">體重(kg):</label>
                                        <input type="text" name="weights" class="form-control" id="exampleInputEmail1" value="${playersIfo.weights}">
                                        <label for="exampleInputEmail1">生日:</label>
                                        <input type="text" name="birthday" class="form-control" id="exampleInputEmail1" value="${playersIfo.birthday}">
                                        <label for="exampleInputEmail1">國籍:</label>
                                        <input type="text" name="nationality" class="form-control" id="exampleInputEmail1" value="${playersIfo.nationality}">
                                    </div>
                                </c:forEach>
                                <nobr>
                                    <input type="submit" class="btn btn-warning" value="送出">
                                    <input type="hidden" name="action" value="update">

                            </Form>
                            
                            <form action="<%=request.getContextPath() %>/Players.do">
                             <c:forEach var="playersIfo" items="${playersIfo}">
                            <button type="submit" class="btn btn-danger"><a href="<%=request.getContextPath() %>/players/listAllPlayer_back.jsp">取消</a></button>
<!--                             <input type="hidden" name="action" value="getOne_For_Display"> -->
<%--                             <input type="hidden" name="playerName" value="${playersIfo.playerName}"> --%>
                            </c:forEach>
                            </form>
                            </nobr>


                            <jsp:include page="/footer.jsp" />

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