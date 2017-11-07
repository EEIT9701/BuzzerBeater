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
<input type="text" name="action" value="Get_personalData">
<input type="text" name="seasonID" value="1">
<input type="text" name="groupID" value="1">
<input type="submit" value="ok">
</form>

<a href="<%=request.getContextPath()%>/PersonalData.do?action=Get_singlefieldData&gameID=4001"> xXXXXX</a>
</body>
</html>