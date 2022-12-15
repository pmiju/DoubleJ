<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, mywebsite.*" %>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<jsp:useBean id="orderMgr" class="mywebsite.OrderMgr" />
<%
   if(session.getAttribute("idKey") == null) {
      response.sendRedirect("loginForm.jsp");
   }else{
%>

<html>
<head>
<title>cart</title>
<link href="css/menu.css?before" rel="stylesheet" type="text/css">
<style>
#orderdiv {
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
</style>
<script>
function productDetail(no) {
	document.detail.no.value=no;
	document.detail.submit();
}
</script>
</head>

<body>
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
            <li><a href="orderList.jsp">ORDER  |  </a></li>
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
            <p align="center">ORDER</p>
         </div>
      </section>
   </header>
   
   <div align="center" id="orderdiv">
      <table>
	      <tr> 
	      <th style="width:100px">주문번호</th>
	      <th style="width:400px">상품명</th>
	      <th style="width:100px">주문수량</th>
	      <th style="width:300px">주문날짜</th>
	      <th style="width:110px">주문상태</th>
	      </tr>
      <%
      Vector vResult = orderMgr.getOrder(memberid);
      if(vResult.size() ==0){
      %>
      <tr> 
      <td align="center" colspan="5">주문하신 물품이 없습니다.</td>
      </tr>      
      <%}else{
         for(int i=0; i< vResult.size(); i++){
         OrderBean order = (OrderBean)vResult.get(i);
         ProductBean product = proMgr.getProduct(order.getProduct_no());
      %>
      <tr> 
      <td align="center"><%=order.getNo()%></td>
      <td align="center"><a href="productDetail('<%=order.getProduct_no()%>')"><%=product.getName()%></a></td>
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
      }
      %> 
      </td>
      </tr>
      <%}
      }%>
      </table> 
   
   </td>
   </tr>
   </table>
   </div>

   <form name="detail" method="post" action="ProductDetail.jsp" >
   <input type="hidden" name="no">
   </form>
</body>
</html>
<%}%>

