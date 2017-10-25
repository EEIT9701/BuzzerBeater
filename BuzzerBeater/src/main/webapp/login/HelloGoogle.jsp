<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>

<!-- 登入所需參數 -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="479061090060-qgqlhuskuhlic83mre6d26pmr9cejk6f.apps.googleusercontent.com">
<!-- google api 驅動 -->
<script src="https://apis.google.com/js/platform.js"  defer></script>
<script src="https://apis.google.com/js/api.js"  defer></script>
<title>Insert title here</title>
</head>
<body>

	<!-- 登入按鈕 -->

	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>

	<!-- 登入成功取得資料 -->
	<script>
		function onSignIn(googleUser) {
			/* 取得有用的資料: */
// 			  var profile = googleUser.getBasicProfile();
// 			  console.log("ID: " + profile.getId()); // Don't send this directly to your server!
// 			  console.log('Full Name: ' + profile.getName());
// 			  console.log('Given Name: ' + profile.getGivenName());
// 			  console.log('Family Name: ' + profile.getFamilyName());
// 			  console.log("Image URL: " + profile.getImageUrl());
// 			  console.log("Email: " + profile.getEmail());

			/* 取得的ID token 利用非同步傳送到後端  */
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);

			//把取得的id_token送回後端servlet
			var xhr = new XMLHttpRequest();
			if (xhr != null) {  
				xhr.open("POST", "LoginServlet");
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xhr.send("idtoken=" + id_token);
			}
			else {
				console.log("No XMLHttpRequest~");				
			}
		};
	</script>

	<!-- 登出按鈕 -->
	<a href="#" onclick="signOut();">Sign out</a>
	<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		}
	</script>


</body>
</html>