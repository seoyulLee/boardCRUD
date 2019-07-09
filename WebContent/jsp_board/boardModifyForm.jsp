<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
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
<title>BOARD MODIFY FORM</title>
</head>
<body>
<div class="row"> <!-- grid div -->
	<div class="col-sm-2"></div>
	<div class="col-sm-8"> <!-- 내용들어갈 중앙 div-->
<br><br>
<h2>BOARD MODIFY</h2>
<%
    if(request.getParameter("boardNo") == null) {
        response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
    } else {
        int boardNo = Integer.parseInt(request.getParameter("boardNo"));
        System.out.println("boardModify param boardNo:"+boardNo);
        String boardTitle = "";
        String boardContent = "";
        
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdev?useUnicode=true&characterEncoding=euckr";
        String dbUser = "root";
        String dbPw = "java0000";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            String selectSql = "SELECT board_title, board_content FROM board WHERE board_no=?";
            statement = connection.prepareStatement(selectSql);
            statement.setInt(1, boardNo);
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
                boardTitle = resultSet.getString("board_title");
                boardContent = resultSet.getString("board_content");
            } else {
                response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("BOARD MODIFY FROM ERROR!");
        } finally {
            try {resultSet.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
%>    
        <form action="<%=request.getContextPath()%>/jsp_board/boardModifyAction.jsp" method="post">
            <div>boardNo</div>
            <div><input name="boardNo" value="<%=boardNo%>" type="text" readonly="readonly"/></div>
            <div>비밀번호확인: </div>
            <div><input name="boardPw" id="boardPw" type="password"/></div>
            <div>boardTitle : </div>
            <div><input name="boardTitle" value="<%=boardTitle%>" id="boardTitle" type="text"/></div>
            <div>boardContent : </div>
            <div><textarea name="boardContent" id="boardContent" rows="5" cols="50"><%=boardContent%></textarea></div>
            <div>
                <input class="btn btn-outline-secondary btn-sm" type="submit" value="글수정"/>
                <input class="btn btn-outline-secondary btn-sm" type="reset" value="초기화"/>
            </div>
        </form>
<%
    }    
%>
</div> <!-- 내용들어갈 중앙 /div-->
<div class="col-sm-2"></div>
</div> <!-- grid /div -->
</body>
</html>
