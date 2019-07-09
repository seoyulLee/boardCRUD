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
<title>BOARD REMOVE FORM</title>
</head>
<body>
<div class="row"> <!-- grid div --> 
<div class="col-sm-2"></div>
<div class="col-sm-8"> <!-- 중앙grid div -->
<%
    // boardNo값이 넘어오지 않으면 boardList.jsp로 이동
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
    } else {
%>
<br><br>
<h2>BOARD REMOVE</h2>
        <form action="<%=request.getContextPath()%>/jsp_board/boardRemoveAction.jsp" method="post">
            <!-- boardPw와 함께 boardNo값도 숨겨서(hidden값으로) 넘김 -->
            <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
            <div>비밀번호확인 :</div>
            <div><input name="boardPw" type="password"></div>
            <br>
            <div>
                <input class="btn btn-outline-secondary btn-sm" type="submit" value="삭제"/>
                <input class="btn btn-outline-secondary btn-sm" type="reset" value="초기화"/>
            </div>
        </form>
<%    
    }
%>
</div> <!-- 중앙grid /div -->
<div class="col-sm-2"></div>
</div> <!-- grid /div -->
</body>
</html>