<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>로그인 에러</title>
<link rel="stylesheet" type="text/css" href="css/main.css?">
</script>
</head>
<body>

 <header>
      <section>
<%
      String memberid = (String)session.getAttribute("idKey");

      String log="";
      if(memberid == null){
%>
         <div id="top">
         <ul>
            <li><a href="joinForm.jsp">JOIN  |  </a></li>
            <li><a href="loginForm.jsp">LOGIN  |  </a></li>
            <li>ORDER  |  </li>
            <li>MYPAGE  |  </li>
            <li>CART</li>
         </ul>
         </div>
      
<%      } else {
      %>         
         <div id="top">
         <ul>
            <li><a href="logout.jsp"><%=memberid%>님, LOGOUT  |  </a></li>
            <li><a href="orderList.jsp">ORDER  |  </a></li>
            <li><a href="mypage.jsp">MYPAGE  |  </a></li>
            <li><a href="cart.jsp">CART</a></li>
         </ul>
         </div>
<%
      }   
      %>
      </section>
      
      <section id="main2">         
         <div id="logo">
            <a href="index.jsp"><img src="img/main/logo.png" id="mainlogo"></img></a>
         </div>
      </section>
   </header>
<br><br><br>

<center>
<b>로그인에 실패하셨습니다.<p>
아이디 및 비밀번호를 다시 확인하시기 바랍니다.<p></b>
<input type="button" value="이전" onClick="history.back()"> 
</center>

</body>
</html>
</body>