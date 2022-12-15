package mywebsite;
import java.sql.*;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mywebsite.DBConnectionMgr;
import mywebsite.ProductBean;

public class ProductMgr {
	private DBConnectionMgr pool = null;
	
	public ProductMgr() {
		try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
	}
	
	public boolean insertProduct(HttpServletRequest req) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			String uploadDir =this.getClass().getResource("").getPath();
			uploadDir =      uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"MyWebSite/src/main/webapp/data";
			MultipartRequest multi = new MultipartRequest(req, uploadDir, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			 
			conn = pool.getConnection();
			String sql = "insert into post (no, category, name, price, detail, stock, date, image) values (?, ?, ?, ?, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("no"));
		    pstmt.setString(2, multi.getParameter("category"));
		    pstmt.setString(3, multi.getParameter("name"));
		    pstmt.setString(4, multi.getParameter("price"));
		    pstmt.setString(5, multi.getParameter("detail"));
		    pstmt.setString(6, multi.getParameter("stock"));
		    
		    if (multi.getFilesystemName("image") == null) {
		          pstmt.setString(7, "ready.gif");
		    } else {
		    		pstmt.setString(7, multi.getFilesystemName("image"));
		    }
		    int count = pstmt.executeUpdate();
		    if(count == 1) result = true;
			
		} catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(conn, pstmt);
        }
		return result;
	}
	
	
	
	public ProductBean getProduct(String no) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductBean product = null;
        
        try {
            conn = pool.getConnection();
            String sql = "select * from post where no=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setCategory(rs.getString("category"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(conn, pstmt, rs);
        }
        return product;
	}
	
	public boolean updateProduct(HttpServletRequest req) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir =this.getClass().getResource("").getPath();
    	uploadDir =      uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"MyWebSite/src/main/webapp/data";

        try {
            conn = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            //update 문장
            // image를 수정하지않을경우
            if (multi.getFilesystemName("image") == null) {
                String query = "update post set name = ?, price = ?, detail = ?, stock = ?  where no = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getParameter("no"));
            } else { //image 또한 수정할 경우
                String query = "update post set name =? ,price = ?, detail = ?,stock = ?, image = ?  where no = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getFilesystemName("image"));
                pstmt.setString(6, multi.getParameter("no"));
            }
            
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
            
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(conn, pstmt);
        }
        return result;
    }
	
	 public Vector getProductList() throws SQLException {
	        Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        Vector vProduct = new Vector();

	        try {
	            conn = pool.getConnection();
	            String sql = "select * from post order by no desc";
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                ProductBean product = new ProductBean();
	                product.setNo(rs.getInt("no"));
	                product.setCategory(rs.getString("category"));
	                product.setName(rs.getString("name"));
	                product.setPrice(rs.getString("price"));
	                product.setDetail(rs.getString("detail"));
	                product.setDate(rs.getString("date"));
	                product.setStock(rs.getString("stock"));
	                product.setImage(rs.getString("image"));
	                vProduct.add(product);
	            }
	        } catch (Exception ex) {
	            System.out.println("Exception :" + ex);
	        } finally {
	            pool.freeConnection(conn, stmt, rs);
	        }
	        return vProduct;
	    }
	 
	 //man 카테고리 상품 진열
	 public Vector getProductListMan() throws SQLException {
	        Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        Vector vProduct = new Vector();

	        try {
	            conn = pool.getConnection();
	            String sql = "select * from post where category = 'man'";
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                ProductBean product = new ProductBean();
	                product.setNo(rs.getInt("no"));
	                product.setCategory(rs.getString("category"));
	                product.setName(rs.getString("name"));
	                product.setPrice(rs.getString("price"));
	                product.setDetail(rs.getString("detail"));
	                product.setDate(rs.getString("date"));
	                product.setStock(rs.getString("stock"));
	                product.setImage(rs.getString("image"));
	                vProduct.add(product);
	            }
	        } catch (Exception ex) {
	            System.out.println("Exception :" + ex);
	        } finally {
	            pool.freeConnection(conn, stmt, rs);
	        }
	        return vProduct;
	    }
	
	//woman 카테고리 상품 진열
	 public Vector getProductListWoMan() throws SQLException {
	        Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        Vector vProduct = new Vector();

	        try {
	            conn = pool.getConnection();
	            String sql = "select * from post where category = 'woman'";
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                ProductBean product = new ProductBean();
	                product.setNo(rs.getInt("no"));
	                product.setCategory(rs.getString("category"));
	                product.setName(rs.getString("name"));
	                product.setPrice(rs.getString("price"));
	                product.setDetail(rs.getString("detail"));
	                product.setDate(rs.getString("date"));
	                product.setStock(rs.getString("stock"));
	                product.setImage(rs.getString("image"));
	                vProduct.add(product);
	            }
	        } catch (Exception ex) {
	            System.out.println("Exception :" + ex);
	        } finally {
	            pool.freeConnection(conn, stmt, rs);
	        }
	        return vProduct;
	    }
	 
	 //게시물 삭제
	 public boolean deleteProduct(String no) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        boolean result = false;

	        try {
	            conn = pool.getConnection();
	            String query = "delete from post where no = ?";
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, no);
	            int count = pstmt.executeUpdate();
	            if (count == 1) result = true;
	        } catch (Exception ex) {
	            System.out.println("Exception :" + ex);
	        } finally {
	            pool.freeConnection(conn, pstmt);
	        }
	        return result;
	    }
	 
	 // index new items
	 public Vector getNewProductList() throws SQLException {
	        Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        Vector vProduct = new Vector();

	        try {
	            conn = pool.getConnection();
	            String sql = "select * from post order by date DESC LIMIT 3";
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                ProductBean product = new ProductBean();
	                product.setNo(rs.getInt("no"));
	                product.setCategory(rs.getString("category"));
	                product.setName(rs.getString("name"));
	                product.setPrice(rs.getString("price"));
	                product.setDetail(rs.getString("detail"));
	                product.setDate(rs.getString("date"));
	                product.setStock(rs.getString("stock"));
	                product.setImage(rs.getString("image"));
	                vProduct.add(product);
	            }
	        } catch (Exception ex) {
	            System.out.println("Exception :" + ex);
	        } finally {
	            pool.freeConnection(conn, stmt, rs);
	        }
	        return vProduct;
	    }
	 
	// index best items
	 public Vector getBestProductList() throws SQLException {
	        Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;
	        Vector vProduct = new Vector();

	        try {
	            conn = pool.getConnection();
	            String sql = "select * from post order by stock ASC LIMIT 4";
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                ProductBean product = new ProductBean();
	                product.setNo(rs.getInt("no"));
	                product.setCategory(rs.getString("category"));
	                product.setName(rs.getString("name"));
	                product.setPrice(rs.getString("price"));
	                product.setDetail(rs.getString("detail"));
	                product.setDate(rs.getString("date"));
	                product.setStock(rs.getString("stock"));
	                product.setImage(rs.getString("image"));
	                vProduct.add(product);
	            }
	        } catch (Exception ex) {
	            System.out.println("Exception :" + ex);
	        } finally {
	            pool.freeConnection(conn, stmt, rs);
	        }
	        return vProduct;
	    }
}
