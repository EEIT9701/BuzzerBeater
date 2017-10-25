<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="479061090060-qgqlhuskuhlic83mre6d26pmr9cejk6f.apps.googleusercontent.com">
<!-- google api 驅動 -->


    <div id="id01" class="modal">
        <form class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
<!--                 <img src="img_avatar2.png" alt="Avatar" class="avatar"> -->
            </div>

            <div class="container">
<!--                 <label><b>Username</b></label> -->
<!--                 <input type="text" placeholder="Enter Username" name="uname" required> -->

<!--                 <label><b>Password</b></label> -->
<!--                 <input type="password" placeholder="Enter Password" name="psw" required> -->

                <button style="background-color:#4267b2" type="submit">FB</button>
                <button class="g-signin2" style="background-color:#d14836" type="submit" data-onsuccess="onSignIn">G-mail</button>
                <script>
                function onSignIn(googleUser) {
                	var id_token = googleUser.getAuthResponse().id_token;
        			console.log("ID Token: " + id_token);
        			var xhr = new XMLHttpRequest();
        			if (xhr != null) {  
        				xhr.open("POST", "LoginServlet");
        				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        				xhr.send("idtoken=" + id_token);
        			}
        			else {
        				console.log("No XMLHttpRequest~");				
        			}
                	
                }
                </script>
                
                <button style="background-color:#1da1f2" type="submit">Twitter</button>
                <input type="checkbox" checked="checked"> Remember me
                <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
        </form>
    </div>
    
        <script>
	// Get the modal
	var modal = document.getElementById('id01');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
	    }
	}
    </script>


