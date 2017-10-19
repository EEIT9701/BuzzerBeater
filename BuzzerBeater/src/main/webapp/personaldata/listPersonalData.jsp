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
      <th>�y���s��  </th>
      <th>���ɳ���  </th>
      <th>�y��  </th>
      <th>�`�� </th>
      <th>��`�X���ɶ�  </th>
      <th>�G���R�� </th>
      <th>�G���X���  </th>
      <th>�T���R��  </th>
      <th>�T���X���  </th>
      <th>�@�y�R��  </th>
      <th>�@�y�X���  </th>
      <th>�i���x�O  </th>
      <th>���u�x�O  </th>
      <th>�U��  </th> 
      <th>�ۺI  </th>
      <th>����  </th>
      <th>���~  </th> 
      <th>�O�_���o </th>  
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