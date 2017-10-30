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
</head>
<body>

	


	
	<Form method="post" action="<%=request.getContextPath()%>/Players.do"
			enctype="multipart/form-data">
			<input type="hidden" name="action" value="Upload"> 
			
			<table border="0">
				<tr>
					<td>照片:</td>
					<td><Input Type="file" size="40" style="width: 480px;"
						name="photo"></td>
				</tr>
				
			</table>
			<input type="submit" value="上傳">
		</Form>
		


</body>
</html>