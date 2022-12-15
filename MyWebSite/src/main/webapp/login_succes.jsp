<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String memberid = (String)session.getAttribute("user_id");
   String name = (String)session.getAttribute("user_name");
   response.sendRedirect("index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
   로그인에 성공함
   <%=memberid %>(<%=name %>)님 안녕하세요
   
   <a href="logout.jsp">로그아웃</a><br/>
   <a href="index.jsp">메인으로 가기</a>
</body>
</html>