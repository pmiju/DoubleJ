<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memMgr" class="mywebsite.MemberMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>
</head>
<body>
<%
	String flag = request.getParameter("flag");
	boolean result = false;
	
	if(flag.equals("delete")){
		result=memMgr.memberDelete(request.getParameter("num"));
	}else{
		response.sendRedirect("member_all.jsp");
	}
	if(result){
%>
	  <script>
	    alert("삭제 완료");
		location.href="member_all.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("삭제에 오류가 발생하였습니다.");
		location.href="member_all.jsp";
	  </script>
<%	
	}
%>
</body>
</html>