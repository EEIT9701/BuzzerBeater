<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <div id="id01" class="modal">
        <form class="modal-content animate" action="/action_page.php">
            <div class="imgcontainer">
                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
<!--                 <img src="img_avatar2.png" alt="Avatar" class="avatar"> -->
            </div>

            <div class="container">
                <label><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="uname" required>

                <label><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" required>

                <button style="background-color:#4267b2" type="submit">FB</button>
                <button style="background-color:#d14836" type="submit">G-mail</button>
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


