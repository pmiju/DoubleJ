<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css?">
<title> 관리자 - Main Page </title>
</head>
<body id="page">
<!-- 오른쪽 상단 메뉴 -->
   <header>
      <section>
         <div id="top">
         <ul>
            <li><a href="admin_logout.jsp">관리자님, LOGOUT  |  </a></li>
            <li><a href="manager_index.jsp" target="_balnk">관리페이지 </a></li>
         </ul>
         </div>
      </section>

<!-- 메인로고&메인메뉴 -->
      <section id="main2">         
         <div id="logo">
            <a href="index.jsp"><img src="img/main/logo.png" id="mainlogo"></img></a>
         </div>
         
         <div id="search">
            <ul>
               <li><img src="img/main/search.png" id="searchimg"></li>
               <li><p id="search1" style="color:grey">검색</p></li>
            </ul>
         </div>
      </section>
   </header>
   
   <section id="main">
      <div>
         <div id="cat1">
            <ul>
               <li><a href="woman.jsp">WOMAN</a></li>
               <li><a href="man.jsp">MAN</a></li>
               <li>문의</li>
               <li>리뷰</li>
            </ul>
         </div>
         
         <div id="cat2">
               <img src="img/main/mainimg.PNG">
         </div>
   
      </div>
   </section>

<!-- best 메뉴 -->
  <section id="item">
      <p style="clear:both">
      <h4>MORE</h4>
      <h3>BEST ITEMS</h3>
      <% Vector vResult1= proMgr.getBestProductList(); %>
<%
	for(int i=0; i<vResult1.size(); i++){
		ProductBean product = (ProductBean)vResult1.get(i); 
%>
      <div class="best">
          <ul>
          <li><a href="<%= request.getContextPath() %>/ProductDetail.jsp?send_id=<%= product.getNo()%>">
          <img src="data/<%=product.getImage()%>" width="300"><br>
					<span style="color:black; font-weight:bold;"><%=product.getName() %></span><br>
					<%=product.getPrice() %>원<br>
					</a></li>
          </ul>
      </div>
<% 
	}
%>
   </section>

   <section id="item2">
      <p style="clear:both">
      <h4>MORE</h4>
      <h3>NEW ITEMS</h3>
      <% Vector vResult2= proMgr.getNewProductList(); %>
<%
	for(int i=0; i<vResult2.size(); i++){
		ProductBean product = (ProductBean)vResult2.get(i); 
%>
      <div class="product">
          <ul>
             <li><a href="<%= request.getContextPath() %>/ProductDetail.jsp?send_id=<%= product.getNo()%>">
             <img src="data/<%=product.getImage()%>" width="210" height="260"><br></a></li>
          </ul>
      </div>
<% 
	}
%>
       <div class="nt">
       <h4>MORE</h4>
         <h3>공지사항</h3>
         <br>
         <table>
            <tr>
               <td>배송문의</td>
            </tr>
            <tr>
               <td>상품문의</td>
            </tr>
            <tr>
               <td></td>
            </tr>
            <tr>
               <td></td>
            </tr>
            <tr>
               <td></td>
            </tr>
         </table>
      </div>
   </section>
   
   <footer>
      <p style="clear:both">
      <hr>
      <div>Double J | 사업자등록번호 : 000-00-00000 | 대표자 : 이지수 & 박미주 | 동양미래대학교 |
      대표번호 : 080-000-0000 | (사업자정보확인) | 개인정보처리방침| 이용약관</div>
   </footer>
</body>
</html>