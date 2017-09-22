package com.prod.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProdJNDIDAO implements ProdDAO_interface {
	
	private static DataSource ds = null;
	static { 	
		try {	
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA103G4DB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO PROD VALUES "
			+ "('P'||prod_seq.NEXTVAL, ?, ?, ?, ?"
			+ ", ?, ?, ?, ?, ?"
			+ ", ?, ?, ?, ?, ?"
			+ ", ?, ?, ?, ?, ?"
			+ ", ?, ?, ?, ?, ?"
			+ ", ?, ?, ?)";
	private static final String UPDATE = "UPDATE PROD SET "
			+ "STORE_NO =?," 
			+ "PROD_NAME =?," 
			+ "BEAN_TYPE =?," 
			+ "BEAN_GRADE =?," 
			+ "BEAN_CONTRY =?," 
			+ "BEAN_REGION =?," 
			+ "BEAN_FARM =?," 
			+ "BEAN_FARMER =?," 
			+ "BEAN_EL =?," 
			+ "PROC =?," 
			+ "ROAST =?," 
			+ "BEAN_ATTR_ACID =?," 
			+ "BEAN_ATTR_AROMA =?," 
			+ "BEAN_ATTR_BODY =?," 
			+ "BEAN_ATTR_AFTER =?," 
			+ "BEAN_ATTR_BAL =?," 
			+ "BEAN_AROMA =?," 
			+ "PROD_PRICE =?," 
			+ "PROD_WT =?," 
			+ "SEND_FEE =?," 
			+ "PROD_SUP =?," 
			+ "PROD_CONT =?," 
			+ "PROD_PIC1 =?," 
			+ "PROD_PIC2 =?," 
			+ "PROD_PIC3 =?," 
			+ "PROD_STAT =?," 
			+ "ED_TIME =?"
			+ "WHERE PROD_NO =?";
	
	private static final String DELETE = "DELETE FROM PROD WHERE PROD_NO = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM PROD";
	private static final String GET_ONE_STMT = "SELECT * FROM PROD WHERE PROD_NO = ?"; 
	private static final String GET_ALL_NO_IMG_STMT = "SELECT  "
			+ "PROD_NO,"
			+ "STORE_NO," 
			+ "PROD_NAME," 
			+ "BEAN_TYPE," 
			+ "BEAN_GRADE," 
			+ "BEAN_CONTRY," 
			+ "BEAN_REGION," 
			+ "BEAN_FARM," 
			+ "BEAN_FARMER," 
			+ "BEAN_EL," 
			+ "PROC," 
			+ "ROAST," 
			+ "BEAN_ATTR_ACID," 
			+ "BEAN_ATTR_AROMA," 
			+ "BEAN_ATTR_BODY," 
			+ "BEAN_ATTR_AFTER," 
			+ "BEAN_ATTR_BAL," 
			+ "BEAN_AROMA," 
			+ "PROD_PRICE," 
			+ "PROD_WT," 
			+ "SEND_FEE," 
			+ "PROD_SUP," 
			+ "PROD_CONT,"
			+ "PROD_STAT," 
			+ "ED_TIME "
			+ "FROM PROD";
	
	private static final String GET_IMG_BY_PK_STMT = "SELECT PROD_PIC1,PROD_PIC2,PROD_PIC3 FROM PROD WHERE PROD_NO = ?"; 
	private static final String GET_QUERY_RESULT = "SELECT * FROM PROD WHERE BEAN_CONTRY LIKE ? AND PROC LIKE ? AND ROAST LIKE ? AND PROD_NAME LIKE ?";
	
	
	@Override
	public void insert(ProdVO prodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
				
		try {		
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, prodVO.getStore_no());
			pstmt.setString(2, prodVO.getProd_name());
			pstmt.setString(3, prodVO.getBean_type());
			pstmt.setString(4, prodVO.getBean_grade());
			pstmt.setString(5, prodVO.getBean_contry());
			pstmt.setString(6, prodVO.getBean_region());
			pstmt.setString(7, prodVO.getBean_farm());
			pstmt.setString(8, prodVO.getBean_farmer());
			pstmt.setInt(9, prodVO.getBean_el());
			pstmt.setString(10, prodVO.getProc());
			pstmt.setString(11, prodVO.getRoast());
			pstmt.setInt(12, prodVO.getBean_attr_acid());
			pstmt.setInt(13, prodVO.getBean_attr_aroma());
			pstmt.setInt(14, prodVO.getBean_attr_body());
			pstmt.setInt(15, prodVO.getBean_attr_after());
			pstmt.setInt(16, prodVO.getBean_attr_bal());
			pstmt.setString(17, prodVO.getBean_aroma());
			pstmt.setInt(18, prodVO.getProd_price());
			pstmt.setInt(19, prodVO.getProd_wt());
			pstmt.setInt(20, prodVO.getSend_fee());
			pstmt.setInt(21, prodVO.getProd_sup());
			pstmt.setString(22, prodVO.getProd_cont());
			pstmt.setBytes(23, prodVO.getProd_pic1());
			pstmt.setBytes(23, prodVO.getProd_pic2());
			pstmt.setBytes(23, prodVO.getProd_pic3());
			pstmt.setString(26, prodVO.getProd_stat());
			pstmt.setDate(27, prodVO.getEd_time());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally{
			if (pstmt != null) {
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}

	@Override
	public void update(ProdVO prodVO) {
		Connection con = null;
		PreparedStatement pstmt = null;	
		
		try {		
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, prodVO.getStore_no());
			pstmt.setString(2, prodVO.getProd_name());
			pstmt.setString(3, prodVO.getBean_type());
			pstmt.setString(4, prodVO.getBean_grade());
			pstmt.setString(5, prodVO.getBean_contry());
			pstmt.setString(6, prodVO.getBean_region());
			pstmt.setString(7, prodVO.getBean_farm());
			pstmt.setString(8, prodVO.getBean_farmer());
			pstmt.setInt(9, prodVO.getBean_el());
			pstmt.setString(10, prodVO.getProc());
			pstmt.setString(11, prodVO.getRoast());
			pstmt.setInt(12, prodVO.getBean_attr_acid());
			pstmt.setInt(13, prodVO.getBean_attr_aroma());
			pstmt.setInt(14, prodVO.getBean_attr_body());
			pstmt.setInt(15, prodVO.getBean_attr_after());
			pstmt.setInt(16, prodVO.getBean_attr_bal());
			pstmt.setString(17, prodVO.getBean_aroma());
			pstmt.setInt(18, prodVO.getProd_price());
			pstmt.setInt(19, prodVO.getProd_wt());
			pstmt.setInt(20, prodVO.getSend_fee());
			pstmt.setInt(21, prodVO.getProd_sup());
			pstmt.setString(22, prodVO.getProd_cont());
			pstmt.setBytes(23, prodVO.getProd_pic1());
			pstmt.setBytes(23, prodVO.getProd_pic2());
			pstmt.setBytes(23, prodVO.getProd_pic3());
			pstmt.setString(26, prodVO.getProd_stat());
			pstmt.setDate(27, prodVO.getEd_time());
			pstmt.setString(28, prodVO.getProd_no());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
			
		} finally{
			if (pstmt != null) {
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
	}
	

	@Override
	public void delete(String prod_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, prod_no);
			pstmt.executeUpdate();
			
			con.commit();
			con.setAutoCommit(true);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if(con != null){
				try {
					con.rollback();
				} catch (SQLException exc){
					throw new RuntimeException("rollback error occured"
							+ exc.getMessage());
				}
			}
			throw new RuntimeException("A database error occured ."
					+ e.getMessage());
		} finally{
			if(pstmt != null){
				try{
					pstmt.close();
				}
				catch(SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		
	}

	@Override
	public ProdVO findByPrimaryKey(String prod_no) {
		ProdVO prodVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, prod_no);
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				prodVO = new ProdVO();
				prodVO.setProd_no(rs.getString("prod_no"));
				prodVO.setStore_no(rs.getString("store_no"));
				prodVO.setProd_name(rs.getString("prod_name"));
				prodVO.setBean_type(rs.getString("bean_type"));
				prodVO.setBean_grade(rs.getString("bean_grade"));
				prodVO.setBean_contry(rs.getString("bean_contry"));
				prodVO.setBean_region(rs.getString("bean_region"));
				prodVO.setBean_farm(rs.getString("bean_farm"));
				prodVO.setBean_farmer(rs.getString("bean_farmer"));
				prodVO.setBean_el(rs.getInt("bean_el"));
				prodVO.setProc(rs.getString("proc"));
				prodVO.setRoast(rs.getString("roast"));
				prodVO.setBean_attr_acid(rs.getInt("bean_attr_acid"));
				prodVO.setBean_attr_aroma(rs.getInt("bean_attr_aroma"));
				prodVO.setBean_attr_body(rs.getInt("bean_attr_body"));
				prodVO.setBean_attr_after(rs.getInt("bean_attr_after"));
				prodVO.setBean_attr_bal(rs.getInt("bean_attr_bal"));
				prodVO.setBean_aroma(rs.getString("Bean_aroma"));
				prodVO.setProd_price(rs.getInt("prod_price"));
				prodVO.setProd_wt(rs.getInt("prod_wt"));
				prodVO.setSend_fee(rs.getInt("send_fee"));
				prodVO.setProd_sup(rs.getInt("prod_sup"));
				prodVO.setProd_cont(rs.getString("prod_cont"));
				prodVO.setProd_pic1(rs.getBytes("prod_pic1"));
				prodVO.setProd_pic2(rs.getBytes("prod_pic2"));
				prodVO.setProd_pic3(rs.getBytes("prod_pic3"));
				prodVO.setProd_stat(rs.getString("prod_stat"));
				prodVO.setEd_time(rs.getDate("ed_time"));
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return prodVO;
	}

	@Override
	public List<ProdVO> getAll() {
		List<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO prodVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				prodVO = new ProdVO();
				prodVO.setStore_no(rs.getString("store_no"));
				prodVO.setProd_name(rs.getString("prod_name"));
				prodVO.setBean_type(rs.getString("bean_type"));
				prodVO.setBean_grade(rs.getString("bean_grade"));
				prodVO.setBean_contry(rs.getString("bean_contry"));
				prodVO.setBean_region(rs.getString("bean_region"));
				prodVO.setBean_farm(rs.getString("bean_farm"));
				prodVO.setBean_farmer(rs.getString("bean_farmer"));
				prodVO.setBean_el(rs.getInt("bean_el"));
				prodVO.setProc(rs.getString("proc"));
				prodVO.setRoast(rs.getString("roast"));
				prodVO.setBean_attr_acid(rs.getInt("bean_attr_acid"));
				prodVO.setBean_attr_aroma(rs.getInt("bean_attr_aroma"));
				prodVO.setBean_attr_body(rs.getInt("bean_attr_body"));
				prodVO.setBean_attr_after(rs.getInt("bean_attr_after"));
				prodVO.setBean_attr_bal(rs.getInt("bean_attr_bal"));
				prodVO.setBean_aroma(rs.getString("Bean_aroma"));
				prodVO.setProd_price(rs.getInt("prod_price"));
				prodVO.setProd_wt(rs.getInt("prod_wt"));
				prodVO.setSend_fee(rs.getInt("send_fee"));
				prodVO.setProd_sup(rs.getInt("prod_sup"));
				prodVO.setProd_cont(rs.getString("prod_cont"));
				prodVO.setProd_pic1(rs.getBytes("prod_pic1"));
				prodVO.setProd_pic2(rs.getBytes("prod_pic2"));
				prodVO.setProd_pic3(rs.getBytes("prod_pic3"));
				prodVO.setProd_stat(rs.getString("prod_stat"));
				prodVO.setEd_time(rs.getDate("ed_time"));
				list.add(prodVO);
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	@Override
	public List<ProdVO> getAllNoImg() {
		List<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO prodVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_NO_IMG_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				prodVO = new ProdVO();
				prodVO.setProd_no(rs.getString("prod_no"));
				prodVO.setStore_no(rs.getString("store_no"));
				prodVO.setProd_name(rs.getString("prod_name"));
				prodVO.setBean_type(rs.getString("bean_type"));
				prodVO.setBean_grade(rs.getString("bean_grade"));
				prodVO.setBean_contry(rs.getString("bean_contry"));
				prodVO.setBean_region(rs.getString("bean_region"));
				prodVO.setBean_farm(rs.getString("bean_farm"));
				prodVO.setBean_farmer(rs.getString("bean_farmer"));
				prodVO.setBean_el(rs.getInt("bean_el"));
				prodVO.setProc(rs.getString("proc"));
				prodVO.setRoast(rs.getString("roast"));
				prodVO.setBean_attr_acid(rs.getInt("bean_attr_acid"));
				prodVO.setBean_attr_aroma(rs.getInt("bean_attr_aroma"));
				prodVO.setBean_attr_body(rs.getInt("bean_attr_body"));
				prodVO.setBean_attr_after(rs.getInt("bean_attr_after"));
				prodVO.setBean_attr_bal(rs.getInt("bean_attr_bal"));
				prodVO.setBean_aroma(rs.getString("Bean_aroma"));
				prodVO.setProd_price(rs.getInt("prod_price"));
				prodVO.setProd_wt(rs.getInt("prod_wt"));
				prodVO.setSend_fee(rs.getInt("send_fee"));
				prodVO.setProd_sup(rs.getInt("prod_sup"));
				prodVO.setProd_cont(rs.getString("prod_cont"));
				prodVO.setProd_stat(rs.getString("prod_stat"));
				prodVO.setEd_time(rs.getDate("ed_time"));
				list.add(prodVO);
			}
			
		}  catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<byte[]> getImageByPK(String prod_no) {
		List<byte[]> prodImgList = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_IMG_BY_PK_STMT);
			pstmt.setString(1, prod_no);
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				prodImgList = new ArrayList<byte[]>();
				prodImgList.add(rs.getBytes(1));
				prodImgList.add(rs.getBytes(2));
				prodImgList.add(rs.getBytes(3));
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return prodImgList;
	}
	
	@Override
	public List<ProdVO> getQueryResult(String bean_contry, String proc, String roast, String prod_name) {
		List<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO prodVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_QUERY_RESULT);
			pstmt.setString(1, bean_contry);
			pstmt.setString(2, proc);
			pstmt.setString(3, roast);
			pstmt.setString(4, prod_name);
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				prodVO = new ProdVO();
				prodVO.setProd_no(rs.getString("prod_no"));
				prodVO.setStore_no(rs.getString("store_no"));
				prodVO.setProd_name(rs.getString("prod_name"));
				prodVO.setBean_type(rs.getString("bean_type"));
				prodVO.setBean_grade(rs.getString("bean_grade"));
				prodVO.setBean_contry(rs.getString("bean_contry"));
				prodVO.setBean_region(rs.getString("bean_region"));
				prodVO.setBean_farm(rs.getString("bean_farm"));
				prodVO.setBean_farmer(rs.getString("bean_farmer"));
				prodVO.setBean_el(rs.getInt("bean_el"));
				prodVO.setProc(rs.getString("proc"));
				prodVO.setRoast(rs.getString("roast"));
				prodVO.setBean_attr_acid(rs.getInt("bean_attr_acid"));
				prodVO.setBean_attr_aroma(rs.getInt("bean_attr_aroma"));
				prodVO.setBean_attr_body(rs.getInt("bean_attr_body"));
				prodVO.setBean_attr_after(rs.getInt("bean_attr_after"));
				prodVO.setBean_attr_bal(rs.getInt("bean_attr_bal"));
				prodVO.setBean_aroma(rs.getString("Bean_aroma"));
				prodVO.setProd_price(rs.getInt("prod_price"));
				prodVO.setProd_wt(rs.getInt("prod_wt"));
				prodVO.setSend_fee(rs.getInt("send_fee"));
				prodVO.setProd_sup(rs.getInt("prod_sup"));
				prodVO.setProd_cont(rs.getString("prod_cont"));
//				prodVO.setProd_pic1(rs.getBytes("prod_pic1"));
//				prodVO.setProd_pic2(rs.getBytes("prod_pic2"));
//				prodVO.setProd_pic3(rs.getBytes("prod_pic3"));
				prodVO.setProd_stat(rs.getString("prod_stat"));
				prodVO.setEd_time(rs.getDate("ed_time"));
				list.add(prodVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	

}
