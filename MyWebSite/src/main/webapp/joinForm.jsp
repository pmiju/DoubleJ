<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/join.css?after">
<title>회원가입 페이지</title>
<style>
</style>
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

<h2>회원가입</h2>
<div id="mainForm">
<form action = "join_ok.jsp" mathod="post">
   아이디<br> <input type="text" name="memberid" id="input"><Br>
   비밀번호<br> <input type="password" name="password" id="input"><Br>
   이름<br> <input type="text" name="name" id="input"><Br>
   이메일<br> <input type="text" name="email" id="input"><Br>
   주소<br> <input type="text" name="addr" id="input"><Br>
   휴대전화<br> <input type="text" name="pnum" placeholder="-없이 입력" id="input"><Br>
          
   <input id="joinbtn" type="submit" value="가입하기">
</form>
</div>

<footer>
   <p style="clear:both">
   <hr>
   <div>Double J | 사업자등록번호 : 000-00-00000 | 대표자 : 이지수 & 박미주 | 동양미래대학교 |
   대표번호 : 080-000-0000 | (사업자정보확인) | 개인정보처리방침| 이용약관</div>
</footer>
</body>
</html>