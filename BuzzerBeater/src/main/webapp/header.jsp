<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


     <!--標頭(開始)-->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="header_bg">
            <div class="container">
                <div class="header">
                    <!--logo(開始)-->
                    <div class="logo">
                        <h1>Buzzer-Beater</h1>
                    </div>
                    <!--logo(結束)-->
                    <!--登入登出"按鈕"(開始)-->
                    <div class="h_menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up<!--這行的href輸入超連結頁面--></a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login<!--這行的href輸入超連結頁面--></a></li>
                        </ul>
                    </div>
                    <!--登入登出"按鈕"(結束)-->
                    <!--新刪修"按鈕"(開始)-->
                    <div class="h_menu">
                        <nav>
                            <ul class="menu list-group">

                                <li class="dropdown">
                                    <a href="#" class="btn btn-success" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">測試<span class="caret"></span></a>
                                    <ul class="dropdown-menu dropdowncostume">
                                        <li><a href="#">新增<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="#">刪除<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="#">修改<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!--新刪修"按鈕"(結束)-->
                    <!--選單列表(開始)-->
                    <div class="h_menu">
                        <a id="touch-menu" class="mobile-menu" href="#">Menu</a>
                        <nav>
                            <ul class="menu list-unstyled">
                                <li class="activate">
                                    <a href="">HOME<!--這行的href輸入超連結頁面--></a>
                                </li>
                                <li>
                                    <a href="">賽季<!--這行的href輸入超連結頁面--></a>
                                    <ul class="sub-menu list-unstyled">
                                        <li><a href="">賽季子頁1<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">賽季子頁2<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">賽季子頁3<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">分組<!--這行的href輸入超連結頁面--></a>
                                    <ul class="sub-menu list-unstyled">
                                        <li><a href="">分組子頁1<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">分組子頁2<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">分組子頁3<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">賽程<!--這行的href輸入超連結頁面--></a>
                                    <ul class="sub-menu list-unstyled">
                                        <li><a href="">賽程子頁1<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">賽程子頁2<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">賽程子頁3<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">球隊<!--這行的href輸入超連結頁面--></a>
                                    <ul class="sub-menu list-unstyled">
                                        <li><a href="">球隊子頁1<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">球隊子頁2<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">球隊子頁3<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">球員<!--這行的href輸入超連結頁面--></a>
                                    <ul class="sub-menu list-unstyled">
                                        <li><a href="">球員子頁1<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">球員子頁2<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">球員子頁3<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">數據<!--這行的href輸入超連結頁面--></a>
                                    <ul class="sub-menu list-unstyled">
                                        <li><a href="">數據子頁1<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">數據子頁2<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">數據子頁3<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">影片<!--這行的href輸入超連結頁面--></a>
                                    <ul class="sub-menu list-unstyled">
                                        <li><a href="">影片子頁1<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">影片子頁2<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">影片子頁3<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">照片<!--這行的href輸入超連結頁面--></a>
                                    <ul class="sub-menu list-unstyled">
                                        <li><a href="">照片子頁1<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">照片子頁2<!--這行的href輸入超連結頁面--></a></li>
                                        <li><a href="">照片子頁3<!--這行的href輸入超連結頁面--></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                        <!-- ***縮小視窗的置頂動態顯示設定_2-2***-->
                        <script src="<%=request.getContextPath() %>/js/menu.js" type="text/javascript"></script>
                    </div>
                    <!--選單列表(結束)-->
                </div>
            </div>
        </div>
    </nav>
    <!--標頭(結束)-->


    <!--至頂空白(開始)-->
    <div class="jumbotron">
        <div class="container">
            <h1></h1>
        </div>
    </div>
    <!--至頂空白(結束)-->
