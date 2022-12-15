<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
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
<form action="<%= request.getContextPath() %>/admin/member_select.jsp" method="post">
		<table>
			<tr>
				<td>
				<select name="sk">
					<option value="memberid">아이디</option>
					<option value="name">이름</option>
				</select>
				</td>
				<td><input type="text" name="sv" size=100 style="padding:5px"></td>
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
</form>
	<table id="meminfo">
		<tr>
			<th style="width:50px;">일련번호</th>
			<th style="width:100px;">아이디</th>
			<th style="width:100px;">비밀번호</th>
			<th style="width:100px;">이름</th>
			<th style="width:150px;">이메일</th>
			<th style="width:250px;">주소</th>
			<th style="width:150px;">전화번호</th>
			<th style="width:80px;">누적구매금액</th>
			<th style="width:60px;">등급</th>
			<th style="width:100px;">기능</th>
		</tr>
	
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	String sk = request.getParameter("sk");
	String sv = request.getParameter("sv");
	System.out.println(sk+"<--sk");
	System.out.println(sv+"<--sv");
	String sql = "select * from membertbl";
	
	try {
		//DB 연결
		String jdbcDriver = "jdbc:mysql://localhost:3306/webdb?"+"useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPass = "019493";
			   
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn+"<--conn");
	   
		//select 문장
		//sk, sv 둘 다 null인 상황
		if(sk==null & sv==null){
			//System.out.println("01 sk null, sv null인 조건");
			pstmt = conn.prepareStatement(sql);
		} else if(sk!=null & sv.equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/member_all.jsp");
			//System.out.println("02 sk 값 0, sv 공백 조건");
			pstmt = conn.prepareStatement(sql);
		} else if(sk!=null & sv!=null) {
			//System.out.println("03 sk, sv 둘 다 값 0");
			pstmt = conn.prepareStatement(sql + " WHERE "+ sk + " = ?");
			pstmt.setString(1,sv);
		}
		//out.println(pstmt+"<-- pstmt");
		rs = pstmt.executeQuery();
		System.out.println(rs+"<--rs");
		while(rs.next()) {
%>
		<tr>
			<td><%= rs.getString("num") %></td>
			<td><%= rs.getString("memberid") %></td>
			<td><%= rs.getString("password") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("email") %></td>
			<td><%= rs.getString("addr") %></td>
			<td><%= rs.getString("pnum") %></td>
			<td></td>
			<td></td>
			<td><a href="<%= request.getContextPath() %>/admin/member_update_form.jsp?send_id=<%= rs.getString("memberid")%>"><input type="button" value="수정" style="font-size:11px;"></a>
				<a href="<%= request.getContextPath() %>/admin/member_delete.jsp?send_id=<%= rs.getString("num")%>"><input type="button" value="삭제" style="font-size:11px;" ></a></td>
		</tr>
<%

		}
		}catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		}
%>
</table>
</body>
</html>