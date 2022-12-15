<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/login.css?after">
<style>
#adminlogbtn {
	margin : 10px 0px 0px 20px;
   color: black;
   background: white;
   width : 210px;
   height: 25px;
}

#loginbtn {
   margin-top : 30px;
   color: white;
   background: #c0c0c0;
   width : 250px;
   height: 30px;
}
</style>
<title>로그인 페이지</title>
</head>
<body id="page">
<header>
<div id="top">
         <ul>
            <li><a href="joinForm.jsp">JOIN  |  </a></li>
            <li><a href="loginForm.jsp">LOGIN  |  </a></li>
            <li>ORDER  |  </li>
            <li>MYPAGE  |  </li>
            <li>CART</li>
         </ul>
</div>
</header>

<div id="logo">
   <a href="index.jsp"><img src="img/main/logo.png" id="mainlogo"></img></a>
</div>

<h2>로그인</h2>
<div id="mainForm">
<form action="login_ok.jsp" method="post">
      <input id="member_id" type="text" name="memberid" placeholder="아이디"><br/>
      <input id="member_pw" type="password" name="password" placeholder="비밀번호"><br/>
      <input id="loginbtn" type="submit" value="로그인"><br/>   
</form>
<button id="adminlogbtn"><a href="admin_loginForm.jsp">관리자로 로그인하기</a></button>
</div>
<footer>
   <p style="clear:both">
   <hr>
   <div>Double J | 사업자등록번호 : 000-00-00000 | 대표자 : 이지수 & 박미주 | 동양미래대학교 |
   대표번호 : 080-000-0000 | (사업자정보확인) | 개인정보처리방침| 이용약관</div>
</footer>

</body>
</html>