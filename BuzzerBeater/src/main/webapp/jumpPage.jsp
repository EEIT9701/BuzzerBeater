<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Buzzer Beater</title>

    <script type="text/javascript">
	//��������
	function closeWin () {
	//�I�swindow����close()���,��������
		window.location.replace('<%=request.getContextPath() %>/index.jsp');
}
	//�\�h��ᤣ�߰ݦ۰���������
	//�w�q�@�ӬO�_�����������ܼ�
	var willClose = true;
	//�I������
	function clickBody () {
		//���y������,�h���ܼƸm��false
		willClose = false;
	}
	setInterval (function() {
		//�P�_�O�_�ݭn����
		if(willClose) {
			//��������
		    window.location.replace('<%=request.getContextPath() %>/index.jsp');
		} else {
			//�p�G�I���L,���s�}�l�p��
			willClose = true;
		}
	},20000);
    </script>
    
    
</head>
<body style="text-align:center" onclick="clickBody()">

    <div style="text-align:center">
    <h1>�z�wú�O���\!</h1>
        <h2>�Y2�������I������,�t�αN�۰ʾɦV����</h2>
    </div>

    <span id="ad"></span>

    <!-- �I�����s�I�s��������  -->
    <div style="text-align:center">
        <input type="button" value="�I�����୺��" onclick="closeWin()" />
    </div>


</body>
</html>