<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>修改賽季</title>
                </head>

                <body>
                    <h1>修改賽季</h1>
                    <c:if test="${not empty errorMsgs}">
                        請修正以下錯誤:
                        <ul>
                            <c:forEach var="message" items="${errorMsgs}">
                                <li>${message}</li>
                            </c:forEach>
                        </ul>
                    </c:if>

                    <form name="updateSeason" method="post" action="season.do">
                        <input type="hidden" name="action" value="UPDATE_SEASON">
                        <input type="hidden" name="season_ID" id="season_ID" value="${sVO.season_ID}">
                        <table>
                            <tr>
                                <td>賽季名稱</td>
                                <td><input type="text" name="season_Name" id="season_Name" value="${sVO.season_Name}"></td>
                            </tr>
                            <tr>
                                <td>賽季開始日期</td>
                                <td><input type="date" name="season_BeginDate" id="season_BeginDate" value="${sVO.season_BeginDate}"></td>
                            </tr>
                            <tr>
                                <td>賽季結束日期</td>
                                <td><input type="date" name="season_EndDate" id="season_EndDate" value="${sVO.season_EndDate}"></td>
                            </tr>
                            <tr>
                                <td>報名開始時間</td>
                                <td><input type="datetime" name="signUp_BeginDate" id="signUp_BeginDate" value="${sVO.signUp_BeginDate}"></td>
                            </tr>
                            <tr>
                                <td>報名結束時間</td>
                                <td><input type="datetime" name="signUp_EndDate" id="signUp_EndDate" value="${sVO.signUp_EndDate}"></td>
                            </tr>
                            <tr>
                                <td>備註</td>
                                <td><textarea name="descriptions" id="descriptions">${sVO.descriptions}</textarea></td>
                            </tr>
                        </table>
                        <input type="submit" value="送出"> <input type="reset" value="重置">
                    </form>

                    <table id="groupsList" border="1">
                        <thead>
                            <tr>
                                <td>分組名稱</td>
                                <td>目前隊伍數量</td>
                                <td>隊伍數量上限</td>
                                <td>隊伍數量下限</td>
                                <td>球隊成員上限</td>
                                <td>球隊成員下限</td>
                            </tr>
                        </thead>

                        <tbody>
                            <!-- <c:forEach var="gVO" items="${gSet}">
                                <tr>
                                    <td><input type="text" name="group_Name" value="${gVO.group_Name}"></td>
                                    <td><input type="text" name="max_Teams" value="${gVO.max_Teams}"></td>
                                    <td><input type="text" name="min_Teams" value="${gVO.min_Teams}"></td>
                                    <td>${gVO.current_Teams}</td>
                                    <td><input type="text" name="max_Players" value="${gVO.max_Players}"></td>
                                    <td><input type="text" name="min_Players" value="${gVO.min_Players}"></td>
                                </tr>
                            </c:forEach> -->
                        </tbody>

                        <form name="addGroups">
                            <input type="hidden" name="action" value="ADD_GROUP">
                            <input type="hidden" name="season_ID" value="${sVO.season_ID}">
                            <tfoot>
                                <tr>
                                    <td><input type="text" name="group_Name"></td>
                                    <td></td>
                                    <td><input type="number" name="max_Teams" min="0"></td>
                                    <td><input type="number" name="min_Teams" min="0"></td>
                                    <td><input type="number" name="max_Players" min="0" value="15"></td>
                                    <td><input type="number" name="min_Players" min="0" value="7"></td>
                                    <td><button type="button" id="btnAddGroups">新增</button></td>
                                    <td><button type="button" id="btnCancelAddGroups">取消</button></td>
                                </tr>
                            </tfoot>
                        </form>
                    </table>

                    <ul id="addGroupError">
                    </ul>

                    <script src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
                    <script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
                    <script>
                        $(document).ready(function() {

                            loadGroupsBySeasonID();

                            function loadGroupsBySeasonID() {
                                $('#groupsList tbody tr').remove();

                                var season_ID = $('#season_ID').val();
                                $.getJSON('<%=request.getContextPath() %>/Groups.do', {
                                    'action': 'GET_GROUPS_BY_SEASON_ID',
                                    'season_ID': season_ID
                                }, function(datas) {
                                    var frag = $(document.createDocumentFragment());
                                    $.each(datas, function(idx, groups) {
                                        var cell1 = $('<td></td>').text(groups.group_Name);
                                        var cell2 = $('<td></td>').text(groups.current_Teams);
                                        var cell3 = $('<td></td>').text(groups.max_Teams);
                                        var cell4 = $('<td></td>').text(groups.min_Teams);
                                        var cell5 = $('<td></td>').text(groups.max_Players);
                                        var cell6 = $('<td></td>').text(groups.min_Players);
                                        var cell7 = $('<td></td>').html('<FORM name="updateSeason" method="post" action="<%=request.getContextPath() %>/Season.do"><input type="submit" value="修改"><input type="hidden" name="season_ID" value="' + groups.group_ID + '"><input type="hidden" name="action" value="GET_ONE_FOR_UPDATE"></FORM>');
                                        var cell8 = $('<td></td>').html('<FORM name="updateSeason" method="post" action="<%=request.getContextPath() %>/Season.do"><input type="submit" value="刪除"><input type="hidden" name="season_ID" value="' + groups.group_ID + '"><input type="hidden" name="action" value="DELETE_SEASON"></FORM>');
                                        var row = $('<tr></tr>');
                                        row.append([cell1, cell2, cell3, cell4, cell5, cell6]);
                                        frag.append(row);
                                    })

                                    $('#groupsList>tbody').append(frag);
                                })
                            }

                            $('#btnAddGroups').click(function() {
                                var serdata = $('form[name="addGroups"]').serialize();

                                $.post('Groups.do', serdata, function(data) {
                                    if (data == null) {
                                        resetAddGroup();

                                        setTimeout(function() {
                                            loadGroupsBySeasonID();
                                        }, 2000)
                                    } else {
                                        $('#addGroupError li').remove();
                                        var cell = $('<li></li>').text(data);
                                        $('#addGroupError').append(cell);
                                        console.log(data);


                                    }
                                })
                            })

                            $('#btnCancelAddGroups').click(function() {
                                resetAddGroup();
                            })

                            function resetAddGroup() {
                                $('#groupsList>tfoot input').val('');
                                $('#groupsList>tfoot input[name="max_Players"]').val('15');
                                $('#groupsList>tfoot input[name="min_Players"]').val('7');
                            }


                        })
                    </script>

                </body>

                </html>