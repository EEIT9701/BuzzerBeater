<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <meta name="google-signin-scope" content="profile email"> -->
<!-- <meta name="google-signin-client_id" content="479061090060-qgqlhuskuhlic83mre6d26pmr9cejk6f.apps.googleusercontent.com"> -->
<!-- google api 驅動 -->


    <div id="id01" class="modal">
        <form class="modal-content animate" style="width: 700px;">
            <div class="imgcontainer">
                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
            
            
                    <div class="container" style="width: 700px;">
                        <label><b>帳號</b></label>
                        <input type="text" placeholder="請輸入帳號" name="uname" required>

                        <label><b>密碼</b></label>
                        <input type="password" placeholder="請輸入密碼" name="psw" required>

                        <button class="Login_button" type="submit" ><p style="font-size: large;">登入</p></button>
                        <input type="checkbox" checked="checked"> 記住我
                    </div>
                    <hr>
                    
            <div class="container" style="background-color:#f1f1f1;width:690px" >
			<a class="btn btn-default"  style="background-color:#db4437;width:660px;height:50px;color:white"
					href="https://accounts.google.com/o/oauth2/auth?
					scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email&
					redirect_uri=http://localhost:8080/BuzzerBeater/GoogleLogin.do&
					response_type=code&
					state=/profile&
					client_id=879939044143-sfo5p4l1nmd7ndrpdjhg8fh07ass3akm.apps.googleusercontent.com">
			<p style="font-size: large;margin-top: 7px;">G-mail</p>
			</a>
			<br><br>
			<a class="btn btn-default" style="background-color:#4267b2;width:660px;height:50px;color: white;"
			 href="https://www.facebook.com/v2.5/dialog/oauth?
             client_id=144809318927994&
             redirect_uri=http://localhost:8080/BuzzerBeater/FaceBookLogin.do&
             state=/profile&
             response_type=code&
             scope=email,public_profile">
			<p style="font-size: large;margin-top: 7px;">Facebook</p>
			</a>
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


