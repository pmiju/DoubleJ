<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String send_id = request.getParameter("send_id");

   String dbid = null;
   String dbpw = null;
   String dbname = null;
   String dbemail = null;
   String dbaddr = null;
   String dbpnum = null;
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   Class.forName("com.mysql.jdbc.Driver");
   
   try {
      //DB 연결
      String jdbcDriver = "jdbc:mysql://localhost:3306/webdb?"+"useUnicode=true&characterEncoding=utf-8";
      String dbUser = "root";
      String dbPass = "019493";
            
      conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
      
      pstmt = conn.prepareStatement("select * from membertbl where memberid=?");
      pstmt.setString(1, send_id);
      
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
         dbid = rs.getString("memberid");
         dbpw = rs.getString("password");
         dbname = rs.getString("name");
         dbemail = rs.getString("email");
         dbaddr = rs.getString("addr");
         dbpnum = rs.getString("pnum");
      }
      
   } catch(SQLException ex) {
      out.println(ex.getMessage());
      ex.printStackTrace();
   } finally {
      if(rs != null) try { rs.close(); } catch(SQLException ex) {}
      if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
      if (conn != null) try { conn.close(); } catch(SQLException ex) {}
   }
%>

<form action = "<%= request.getContextPath() %>/admin/member_update.jsp" method="post">
   <table>
      <tr>
            <td>아이디</td>
            <td><input type="text" name="memberid" value=<%=dbid %> readonly></td>
      </tr> 
      <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" value=<%=dbpw %>></td>
      </tr> 
      <tr>
            <td>이름</td>
            <td><input type="text" name="name" value=<%=dbname %>></td>
      </tr> 
      <tr>
            <td>이메일</td>
            <td><input type="text" name="email" value=<%=dbemail %>></td>
      </tr> 
      <tr>
            <td>주소</td>
            <td><input type="text" name="addr" value=<%=dbaddr %>></td>
      </tr> 
      <tr>
            <td>전화번호</td>
            <td><input type="text" name="pnum" size="10" value=<%=dbpnum %>></td>
      </tr> 
      <tr>
            <td><input type="submit" value="수정"></td>
      </tr>
   </table>
</form>

</body>
</html>