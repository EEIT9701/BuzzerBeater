<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!DOCTYPE html>
        <html lang="zh" class="no-js">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
            <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" media="all" />

            <title>Season</title>
            <jsp:include page="/header_css.jsp" />
            <script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
            <style>
                .img {
                    position: relative;
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: contain;
                    width: 200px;
                    height: 200px;
                    background-color: #353535;
                    float: left;
                    padding: 0;
                    margin: 10px;
                    border-radius: 3px;
                }
            </style>
            <script>
                $(function () {
                    function format_float(num, pos) {
                        var size = Math.pow(10, pos);
                        return Math.round(num * size) / size;
                    }

                    function preview(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('.preview').attr('src', e.target.result);
                                var KB = format_float(e.total / 1024, 2);
                                $('.size').text("檔案大小：" + KB + " KB");
                            }
                            reader.readAsDataURL(input.files[0]);
                        }
                    }
                    $("body").on("change", ".upl", function () {
                        preview(this);
                    })
                })
            </script>
        </head>

        <body>
            <jsp:include page="/header.jsp" />

            <div class="container-fluid">
                <div class="jumbotron">
                    <!-- 網頁內容 -->
                      <table id="simpleTable" class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <td><label class="control-label" for="playerName">球員姓名</label></td>
                        <td><label class="control-label" for="id">身分證字號</label></td>
                        <td><label class="control-label" for="height">身高</label></td>
                        <td><label class="control-label" for="weights">體重</label></td>
                        <td><label class="control-label" for="birthday">生日</label></td>
                        <td><label class="control-label" for="nationality">國籍</label></td>
                        <td><label class="control-label" for="Nom22">照片</label></td>
                        <td><label class="control-label" >預覽</label></td>
                        <td><input type="button" value="新增" id="buttonAdd" class="btn btn-success"></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input id="playerName" name="playerName" placeholder="球員姓名" class="form-control input-md" required="" type="text"></td>
                        <td><input id="id" name="id" placeholder="身分證字號" class="form-control input-md" required="" type="text"></td>
                        <td><input id="height" name="height" placeholder="身高" class="form-control input-md" required="" type="text"></td>
                        <td><input id="weights" name="weights" placeholder="體重" class="form-control input-md" required="" type="text"></td>
                        <td><input id="birthday" name="birthday" placeholder="生日" class="form-control input-md" required="" type="text" ></td>
                        <td><input id="nationality" name="nationality" placeholder="國籍" class="form-control input-md" required="" type="text"></td>
                        <td>
                            <input type="file" class="upl" id="photo">
                        </td>
                        <td><img class="preview" style="max-width: 150px; max-height: 150px;"></td>
                        <td><a href="#" class="btn btn-danger">刪除</a></td>
                    </tr>
                </tbody>
            </table>



                    <!-- 網頁內容END -->
                    <jsp:include page="/footer.jsp" />
                </div>
            </div>
            <!-- End of container -->


            <jsp:include page="/footer_css.jsp" />
            <script>
        $(function () {
            $('#simpleTable').on('click','.btn-danger',function(){
                $(this).parents('tr').remove();
            })
            //$('#simpleTable').on('click', '.btn-danger', function () {
            //    $(this).parents('tr').remove();
            //})
            $('#buttonAdd').click(function () {
                var newRow = '<tr><td><input id="playerName" name="playerName" placeholder="球員姓名" class="form-control input-md" required="" type="text"></td><td><input id="id" name="id" placeholder="身分證字號" class="form-control input-md" required="" type="text"></td><td><input id="height" name="height" placeholder="身高" class="form-control input-md" required="" type="text"></td><td><input id="weights" name="weights" placeholder="體重" class="form-control input-md" required="" type="text"></td><td><input id="birthday" name="birthday" placeholder="生日" class="form-control input-md" required="" type="text" ></td><td><input id="nationality" name="nationality" placeholder="國籍" class="form-control input-md" required="" type="text"></td><td><input type="file" class="upl" id="photo"></td><td><img class="preview" style="max-width: 150px; max-height: 150px;"></td><td><a href="#" class="btn btn-danger">刪除</a></td></tr>'
                $('tbody').append(newRow)
            })
        })
    </script>
        </body>

        </html>