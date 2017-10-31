<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/PersonalData.do" method="post">
<input type="text" name="action" value="Get_singleData">
<input type="text" name="playerID" value="70004">
<input type="submit" value="ok">
</form>

<a href="<%=request.getContextPath()%>/PersonalData.do?action=Get_singleData&playerID=70004"> xXXXXX</a>
</body>
</html>