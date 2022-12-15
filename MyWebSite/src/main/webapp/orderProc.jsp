<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, mywebsite.*" %>
<jsp:useBean id="cartMgr" class="mywebsite.CartMgr" scope="session"/>
<jsp:useBean id="orderMgr" class="mywebsite.OrderMgr" />
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<%
   Hashtable hCart = cartMgr.getCartList();
   Enumeration hCartKey=hCart.keys();
   if(hCart.size() !=0){
      while(hCartKey.hasMoreElements()){
      OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
      orderMgr.insertOrder(order);
//      proMgr.reduceProduct(order);      
      cartMgr.deleteCart(order);
      }
%>
   <script>
      alert("주문처리 하였습니다");
      location.href="orderList.jsp";
   </script>
<%}else{ %>
   <script>
      alert("장바구니가 비어있습니다.");
      location.href="orderList.jsp";
   </script>
<%}%>
