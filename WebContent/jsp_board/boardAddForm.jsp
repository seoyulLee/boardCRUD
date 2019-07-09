<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD ADD</title>
</head>
<body>
<div class = "row"> <!-- grid div -->
	<div class = "col-sm-2"></div>
	<div class = "col-sm-8">
		<br><br>
		<h2>BOARD ADD</h2>
		<form action="<%=request.getContextPath()%>/jsp_board/boardAddAction.jsp" method="post">
		    <div>boardPw : </div>
		    <div><input name="boardPw" id="boardPw" type="password"/></div>
		    <div>boardTitle : </div>
		    <div><input name="boardTitle" id="boardTitle" type="text"/></div>
		    <div>boardContent : </div>
		    <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"></textarea></div>
		    <div>boardName : </div>
		    <div><input name="boardUser" id="boardUser" type="text"/></div>
		    <div>
		        <input class="btn btn-outline-secondary btn-sm" type="submit" value="글입력"/>
		        <input class="btn btn-outline-secondary btn-sm" type="reset" value="초기화"/>
		    </div>
		</form>
	</div>	
	<div class = "col-sm-2"></div>
</div><!-- grid /div -->
</body>
</html>
