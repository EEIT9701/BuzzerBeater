<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <meta name="google-signin-scope" content="profile email"> -->
<!-- <meta name="google-signin-client_id" content="479061090060-qgqlhuskuhlic83mre6d26pmr9cejk6f.apps.googleusercontent.com"> -->
<!-- google api 驅動 -->


    <div id="id01" class="modal">
        <form class="modal-content animate" style="height:280px;width:380px;">
            <div class="imgcontainer">
                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
            <div>
			<a href="https://accounts.google.com/o/oauth2/auth?
					scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email&
					redirect_uri=http://localhost:8080/BuzzerBeater/GoogleLogin.do&
					response_type=code&
					state=/profile&
					client_id=879939044143-sfo5p4l1nmd7ndrpdjhg8fh07ass3akm.apps.googleusercontent.com">
				<img src="<%=request.getContextPath()%>/images/google_1.png" 
					style="width: 350px; height: 100px;padding-top: 50px;padding-left: 20px;"/>
			</a>
			<a href="https://www.facebook.com/v2.5/dialog/oauth?
             client_id=144809318927994&
             redirect_uri=http://localhost:8080/BuzzerBeater/FaceBookLogin.do&
             state=/profile&
             response_type=code&
             scope=email,public_profile">
				<img src="<%=request.getContextPath()%>/images/facebook_01.png"
				style="width: 350px;height: 100px;padding-top: 50px;padding-left: 20px;"/>
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


