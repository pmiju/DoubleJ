<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="orderMgr" class="mywebsite.OrderMgr" />
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물관리 - 주문관리</title>
<style>
#meminfo {
   margin : 10px 0px 0px 0px;
   border-collapse : collapse;
   display:block;
   overflow:scroll;
   background-color : white;
   height : 900px;
   width : 1000px;
}
#meminfo table {
   border-top : 1px solid grey;
   border-bottom : 1px solid grey;
}
#meminfo th {
   border : 1px solid grey;
   padding : 5px;
}
#meminfo td {
   border: 1px solid grey;
}
</style>
</head>
<body>
   <div>
      <table id="meminfo">
         <tr>
            <th style="width:100px;">주문번호</th>
            <th style="width:100px;">구매자</th>
            <th style="width:200px;">제품명</th>
            <th style="width:100px;">주문수량</th>
            <th style="width:500px;">주문날짜</th>
            <th style="width:70px;">주문상태</th>
            <th style="width:50px;">상세보기</th>
         </tr>
<%
		Vector vResult = orderMgr.getOrderList();
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5">등록된 상품이 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i< vResult.size(); i++){
			OrderBean order = (OrderBean)vResult.get(i);
			ProductBean product = proMgr.getProduct(order.getProduct_no());
		%>
     <tr> 
		<td align="center"><%=order.getNo()%></td>
		<td align="center"><%=order.getId()%></td>
		<td align="center"><%=product.getName()%></td>
		<td align="center"><%=order.getQuantity()%></td>
		<td align="center"><%=order.getDate()%></td>
		<td align="center">
		<%
		switch(Integer.parseInt(order.getState())){
		case 1 : out.println("접수중");
		break;
		case 2 : out.println("접수");
		break;
		case 3 : out.println("입금확인");
		break;
		case 4 : out.println("배송준비");
		break;
		case 5 : out.println("배송중");
		break;
		default : out.println("완료");
		}%>
		</td>
		<td align="center"><a href="<%= request.getContextPath() %>/admin/order_detail_form.jsp?send_id=<%= order.getNo()%>"><input type="button" value="수정" style="font-size:11px;"></a>
				<form action="order_run.jsp?flag=delete" method="post">
				<input type=hidden name="no" value="<%=product.getNo()%>">
				<input type="submit" value="삭제" style="font-size:11px;">
        		</form></td>
        </td>
        </tr>
         <%}
		}%> 
      </table>
   </div>
</body>
</html>