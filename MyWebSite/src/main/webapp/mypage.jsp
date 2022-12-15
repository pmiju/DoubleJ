<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<link href="css/menu.css?before" rel="stylesheet" type="text/css">
<style>
table {
    border-top: 1px solid #E6E6E6;
    border-collapse: collapse; 
    margin-top : 50px;
}

th {
   border-bottom: 1px solid #E6E6E6;
    padding: 40px 80px 40px 80px;
     color : grey;
}

td {
   border-bottom: 1px solid #E6E6E6;
   padding: 40px;
   text-align : center;
}
#plus {
	width : 650px;
	margin-top : 30px;
}
#plus ul li {
	padding-bottom : 10px;
}
</style>
</head>
<body>
<!-- 상단메뉴바, 메인로고 -->
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
            <li><a href="order.jsp">ORDER  |  </a></li>
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
   
 <div align="center">
<table>
	<tr>
		<th>입금전</th>
		<th>배송준비중</th>
		<th>배송중</th>
		<th>배송완료</th>
	</tr>
	<tr>
		<td>0</td>
		<td>0</td>
		<td>0</td>
		<td>0</td>
	</tr>
</table>
</div>
<div align="right" id="plus">
	<ul>
		<li>총 적립금 : </li>
		<li>쿠폰     : <br><input type="submit" value="쿠폰 발급"></li>
		<li>총 주문   : </li>
	</ul>
</div>
</body>
</html>