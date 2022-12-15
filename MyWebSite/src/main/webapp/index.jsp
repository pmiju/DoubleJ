<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css?">
<title> Main Page </title>
<style>

</style>
</head>
<body id="page">

<%@ include file="index_top.jsp" %>
   
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
   
   <%@ include file="bottom.jsp" %>
</body>
</html>