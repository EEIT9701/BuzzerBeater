<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <meta name="google-signin-scope" content="profile email"> -->
<!-- <meta name="google-signin-client_id" content="479061090060-qgqlhuskuhlic83mre6d26pmr9cejk6f.apps.googleusercontent.com"> -->
<!-- google api 驅動 -->


    <div id="id01" class="modal">
        <form class="modal-content animate" >
            <div class="imgcontainer">
                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
			<a href="https://tw.yahoo.com/">
				<img src="<%=request.getContextPath()%>/images/google.png" />
			</a>  
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


