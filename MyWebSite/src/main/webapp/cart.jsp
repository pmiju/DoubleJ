<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<%@ page import="java.text.*" %>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<jsp:useBean id="cartMgr" class="mywebsite.CartMgr" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="css/menu.css?before" rel="stylesheet" type="text/css">
<style>
#cartdiv{
	margin-top:100px;
}
table {
    border-top: 1px solid #E6E6E6;
    border-collapse: collapse; 
}

th {
   border-bottom: 1px solid #E6E6E6;
    padding: 10px;
     color : grey;
}

td {
   border-bottom: 1px solid #E6E6E6;
    padding: 10px;
}
#btn1 {
	background-color : #404040;
	color : white;
	margin-right : 10px;
	padding : 10px 40px 10px 40px;
}
</style>
<script>
function cartUpdate(form){
	form.flag.value="update"
	form.submit();
}

function cartDelete(form) {
	form.flag.value="del";
	form.submit();
}
</script>
</head>
<body>
<!-- 상단메뉴바, 메인로고 -->
<%@ include file="top.jsp" %>
<p align="center">장바구니</p>

<div align="center" id="cartdiv">
	 <table>
	 	<tr>
	 		<th style="width:100px">이미지</th>
	 		<th style="width:400px">상품명</th>
	 		<th style="width:100px">판매가</th>
	 		<th style="width:10px">수량</th>
	 		<th style="width:150px">배송구분</th>
	 		<th style="width:200px">합계</th>
	 		<th style="width:200px">기능</th>
	 	</tr>
	 	
<%
		DecimalFormat formatter = new DecimalFormat("###,###");
		int totalPrice =0 ;		
		Hashtable hCart = cartMgr.getCartList();
		if(hCart.size() == 0){
		%>
		<tr><td colspan="5" align="center">선택하신 물품이 없습니다.</td></tr>	

		<%
		}else{
		Enumeration hCartKey=hCart.keys();
			while(hCartKey.hasMoreElements()){
			OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
			ProductBean product = proMgr.getProduct(order.getProduct_no());
			int price = Integer.parseInt(product.getPrice());
			int quantity = order.getQuantity();
			int subTotal = price*quantity;
			totalPrice += price*quantity;
			
		%>
		<form method="post" action="addcart.jsp">
		<input type="hidden" name="product_no" value="<%=product.getNo()%>">
		<input type="hidden" name="flag">
				  <tr>
				  			<td align="center"><img src="data/<%=product.getImage()%>" height="150" width="90"></td>
							<td><%=product.getName()%></td>
							<td align="center"><%= formatter.format(price) %>원</td>
							<td align="center"><input type=number name="quantity" value="<%= order.getQuantity() %>"></td>
							<td align="center">일반배송</td>
							<td align="center"><%=formatter.format(subTotal) %>원</td>
							<td align="center">
							<input type="button" value="수정" size="3" onclick="cartUpdate(this.form)">
							<input type="button" value="삭제" size="3" onclick="cartDelete(this.form)">
							</td>
						</tr>
						</form>
<%
			} 
%>
				<tr> 
					<td colspan="7" align="center"><span style="font-size:22px; font-weight:bold;">
					결제예정금액 = <%=formatter.format(totalPrice)%> 원</span></td>
				</tr>
<%		
	}
%>
				<tr align="right">
					<td colspan=7><a href="orderProc.jsp"><input type="submit" value="전체상품주문"  id="btn1"></a></td>
				</tr>
	 </table>
 </div>
</body>
</html>