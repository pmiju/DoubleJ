<%@ page contentType="text/html;charset=utf-8"%>

<% 
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memMgr" class="mywebsite.MemberMgr" />
<jsp:useBean id="regBean" class="mywebsite.RegisterBean" />
<jsp:setProperty name="regBean" property="*" />
<link rel="stylesheet" type="text/css" href="css/main.css?">
<%
    boolean flag = memMgr.memberInsert(regBean);
%>

<html>
<head>
<title>회원가입 확인</title>
<html>
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
<br><br>
<center>
<%
if(flag){
     out.println("<b>회원가입을 축하 드립니다.</b><p>");
     out.println("<a href=loginForm.jsp>로그인</a>");
   }else{
      
      out.println( );
   }
%>
</center>
</body>
</html>