<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%
   request.setCharacterEncoding("utf-8");
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   
   String memberid = request.getParameter("memberid");
   String password = request.getParameter("password");
   String name = request.getParameter("name");
   String email = request.getParameter("email");
   String addr = request.getParameter("addr");
   String pnum = request.getParameter("pnum");
   System.out.println(memberid+"<-- memberid");
   System.out.println(password+"<-- password");
   System.out.println(pstmt + "<-- pstmt 2");
   
   Class.forName("com.mysql.jdbc.Driver");
   
   try {
      //DB 연결
      String jdbcDriver = "jdbc:mysql://localhost:3306/webdb?"+"useUnicode=true&characterEncoding=utf-8";
      String dbUser = "root";
      String dbPass = "019493";
            
      conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
      
      //update 문장
      pstmt = conn.prepareStatement("update membertbl set password=?, name=?, email=?, addr=?, pnum=? where memberid=?");
      pstmt.setString(1, password);
      pstmt.setString(2, name);
      pstmt.setString(3, email);
      pstmt.setString(4, addr);
      pstmt.setString(5, pnum);
      pstmt.setString(6, memberid);
      
      pstmt.executeUpdate();
	response.sendRedirect("member_all.jsp");
   } finally {
      if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
      if (conn != null) try { conn.close(); } catch(SQLException ex) {}
   }
%>