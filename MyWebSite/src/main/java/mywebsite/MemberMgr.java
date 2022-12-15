package mywebsite;

import java.sql.*;
import java.util.Vector;


public class MemberMgr {

    private DBConnectionMgr pool = null;

    public MemberMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }

    public boolean checkId(String memberid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select id from membertbl where id = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, memberid);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }

    public boolean memberInsert(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into membertbl(num, memberid, password, name, email, addr, pnum) values(?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getNum());
            pstmt.setString(2, regBean.getMemberid());
            pstmt.setString(3, regBean.getPassword());
            pstmt.setString(4, regBean.getName());
            pstmt.setString(5, regBean.getEmail());
            pstmt.setString(6, regBean.getAddr());
            pstmt.setString(7, regBean.getPnum());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public RegisterBean getMember(String memberid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RegisterBean regBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from membertbl where memberid=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, memberid);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                regBean = new RegisterBean();
                regBean.setNum(rs.getString("num"));
                regBean.setMemberid(rs.getString("memberid"));
                regBean.setPassword(rs.getString("password"));
                regBean.setName(rs.getString("name"));
                regBean.setEmail(rs.getString("email"));
                regBean.setAddr(rs.getString("addr"));
                regBean.setPnum(rs.getString("pnum"));
                regBean.setPsum(rs.getString("psum"));
                regBean.setGrade(rs.getString("grade"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return regBean;
    }

    public Vector getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from membertbl";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                RegisterBean regBean = new RegisterBean();
                regBean.setNum(rs.getString("num"));
                regBean.setMemberid(rs.getString("memberid"));
                regBean.setPassword(rs.getString("password"));
                regBean.setName(rs.getString("name"));
                regBean.setEmail(rs.getString("email"));
                regBean.setAddr(rs.getString("addr"));
                regBean.setPnum(rs.getString("pnum"));
                regBean.setPsum(rs.getString("psum"));
                regBean.setGrade(rs.getString("grade"));
                vecList.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }

    public boolean memberUpdate(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update membertbl set password=?, name=?,";
            strQuery = strQuery + " email=?, addr=?, pnum=?";
            strQuery = strQuery + " where memberid=? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getPassword());
            pstmt.setString(2, regBean.getName());
            pstmt.setString(3, regBean.getEmail());
            pstmt.setString(4, regBean.getAddr());
            pstmt.setString(5, regBean.getPnum());
            pstmt.setString(6, regBean.getMemberid());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public boolean loginCheck(String memberid, String password) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select memberid, password from membertbl where memberid = ? and password = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, memberid);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
   
	 public boolean memberDelete(String num) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        boolean result = false;

	        try {
	            conn = pool.getConnection();
	            String query = "delete from membertbl where num = ?";
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, num);
	            int count = pstmt.executeUpdate();
	            if (count == 1) result = true;
	        } catch (Exception ex) {
	            System.out.println("Exception :" + ex);
	        } finally {
	            pool.freeConnection(conn, pstmt);
	        }
	        return result;
	    }
	 
	 
    
}