<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="memMgr" class="mywebsite.MemberMgr" />
<%
   String memberid = request.getParameter("memberid");
   String password = request.getParameter("password");
   boolean loginCheck = memMgr.loginCheck(memberid, password); 
%>
<%
   if(loginCheck){
     session.setAttribute("idKey",memberid);
     response.sendRedirect("index.jsp");
   }else{
      response.sendRedirect("loginError.jsp");
   }
%>
