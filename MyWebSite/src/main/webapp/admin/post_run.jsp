<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실행</title>
</head>
<body>
<%
	String flag = request.getParameter("flag");
	boolean result = false;
	
	if(flag.equals("insert")){
		result=proMgr.insertProduct(request);
	}else if(flag.equals("update")){
		result=proMgr.updateProduct(request);
	}else if(flag.equals("delete")){
		result=proMgr.deleteProduct(request.getParameter("no"));
	}else{
		response.sendRedirect("post_pd_admin.jsp");
	}
	if(result){
%>
	  <script>
	    alert("처리 완료");
		location.href="post_pd_admin.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="post_pd_admin.jsp";
	  </script>
<%	
	}
%>
</body>
</html>