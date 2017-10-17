<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page import="com.personaldata.model.*"%>   
<%@ page import="java.util.*"%>
<% 
    PersonalDataService service=new PersonalDataService();
    List<PersonalDataVO> list=service.getAll();
    pageContext.setAttribute("list", list);

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
   <table>
    <tr>
      <th>球員編號  </th>
      <th>比賽場次  </th>
      <th>球隊  </th>
      <th>節數 </th>
      <th>單節出場時間  </th>
      <th>二分命中 </th>
      <th>二分出手數  </th>
      <th>三分命中  </th>
      <th>三分出手數  </th>
      <th>罰球命中  </th>
      <th>罰球出手數  </th>
      <th>進攻籃板  </th>
      <th>防守籃板  </th>
      <th>助攻  </th> 
      <th>抄截  </th>
      <th>阻攻  </th>
      <th>失誤  </th> 
      <th>是否先發 </th>  
    </tr>
    
    <c:forEach var="personalDataVO" items="${list}">
      <tr>
      <td>${personalDataVO.playerID}</td>
      <td>${personalDataVO.gameID}</td>
      <td>${personalDataVO.teamID}</td>
      <td>${personalDataVO.quarters}</td>
      <td>${personalDataVO.playerID}</td>
      <td>${personalDataVO.playerID}</td>
      <td>${personalDataVO.playerID}</td>
      <td>${personalDataVO.playerID}</td>
    </tr>
    
    </c:forEach>
   
   
   
   
   
   </table>



</body>
</html>