<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="memMgr" class="mywebsite.MemberMgr" />
<%
   String admin_id = request.getParameter("memberid");
   String admin_passwd = request.getParameter("password");
   boolean loginCheck = memMgr.loginCheck(admin_id, admin_passwd);
    if(admin_id.equals("admin")) {
       session.setAttribute("idKey", admin_id);
%>

   <script>
   location.href="admin_index.jsp";
   </script>

<%}else{%>

   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="admin_loginForm.jsp";
   </script>

<%}%>