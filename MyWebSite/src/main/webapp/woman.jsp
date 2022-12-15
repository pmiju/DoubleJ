<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/menu.css?after" rel="stylesheet" type="text/css">
<title>WOMAN</title>
<style>
	.product {
		width:350px;
		height:700px;
		float : left;
		margin-left : 35px;
	}
	.product ul{
	list-style: none;
	text-align: center;
	display : block;
	}
	
	.product li{
		display: inline-block;
		margin : 50px 0px 0px 200px;
	}
	</style>
</head>
<body>
<!-- 상단메뉴바, 메인로고 -->
<%@ include file="top.jsp" %>

<% 
	DecimalFormat formatter = new DecimalFormat("###,###");
	Vector vResult= proMgr.getProductListWoMan(); 
%>
<%
	for(int i=0; i<vResult.size(); i++){
		ProductBean product = (ProductBean)vResult.get(i); 
%>
	<div class="product">
				<ul>
					<li><img src="data/<%=product.getImage()%>" width="300" height="450"><br>
					<span style="color:black; font-weight:bold;"><%=product.getName() %></span><br>
					<%=product.getPrice() %>원<br>
					
					<a href="<%= request.getContextPath() %>/ProductDetail.jsp?send_id=<%= product.getNo()%>">[ 상세보기 ] </a></li>
				</ul>
			</div>
<% 
	}
%>
</body>
</html>