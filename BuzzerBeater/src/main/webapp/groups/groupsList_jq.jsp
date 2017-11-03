<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
        <table id="groupsList" border="1">
            <thead>
                <tr>
                    <td>賽季名稱</td>
                    <td>分組名稱</td>
                    <td>隊伍數量上限</td>
                    <td>隊伍數量下限</td>
                    <td>目前隊伍數量</td>
                    <td>球隊成員上限</td>
                    <td>球隊成員下限</td>
                </tr>
            </thead>
            <tbody>
                <!-- Groups List -->
            </tbody>
        </table>
    </body>
    <script src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            loadGroups();

            function loadGroups() {
                $('#groupsList tbody tr').remove();

                $.getJSON('<%=request.getContextPath() %>/Groups.do', {
                        'action': 'GET_ALL_GROUPS'
                    },
                    function(datas) {
                        var frag = $(document.createDocumentFragment());
                        $.each(datas, function(idx, groups) {
                            var cell0 = $('<td></td>').text(groups.season_Name);
                            var cell1 = $('<td></td>').text(groups.group_Name);
                            var cell2 = $('<td></td>').text(groups.max_Teams);
                            var cell3 = $('<td></td>').text(groups.min_Teams);
                            var cell4 = $('<td></td>').text(groups.current_Teams);
                            var cell5 = $('<td></td>').text(groups.max_Players);
                            var cell6 = $('<td></td>').text(groups.min_Players);
                            var cell7 = $('<td></td>').html('<FORM name="updateSeason" method="post" action="<%=request.getContextPath() %>/Season.do"><input type="submit" value="修改"><input type="hidden" name="season_ID" value="' + groups.group_ID + '"><input type="hidden" name="action" value="GET_ONE_FOR_UPDATE"></FORM>');
                            var cell8 = $('<td></td>').html('<FORM name="updateSeason" method="post" action="<%=request.getContextPath() %>/Season.do"><input type="submit" value="刪除"><input type="hidden" name="season_ID" value="' + groups.group_ID + '"><input type="hidden" name="action" value="DELETE_SEASON"></FORM>');
                            var row = $('<tr></tr>');
                            row.append([cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]);
                            frag.append(row);
                        })

                        $('#groupsList>tbody').append(frag);
                    })
            }


        });
    </script>

    </html>