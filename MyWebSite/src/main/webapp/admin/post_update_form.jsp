<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물관리 - 게시물수정</title>
<style>
	table {
		border : 1px solid black;
		background-color : white;
	}
	table tr td {
		border : 1px solid black;
		padding : 5px;
	}
</style>
</head>
<body>
<% ProductBean product= proMgr.getProduct(request.getParameter("send_id")); %>
<form action="post_run.jsp?flag=update" method="post" enctype="multipart/form-data">
	<table>
		<tr>
	   		<td>일련번호</td>
	   		<td><input type="text" name="no" value=<%=product.getNo() %> readonly></td>
	   </tr> 
	   <tr>
	   		<td>상품명</td>
	   		<td><input type="text" name="name" value=<%=product.getName() %>></td>
	   </tr> 
	   <tr>
	   		<td>상품가격</td>
	   		<td><input type="text" name="price" value=<%=product.getPrice() %>>원</td>
	   </tr> 
	   <tr>
	   		<td>상세설명</td>
	   		<td><textarea rows="10" cols="45" name="detail"><%=product.getDetail() %></textarea></td>
	   <tr>
	   		<td>재고</td>
	   		<td><input type="text" name="stock" value=<%=product.getStock() %>></td>
	   </tr> 
	   <tr>
	   		<td>상품 이미지</td>
	   		<td align="left"><img src="../data/<%=product.getImage()%>" width="150" height="200">
			<input type="file" name="image"></td>
	   </tr> 
	   <tr>
	   		<td><input type="submit" value="수정"></td>
	   </tr>
   </table>
</form>


</body>
</html>