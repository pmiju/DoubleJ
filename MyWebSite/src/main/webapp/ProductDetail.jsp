<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/detail.css?after" rel="stylesheet" type="text/css">
<title>상품상세보기</title>
</head>
<body>
<!-- 상단메뉴바, 메인로고 -->
<%@ include file="top.jsp" %>

 <div align="center" id="prodiv" >

 <%ProductBean product= proMgr.getProduct(request.getParameter("send_id"));%>
<form name="cart" action="addcart.jsp">
 <table width="700px">
 <input type="hidden" name="category">
 	<tr>
 		<td rowspan="10">
 			<img src="data/<%=product.getImage()%>" height="500" width="370">
 		</td>
 	</tr>
 	<tr>
 		<td id="proname"><%=product.getName() %><hr></td>
 	</tr>
 	<tr height="0px">
 		<td><%=product.getDetail() %></td>
 	</tr>
 	<tr align="right">
 		<td><%=product.getPrice()%>원<hr></td>
 	</tr>
 	<tr align="right">
 		<td>
	 		<input type="number" name="quantity" value="1" min="1" max="1000">
		</td>
 	</tr>
 	<tr align="right">
 		<td><input type="submit" value="장바구니" id="btn1" name="add"></td>
 		
 	</tr>
 </table>
 <input type=hidden name=product_no value=<%=product.getNo()%>>	
 </form>
</div>
</body>
</html>