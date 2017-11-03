<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<title>Insert title here</title>
</head>
<body>


<!-- <form id="formCreditCard" method="get" accept-charset="UTF-8" -->
<!--  action="https://payment-stage.allpay.com.tw/Cashier/AioCheckOut/V4"> -->
<!-- <input type="hidden" name="MerchantID" value="2000132" /> -->
<!-- <input type="hidden" name="MerchantTradeNo" value="DX20171102010622d4a3" /> -->
<!-- <input type="hidden" name="MerchantTradeDate" value="" /> -->
<!-- <input type="hidden" name="PaymentType" value="aio" /> -->
<!-- <input type="hidden" name="TotalAmount" value="1200" /> -->
<!-- <input type="hidden" name="TradeDesc" value="建立信用卡測試訂單" /> -->
<!-- <input type="hidden" name="ItemName" value="報名費用" /> -->
<!-- <input type="hidden" name="ReturnURL" value="" /> -->
<!-- <input type="hidden" name="ChoosePayment" value="Credit" /> -->
<!-- <input type="hidden" name="StoreID" value="" /> -->
<!-- <input type="hidden" name="ClientBackURL" value="" /> -->
<!-- <input type="hidden" name="CreditInstallment" value="" /> -->
<!-- <input type="hidden" name="InstallmentAmount" value="" /> -->
<!-- <input type="hidden" name="Redeem" value="" /> -->
<!-- <input type="hidden" name="EncryptType" value="1" /> -->
<!-- <input type="hidden" name="CheckMacValue" value="" /> -->
<!-- <input type="submit"  value="送出訂單" id="btn-warning"/> -->

<!-- </form> -->

<form id="formCreditCard" method="post" accept-charset="UTF-8"
 action="https://payment-stage.allpay.com.tw/Cashier/AioCheckOut/V4">

7<input type="hidden" name="MerchantID" value="2000132" />
9<input type="hidden" name="MerchantTradeNo" value="" />
8<input type="hidden" name="MerchantTradeDate" value="" /> 
10<input type="hidden" name="PaymentType" value="aio" />
14<input type="hidden" name="TotalAmount" value="5" />
16<input type="hidden" name="TradeDesc" value="建立信用卡測試訂單" />
6<input type="hidden" name="ItemName" value="MacBook 30元X2#iPhone6s 40元X1" />
12<input type="hidden" name="ReturnURL" value="" />
1<input type="hidden" name="ChoosePayment" value="Credit" />
13<input type="hidden" name="StoreID" value="" />
2<input type="hidden" name="ClientBackURL" value="" />
3<input type="hidden" name="CreditInstallment" value="" />
5<input type="hidden" name="InstallmentAmount" value="" />
11<input type="hidden" name="Redeem" value="" />
4<input type="hidden" name="EncryptType" value="1" />
<input type="hidden" name="CheckMacValue" value="" /><br />
<input type="submit" value="送出訂單" id="btn-warning" />
</form>
                                                                        
                                                                        
<script>
$(function(){
$('#btn-warning').on('click', function(){
	  //抓目前時間
	  var myDate = new Date((new Date).getTime());
	  var today = myDate.getFullYear() + '-' +(myDate.getMonth() + 1) + '-' +  myDate.getDate() + ' '+myDate.getHours()+ ':'+myDate.getMinutes()+ ':'+myDate.getSeconds();
	  //alert(today); 
	  $(this).parents('form').find('input:nth-child(2)').val("DX20171102021549np9o");  //交易序號
      $(this).parents('form').find('input:nth-child(3)').val(today);  //交易時間
      $(this).parents('form').find('input:nth-child(8)').val("https://developers.allpay.com.tw/AioMock/MerchantReturnUrl");  //ReturnURL
      $(this).parents('form').find('input:nth-child(11)').val("https://developers.allpay.com.tw/AioMock/MerchantClientBackUrl"); //ClientBackURL Client端返回廠商網址
 
	  
	  var CheckMacValueStep1 = "ChoosePayment="+$(this).parents('form').find('input:nth-child(9)').val() +"&" +
	                           "ClientBackURL="+$(this).parents('form').find('input:nth-child(11)').val() + "&" +
	                           "CreditInstallment="+$(this).parents('form').find('input:nth-child(12)').val() + "&" +
	                           "EncryptType="+$(this).parents('form').find('input:nth-child(15)').val() + "&" +
	                           "InstallmentAmount="+$(this).parents('form').find('input:nth-child(13)').val() + "&" +
	                           "ItemName="+$(this).parents('form').find('input:nth-child(7)').val() + "&" +
	                           "MerchantID="+$(this).parents('form').find('input:nth-child(1)').val() + "&" +
	                           "MerchantTradeDate="+$(this).parents('form').find('input:nth-child(3)').val() + "&" +
	                           "MerchantTradeNo="+$(this).parents('form').find('input:nth-child(2)').val() + "&" +
	                           "PaymentType="+$(this).parents('form').find('input:nth-child(4)').val() + "&" +
	                           "Redeem="+$(this).parents('form').find('input:nth-child(14)').val() + "&" +
	                           "ReturnURL="+$(this).parents('form').find('input:nth-child(8)').val() + "&" +
	                           "StoreID="+$(this).parents('form').find('input:nth-child(10)').val() + "&" +
	                           "TotalAmount="+$(this).parents('form').find('input:nth-child(5)').val() + "&" +
	                           "TradeDesc="+$(this).parents('form').find('input:nth-child(6)').val();
      
	  var CheckMacValueStep2 =  "HashKey=5294y06JbISpM5x9&" + CheckMacValueStep1 +"&HashIV=v77hoKGq4kWxNNIS";                          
	  
	  
	  alert(escape(CheckMacValueStep2))
      var CheckMacValue = "";
	  
	  $(this).parents('form').find('input:nth-child(16)').val(CheckMacValue);  //CheckMacValue
		
}) 
});
</script>                                                                                                                                               

</body>
</html>



