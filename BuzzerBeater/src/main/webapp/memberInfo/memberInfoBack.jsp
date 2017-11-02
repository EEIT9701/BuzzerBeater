<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="eeit.memberinfo.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/jdialog.min.css">	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datatables.min.css" />
<jsp:include page="/header_css.jsp" />
<jsp:include page="/font_css.jsp" />
	<style>
	 #st1 {
		padding: 30px;
		background-color: #1E90FF}
     thead{
	      background-color: #d62d67;
    	  color: #e9e9e9;
        }
     #pathWay {
      	  color: #666;
      	  height: 28px;
      	  line-height: 28px;
      	  border-bottom: 1px solid #c0b7b7;
      	  text-indent: 5px;
      	  font-size: 18px;
      	  font-weight: normal;
      	  margin-bottom: 10px;
      	  font-family:微軟正黑體;
        }
        
	</style>
</head>
<body>

	<jsp:include page="/header.jsp" />
	<!--主文(開始)-->
	<div class="container">
	<div class="jumbotron">
		
		<!--上層導覽列(開始) -->
		<div id="pathWay">
        	<span>
            	<a href="<%=request.getContextPath() %>/index.jsp">
            		<span>使用者功能</span>
            	</a>
        	</span>&gt;
        	<span><span>權限管理</span></span>
    	</div>
    	<!--上層導覽列(結束) -->
		<div><button type="button"  data-toggle="JDialog" data-target="dialog-4" class="btn btn-primary">新增</button></div>
		<br>
		<br>
		<!--****************-->
		<!-- 第二列(開始) -->
		<!--****************-->
		<div class="row">
			<div class="col-md-12">
					<table class="table table-bordered" id="example">
						<thead>
							<tr align='center' valign='middle'>
								<th style="width:350px">會員編號</th>
								<th >會員帳號</th>
								<th style="width:720px">會員名稱</th>
								<th >權限</th>
								<th style="width:720px">註冊時間</th>
							    <th style="width:120px">球隊ID</th>
								<th style="width:10%"></th>
								<th ></th>
							</tr>
						</thead>
						<tbody id="tbody01">
						
						</tbody>
					</table>
			</div>
		</div>
	<jsp:include page="/footer.jsp" />
	</div>
   <jsp:include page="/footer_css.jsp" />
	<!--主文(結束)-->
	
	<!-- 模太框 -->
	<div class="jDialog" id="dialog-4">
		<div class="content">
		 <H3>新增帳號</H3>
			     <input id="MemberInfoVO_acc" placeholder="會員帳號" type="text" value="" required>
			     <input id="MemberInfoVO_name"  placeholder="會員名稱" type="text" value="" required>
			     <input id="MemberInfoVO_auth"  placeholder="權限"  type="text" value="" required>
			 <div>
				<button class="button" data-dismiss="JDialog" id="jDialogButton">確定</button>
			</div>
		</div>
	</div>
	</div>
	
	
	
    <script src="<%=request.getContextPath()%>/dist/jdialog.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables.min.js"></script>	
	<script>
	$(function(){	
		//生成memberInfoServlet 取值, 回傳JSON格式物件,並且 指定位置生成資料
		loadProduct('GET_ALL_MEMBERINFO_JSON');
		
		//模太框相關按鈕
		$(".JDialog").jDialog({		
		     skinClassName : 'demo',
		     animationType : 'flip',
		     allowOverlay : false
       });
	    
		$('#button_insert').on('click', function(){ 
// 				alert($('#MemberInfoVO_acc').val());
// 				alert($('#MemberInfoVO_name').val());
// 				alert($('#MemberInfoVO_auth').val());

	    });
		
		$('#jDialogButton').on('click', function(){
			//抓input 的值
			var acc =  $('#MemberInfoVO_acc').val();
			var name = $('#MemberInfoVO_name').val();
			var auth = $('#MemberInfoVO_auth').val();
			if(acc!= '' & name!= '' & auth != '' ){
				//取得目前時間
				registerTimeToMs = Date.now() + 28800000; //台北時間+8小時
				//alert(registerTimeToMs);
				registerTime = new Date(registerTimeToMs);
				
				//把input 清空
				$('#MemberInfoVO_acc').val('');
				$('#MemberInfoVO_name').val('');
				$('#MemberInfoVO_auth').val('');
				
				var dataStr = JSON.stringify({ acc:acc, name:name, auth:auth, registerTime:registerTime })
				$.post('/BuzzerBeater/memberInfoServlet.do', {'action':'INSERT', 'data':dataStr}, function(datas){
					//只是把新增資料傳回後台 不需回傳東西, 或做輸入與法判斷
					alert("新增成功");
					location.reload();
		       	}) 
		    }else {
		    	alert("新增失敗");
		    }
			
		});
		
		function loadProduct(id){
		 $.getJSON('/BuzzerBeater/memberInfoServlet.do',{'action':id} ,function(data){	 
			 var docFrag = $(document.createDocumentFragment());
			 var tb = $('#tbody01');	 
			 tb.empty();
			 $.each(data, function (idx, MemberInfoVO) {
	               var cell1 = $('<td></td>').text(MemberInfoVO.memberID);
	               var cell2 = $('<td></td>').text(MemberInfoVO.acc);
	               var cell3 = $('<td></td>').text(MemberInfoVO.name);
	               var cell4 = $('<td></td>').text(MemberInfoVO.auth);		   	 
 	               maxDate = new Date(MemberInfoVO.registerTime);          //ms to data
 	               var cell5 = $('<td></td>').text(maxDate);
	               var cell6 = $('<td></td>').text(MemberInfoVO.teamID);
	               var cell7 = $('<td><button type="button" class="btn btn-warning updateData" >修改</button></td>');
	               var cell8 = $('<td><button type="button" class="btn btn-danger" >刪除</button></td>');
	               var row = $('<tr align="center" valign="middle"></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]);
 	               docFrag.append(row);
 	               tb.append(docFrag);         
	           }) 
				buttonFunction();
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
		
		function buttonFunction(){
		  //修改鍵	
		  $('.btn-primary').on('click', function(){          	    		            	
		   //按下修改鍵 
	       if($(this).text() == '修改'){	
	         //可以取得acc
		     var acc = $(this).parents('tr').find('td:nth-child(2)').text();
		     //可以取得name
		     var name = $(this).parents('tr').find('td:nth-child(3)').text();
		     //可以取得auth
		     var auth = $(this).parents('tr').find('td:nth-child(4)').text();
	       	
	       	 $(this).parents('tr').find('td:nth-child(2)').html('<input placeholder="帳號"  type="text" value="'+ acc +'" required>');
	       	 $(this).parents('tr').find('td:nth-child(3)').html('<input placeholder="名稱"  type="text" value="'+ name +'" required>');
	       	 $(this).parents('tr').find('td:nth-child(4)').html('<input placeholder="權限"  type="text" value="'+ auth +'" required>');
 	  		  
	       	  $(this).text('確定');	
	       	  
           } 
	       	else{ //按下確定鍵 
	       	  //把input, 顯示在table欄位上的值取出	
	       	  var memberID = $(this).parents('tr').find('td:nth-child(1)').text();
	       	  var acc = $(this).parents('tr').find('td:nth-child(2)>input').val();
	       	  var name = $(this).parents('tr').find('td:nth-child(3)>input').val();
 	       	  var auth = $(this).parents('tr').find('td:nth-child(4)>input').val();
 	       	  var registerTime = $(this).parents('tr').find('td:nth-child(5)').text();
 	     	  var teamID = $(this).parents('tr').find('td:nth-child(6)').text();
    
 	          //alert(registerTime);
 	          
 	          //把time轉成date(台北標準時間)
 	          var registerTimeToMs = new Date(registerTime);
 	          //把輸入的資料包裝成JSON格式字串, 給post傳送用
 	       	  var dataStr = JSON.stringify({ memberID:memberID, acc:acc, name:name, auth:auth, registerTime:registerTimeToMs, teamID:teamID})
              //將 顯示在table欄位改回tr,並把值填入 
 	       	  $(this).parents('tr').find('td:nth-child(1)').html(memberID);
 	       	  $(this).parents('tr').find('td:nth-child(2)').html(acc);
 			  $(this).parents('tr').find('td:nth-child(3)').html(name);
 			  $(this).parents('tr').find('td:nth-child(4)').html(auth);
 			  $(this).parents('tr').find('td:nth-child(5)').html(registerTime);
 			  $(this).parents('tr').find('td:nth-child(6)').html(teamID);
 	       	  
 			  //把輸入在欄位上的資料經過post傳送
 	       	  $.post('/BuzzerBeater/memberInfoServlet.do', {'action':'UPDATE', 'data':dataStr}, function(datas){
					//只是把修改資料傳回後台 不需回傳東西, 或做輸入與法判斷
 	       	  })   
	       	  $(this).text('修改');	       	  
	       	}
       });
          //刪除鍵
		  $('.btn-warning').on('click', function(){
			  alert("確定要刪除嗎?");
			  var memberID = $(this).parents('tr').find('td:nth-child(1)').text();
			  //alert(memberID);
			  //把輸入在欄位上的資料經過post傳送
 	       	  $.post('/BuzzerBeater/memberInfoServlet.do', {'action':'DELETE', 'MemberID':memberID}, function(datas){
					//刪除資料 不需回傳東西, 或做輸入與法判斷
 	       	  })
			  $(this).parents('tr').empty();
 	       	  //location.reload()
		  }) 
	  }
		 		
	})
	</script>
	
</body>
</html>
