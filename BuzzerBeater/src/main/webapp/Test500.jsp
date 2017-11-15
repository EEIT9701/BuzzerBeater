
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/footer_css.jsp" />
<OL>
<%
   for ( int i=10; i > -10; i-- ) {
%>
  <LI>100 / <%= i %> = <%= 100/i %></LI>
<%
   }
%>
</.conOL>

</body>
</html>