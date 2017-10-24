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
    			'width':'100%'}
    	var FB={'background-color':'#4267b2'}
    	var Gmail={'background-color':'#d14836'}
    	var Twitter={'background-color':'#1da1f2'}
    	$('li').find("button").css(x1)
    	$('#id01').children("form").children("div").children("button").css(x1)
    	$('#id01').children("form").children("div").children("button:eq(0)").css(FB)
    	$('#id01').children("form").children("div").children("button:eq(1)").css(Gmail)
    	$('#id01').children("form").children("div").children("button:eq(2)").css(Twitter)
    })
    </script>
    
   