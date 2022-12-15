<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="orderMgr" class="mywebsite.OrderMgr" />
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<%
OrderBean order = orderMgr.getOrderDetail(request.getParameter("send_id"));
ProductBean product = proMgr.getProduct(order.getProduct_no());
%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>주문상품 상세보기</title>
</head>
<body>
 
	<table >

		<form method=post name="order" action="order_run.jsp?flag=update">
		<table width="50%">
		<tr bgcolor="#c0c0c0"> 
		<td colspan="2" align="center"><font color="#000000">주문 상세내역</font></td>
		</tr>
		<tr> 
		<td align="center">고객아이디</td>
		<td align="center"><%=order.getId()%></td>
		</tr>
		<tr> 
		<td align="center">주문번호</td>
		<td align="center"><%=order.getNo()%></td>
		</tr>
		<tr> 
		<td align="center">제품번호</td>
		<td align="center"><%=product.getNo()%></td>
		</tr>				
		<tr> 
		<td align="center">제품이름</td>
		<td align="center"><%=product.getName()%></td>
		</tr>
		<tr> 
		<td align="center">제품가격</td>
		<td align="center"><%=product.getPrice()%>원</td>
		</tr>
		<tr> 
		<td align="center">주문수량</td>
		<td align="center"><%=order.getQuantity()+""%>개</td>
		</tr>
		<tr> 
		<td align="center">재고수량</td>
		<td align="center"><%=product.getStock()%>개</td>
		</tr>		
		<tr> 
		<td align="center">주문날짜</td>
		<td align="center"><%=order.getDate()%></td>
		</tr>
		<tr> 
		<td align="center">금액</td>
		<td align="center"><%=order.getQuantity()*Integer.parseInt(product.getPrice())%>원</td>
		</tr>
		<tr> 
		<td align="center">주문상태</td>
		<td align="center">
		<select name="state">
		<option value="1">접수중</option>
		<option value="2">접수</option>
		<option value="3">입금확인</option>
		<option value="4">배송준비</option>
		<option value="5">배송중</option>
		<option value="6">완료</option>
		</select>
		<script>document.order.state.value=<%=order.getState()%></script>
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center">
		<input type="submit" value="수정" size="3" onclick="javascript:orderUpdate(this.form)"></a>
		</td>
		</tr>
		</table>
		<input type="hidden" name="no" value="<%=order.getNo()%>">
		<input type="hidden" name="flag">
		</form>		
			
	</td>
	</tr>
	</table>
</body>
</html>