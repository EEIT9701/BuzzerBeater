<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Buzzer Beater</title>

    <script type="text/javascript">
	//關閉視窗
	function closeWin () {
	//呼叫window物件的close()函數,關閉視窗
		window.location.replace('<%=request.getContextPath() %>/index.jsp');
}
	//許多秒後不詢問自動關閉視窗
	//定義一個是否關閉的全域變數
	var willClose = true;
	//點擊網頁
	function clickBody () {
		//典籍網頁後,則把變數置為false
		willClose = false;
	}
	setInterval (function() {
		//判斷是否需要關閉
		if(willClose) {
			//關閉視窗
		    window.location.replace('<%=request.getContextPath() %>/index.jsp');
		} else {
			//如果點擊過,重新開始計算
			willClose = true;
		}
	},1000);
    </script>
    
    
</head>
<body style="text-align:center" onclick="clickBody()">

    <div style="text-align:center">
        <h2>系統將自動導向首頁</h2>
    </div>

    <span id="ad"></span>

    <!-- 點擊按鈕呼叫關閉視窗  -->
    <div style="text-align:center">
        <input type="button" value="點擊跳轉頁面" onclick="closeWin()" />
    </div>


</body>
</html>