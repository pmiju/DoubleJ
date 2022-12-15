<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mywebsite.*"%>
<jsp:useBean id="memMgr" class="mywebsite.MemberMgr" />
<jsp:useBean id="proMgr" class="mywebsite.ProductMgr" />
<jsp:useBean id="orderMgr" class="mywebsite.OrderMgr" />
<% request.setCharacterEncoding("UTF-8");%>
<jsp:setProperty name="regBean" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#meminfo {
   margin: 10px 0px 0px 0px;
   border-collapse: collapse;
   display: block;
   overflow: scroll;
   background-color: white;
   height: 900px;
   width: 1000px;
}

#meminfo table {
   border-top: 1px solid grey;
   border-bottom: 1px solid grey;
}

#meminfo th {
   border: 1px solid grey;
   padding: 5px;
}

#meminfo td {
   border: 1px solid grey;
}
</style>
</head>
<body>
   <div>
      <form
         action="<%Vector vResult= memMgr.getMemberList();%>member_select.jsp"
         method="post">
         <table>
            <tr>
               <td><select name="sk">
                     <option value="memberid">아이디</option>
                     <option value="name">이름</option>
               </select></td>
               <td><input type="text" name="sv" size=100 style="padding: 5px"></td>
               <td><input type="submit" value="검색"></td>
            </tr>
         </table>
      </form>
      <table id="meminfo">
         <tr>
            <th style="width: 50px;">일련번호</th>
            <th style="width: 100px;">아이디</th>
            <th style="width: 100px;">비밀번호</th>
            <th style="width: 100px;">이름</th>
            <th style="width: 150px;">이메일</th>
            <th style="width: 250px;">주소</th>
            <th style="width: 150px;">전화번호</th>
            <th style="width: 80px;">누적구매금액</th>
            <th style="width: 60px;">등급</th>
            <th style="width: 120px;">기능</th>
         </tr>

         <%
         for(int i=0; i<vResult.size(); i++){
         RegisterBean regBean = (RegisterBean)vResult.get(i);
         %>

         <tr>
            <td><%= regBean.getNum() %></td>
            <td><%= regBean.getMemberid() %></td>
            <td><%= regBean.getPassword() %></td>
            <td><%= regBean.getName() %></td>
            <td><%= regBean.getEmail() %></td>
            <td><%= regBean.getAddr() %></td>
            <td><%= regBean.getPnum() %></td>
            <td></td>
            <td></td>
            <td align="center">
            <a href="<%= request.getContextPath() %>/admin/member_update_form.jsp?send_id=<%= regBean.getMemberid()%>">
               <input type="button" value="수정" style="font-size: 11px;"></a> 
            <form action="member_delete.jsp?flag=delete" method="post">
				<input type=hidden name="num" value="<%=regBean.getNum()%>">
				<input type="submit" value="삭제" style="font-size:11px;">
        		</form></a>
            </td>
         </tr>
         <%} %>
      </table>
   </div>
</body>
</html>