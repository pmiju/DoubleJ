<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/manage.css">
<title>관리자페이지</title>
<%
	String contentPage = request.getParameter("CONTENTPAGE");
	if(contentPage == null) {
		contentPage = "member.jsp";
	}
%>
</head>
<body id="page">
	<header>
		<ul>
			<li><img src="img/main/logo.png" width="90px;"/></li>
		</ul>
	</header>
	<div id="content" >
		<section>
			<jsp:include page="admin/left.jsp" flush="false" />
		</section>
		<section id="frame" style="background-color:#E6E6E6; height:950px;">
			<jsp:include page='<%="admin/"+contentPage %>' flush="false" />
		</section>
	</div>
</body>
</html>

