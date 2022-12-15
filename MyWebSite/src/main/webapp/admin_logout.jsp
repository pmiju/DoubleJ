<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   session.invalidate();
   
%>
    
<script>
    alert("관리자님 로그아웃되었습니다");
   location.href="index.jsp";
</script>