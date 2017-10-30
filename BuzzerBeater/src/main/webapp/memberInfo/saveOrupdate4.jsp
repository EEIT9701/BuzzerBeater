<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="eeit.memberinfo.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 	MemberInfoService dao = new MemberInfoService();
// 	List<MemberInfoVO> list = dao.getAll();
// 	pageContext.setAttribute("list", list);
%>
<%-- <jsp:useBean id="memberInfoSvc" scope="page" class="eeit.memberinfo.model.MemberInfoService" /> --%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<title>EEIT97-第一組</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- ***縮小視窗的置頂動態Menu顯示設定_2-1*** -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<!-- ***套用新的模太框檔案*** -->
<script src="<%=request.getContextPath()%>/dist/jdialog.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/jdialog.min.css">	

<style>
#st1 {
	padding: 30px;
	background-color: #1E90FF;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
</head>
<body>

	<jsp:include page="/header.jsp" />
	<!--主文(開始)-->
	<div class="container">

		<br>
		<br>
		<!--****************-->
		<!-- 第二列(開始) -->
		<!--****************-->
		<div class="row">
			<!--第二列-左邊表格-格式_.col-md-4-->
			<div class="col-md-12">
				<div class="col-md-12">
					<table class="table table-bordered" id="example">
						<thead>
							<tr align='center' valign='middle'>
								<th>會員編號</th>
								<th>會員帳號</th>
								<th>會員名稱</th>
								<th>權限</th>
								<th>註冊時間</th>
							    <th>球隊ID</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tbody01">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	<jsp:include page="/footer.jsp" />
	</div>
   
	<!--主文(結束)-->
	<!-- 模太框 -->
<div class="jDialog" id="dialog-4">
		<div class="content">
		
<!-- 			<h3 id="MemberInfoVO_memberID">會員資料ID:</h3> -->
<!-- 			 <input id="MemberInfoVO_memberID"  placeholder="會員編號" type="text" required> -->
			     <input id="MemberInfoVO_acc" placeholder="會員帳號" type="text" value="" required>
			     <input id="MemberInfoVO_name"  placeholder="會員名稱" type="text" value="" required>
			     <input id="MemberInfoVO_auth"  placeholder="權限"  type="text" value="" required>
<!-- 			 <input id="MemberInfoVO_registerTime"  placeholder="註冊時間" type="text" required> -->
<!-- 			 <input id="MemberInfoVO_teamID"  placeholder="球隊ID" type="text" required> -->
			
			<div>
				<button class="button" data-dismiss="JDialog" id="jDialogButton">確定</button>
			</div>
		</div>
	</div>	
	
	
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
	<script>
	$(function(){
		//生成memberInfoServlet 取值, 回傳JSON格式物件,並且 指定位置生成資料
		loadProduct('GET_ALL_MEMBERINFO_JSON');

		function loadProduct(id){
		 $.getJSON('/BuzzerBeater/memberInfoServlet.do',{'action':id} ,function(data){
			 var docFrag = $(document.createDocumentFragment());
			 //var tb = $('#example>tbody').children('tr:eq(0)');
			 var tb = $('#tbody01');
			 tb.empty();
			 $.each(data, function (idx, MemberInfoVO) {
	               var cell1 = $('<td></td>').text(MemberInfoVO.memberID);
	               var cell2 = $('<td></td>').text(MemberInfoVO.acc);
	               var cell3 = $('<td></td>').text(MemberInfoVO.name);
	               var cell4 = $('<td></td>').text(MemberInfoVO.auth);
	               var cell5 = $('<td></td>').text(MemberInfoVO.registerTime);
	               var cell6 = $('<td></td>').text(MemberInfoVO.teamID);
	               var cell7 = $('<td><button type="button" class="btn btn-lg btn-primary" data-toggle="JDialog" data-target="dialog-4" >修改</button></td>');
	               var cell8 = $('<td><button type="button" class="btn btn-lg btn-warning" >刪除</button></td>');
	               var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]);
 	               docFrag.append(row);
 	               tb.append(docFrag);
	           })
     
	     	   $(".JDialog").jDialog({		
				     skinClassName : 'demo',
				     animationType : 'flip',
				     allowOverlay : false
		       }); 
	          	
			   //案修改鍵後,跳出視窗所顯示的訊息
	           $('.btn-primary').on('click', function(){          	    		         
 		       	 //可以取得acc
 		       	 var acc = $(this).parents('tr').find('td:nth-child(2)').text();
 		        //可以取得name
 		       	 var name = $(this).parents('tr').find('td:nth-child(3)').text();
 		       	 //可以取得auth
 		       	 var auth = $(this).parents('tr').find('td:nth-child(4)').text()
 		       	    	 
	        	 $("#MemberInfoVO_acc").val(acc);
	  			 $("#MemberInfoVO_name").val(name);
	  			 $("#MemberInfoVO_auth").val(auth);
          
	           });
			 	     
	           //跳出視窗的 "確定"鍵, 這邊設定回傳到servlet的參數
	           $('#jDialogButton').on('click', function(){ 
	        	   alert($("#MemberInfoVO_acc").val() + $("#MemberInfoVO_name").val() + $("#MemberInfoVO_auth").val());
// 	         	$.post('/BuzzerBeater/memberInfoServlet.do',{"MemberInfoVO_acc":"","MemberInfoVO_name":"","MemberInfoVO_auth":""},function(){ 		
// 	         	})	  

 		       });    
     
	           /***執行jQuery table 的DataTable套件, 然後套用中文參數***/
              $('#example').DataTable({
				columnDefs: [{ width: 200, targets: 6}],
				"lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
				"pagingType": "full_numbers",
				"language": {
					"lengthMenu":"每一頁顯示_MENU_ 筆資料",
					"zeroRecords":"查無資料",
					"info":"現在正在第_PAGE_ 頁，總共有_PAGES_ 頁",
					"infoEmpty":"無資料",
					"infoFiltered":"(總共搜尋了_MAX_ 筆資料)",
					"search":"搜尋：",
					"paginate":{
						"first":"第一頁",
						"previous":"上一頁",
						"next":"下一頁",
						"last":"最末頁"					
					}
			  }
			})
		 });
		} 

	})
	</script>
	
</body>
</html>
