<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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