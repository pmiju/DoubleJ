<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물관리 - 상품관리</title>
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
<jsp:include page="post_top.jsp"/>
   <div>
      <table id="meminfo">
         <tr>
            <th style="width:100px;">일련번호</th>
            <th style="width:100px;">카테고리</th>
            <th style="width:200px;">상품명</th>
            <th style="width:100px;">상품가격</th>
            <th style="width:500px;">상품설명</th>
            <th style="width:70px;">상품수량</th>
            <th style="width:100px;">비고</th>
         </tr>
<%
		Vector vResult= proMgr.getProductList();
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5">등록된 상품이 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<vResult.size(); i++){
			ProductBean product = (ProductBean)vResult.get(i);
		%>
     <tr>
            <td style="text-align:center;"><%= product.getNo() %></td>
            <td><%= product.getCategory() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getDetail() %></td>
            <td><%= product.getStock() %></td>
            <td style="text-align:center;">
            <a href="<%= request.getContextPath() %>/admin/post_update_form.jsp?send_id=<%= product.getNo()%>"><input type="button" value="수정" style="font-size:11px;"></a>
				<form action="post_run.jsp?flag=delete" method="post">
				<input type=hidden name="no" value="<%=product.getNo()%>">
				<input type="submit" value="삭제" style="font-size:11px;">
        		</form></td>
         </tr>
         <%}
		}%>
      </table>
   </div>
</body>
</html>