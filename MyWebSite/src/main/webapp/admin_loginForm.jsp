<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/login.css">
<title>관리자 로그인 페이지</title>
</head>
<body>

<div id="logo">
   <a href="index.jsp"><img src="img/main/logo.png" id="mainlogo"></img></a>
</div>

<form action="admin_loginOk.jsp" method="post" align="center">
      ID : <input type="text" name="memberid"><br/>
      PW : <input type="password" name="password"><br/>
      <input type="submit" value="로그인"><br/>
</form>

</body>
</html>