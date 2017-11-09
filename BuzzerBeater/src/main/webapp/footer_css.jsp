<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!--標頭樣式2-2-->    
<%--     <script>window.jQuery || document.write('<script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"><\/script>')</script> --%>
    <script src="<%=request.getContextPath() %>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootsnav.js"></script>

    <script>
    $(document).ready(function(){
    	var x1={'background-color':'#e3a727',
    			'color':'white',
    			'padding':'14px 20px',
    			'margin':'8px 0',
    			'border':'none',
    			'cursor':'pointer',
    			'width':'100%'};
    	var Gmail={'vertical-align': 'middle',
    		  	  'padding-top': '25px',
       			  'margin-left': '38px',
       	 		  'width': '80%'};
    	var FB={'background-color':'#4267b2'};
    	var Twitter={'background-color':'#1da1f2'};
    	$('li').find("button").css(x1);
    	$('#id01').children("form").children("div").children("button").css(x1);
    	$('#id01').children("form").children("a:eq(0)").children("img").css(Gmail);
    	
    })
    </script>
    <script>
//     function onSuccess(googleUser) {
//       console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
//     }
//     function onFailure(error) {
//       console.log(error);
//     }
//     function renderButton() {
//       gapi.signin2.render('my-signin2', {
//         'scope': 'profile email',
//         'width': 240,
//         'height': 50,
//         'longtitle': true,
//         'theme': 'dark',
//         'onsuccess': onSuccess,
//         'onfailure': onFailure
//       });
//     }
    </script>
<!--標頭登入後功能鍵-->    
<script>

</script>

    
   