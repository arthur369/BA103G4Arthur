package com.act.model;

import java.sql.Blob;
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

import com.ad.model.AdDAO_interface;
import com.ad.model.AdVO;

public class ActJNDIDAO implements ActDAO_interface{
	private static DataSource ds=null;
	static{
		Context ctx;
		try {
			ctx = new InitialContext();
			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}
	
	private static final String INSERT_STMT ="insert into act values('A' || act_no_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT ="select * from act";
	private static final String GET_ONE_STMT="select * from act where ACT_NO=?";
	private static final String DELETE = "delete from act where act_no=?";
	private static final String UPDATE ="update act set MEM_AC=?,ORG_CONT=?,ACT_NAME=?,MIN_MEM=?,MAX_MEM=?,MEM_COUNT=?,ACT_OP_DATE=?,ACT_ED_DATE=?,DL_DATE=?,FD_DATE=?,ACT_ADD=?, ACT_ADD_LAT=?,ACT_ADD_LON=?,ACT_CONT=?,ACT_TAG=?,ACT_FEE=?,PAY_WAY=?,ACT_PIC1=?,ACT_PIC2=?,ACT_PIC3=?,ACT_STAT=?,RE_CONT=?,REVIEW_ED_DATE=?where act_no=?";
	@Override
	public void insert(Act_vo act_VO) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1,act_VO.getMem_ac());
			pstmt.setString(2,act_VO.getOrg_cont());
			pstmt.setString(3,act_VO.getAct_name());
			pstmt.setInt(4,act_VO.getMin_mem());
			pstmt.setInt(5,act_VO.getMax_mem());
			pstmt.setInt(6,act_VO.getMem_count());
			pstmt.setDate(7,act_VO.getAct_op_date());
			pstmt.setDate(8,act_VO.getAct_ed_date());
			pstmt.setDate(9,act_VO.getDl_date());
			pstmt.setDate(10,act_VO.getFd_date());
			pstmt.setString(11,act_VO.getAct_add());
			pstmt.setString(12,act_VO.getAct_add_lat());
			pstmt.setString(13,act_VO.getAct_add_lon());
			pstmt.setString(14,act_VO.getAct_cont());
			pstmt.setString(15,act_VO.getAct_tag());
			pstmt.setInt(16,act_VO.getAct_fee());
			pstmt.setString(17,act_VO.getPay_way());
			byte[] pic1=act_VO.getAct_pic1();
			byte[] pic2=act_VO.getAct_pic2();
			byte[] pic3=act_VO.getAct_pic3();
			Blob blob1=con.createBlob();
			Blob blob2=con.createBlob();
			Blob blob3=con.createBlob();
			blob1.setBytes(1, pic1);
			blob2.setBytes(1, pic2);
			blob3.setBytes(1, pic3);
			pstmt.setBlob(18,blob1);
			pstmt.setBlob(19,blob2);
			pstmt.setBlob(20,blob3);
			pstmt.setString(21,act_VO.getAct_stat());
			pstmt.setString(22,act_VO.getRe_cont());
			pstmt.setDate(23,act_VO.getReview_ed_date());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
		}
		
		
		
		
	}
	@Override
	public void update(Act_vo act_VO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1,act_VO.getMem_ac());
			pstmt.setString(2,act_VO.getOrg_cont());
			pstmt.setString(3,act_VO.getAct_name());
			pstmt.setInt(4,act_VO.getMin_mem());
			pstmt.setInt(5,act_VO.getMax_mem());
			pstmt.setInt(6,act_VO.getMem_count());
			pstmt.setDate(7,act_VO.getAct_op_date());
			pstmt.setDate(8,act_VO.getAct_ed_date());
			pstmt.setDate(9,act_VO.getDl_date());
			pstmt.setDate(10,act_VO.getFd_date());
			pstmt.setString(11,act_VO.getAct_add());
			pstmt.setString(12,act_VO.getAct_add_lat());
			pstmt.setString(13,act_VO.getAct_add_lon());
			pstmt.setString(14,act_VO.getAct_cont());
			pstmt.setString(15,act_VO.getAct_tag());
			pstmt.setInt(16,act_VO.getAct_fee());
			pstmt.setString(17,act_VO.getPay_way());
			byte[] pic1=act_VO.getAct_pic1();
			byte[] pic2=act_VO.getAct_pic2();
			byte[] pic3=act_VO.getAct_pic3();
			Blob blob1=con.createBlob();
			Blob blob2=con.createBlob();
			Blob blob3=con.createBlob();
			blob1.setBytes(1, pic1);
			blob2.setBytes(1, pic2);
			blob3.setBytes(1, pic3);	
			pstmt.setBlob(18,blob1);
			pstmt.setBlob(19,blob2);
			pstmt.setBlob(20,blob3);
			pstmt.setString(21,act_VO.getAct_stat());
			pstmt.setString(22,act_VO.getRe_cont());
			pstmt.setDate(23,act_VO.getReview_ed_date());
			pstmt.setString(24,act_VO.getAct_no());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
		
		
	}
	@Override
	public void delete(String ACT_NO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt=con.prepareStatement(DELETE);
			pstmt.setString(1, ACT_NO);
			pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		
		
	}
	@Override
	public Act_vo findByPrimaryKey(String ACT_NO) {
		// TODO Auto-generated method stub
		Act_vo act_vo=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, ACT_NO);
			rs=pstmt.executeQuery();
		while(rs.next()){
			act_vo=new Act_vo();
			act_vo.setAct_no(rs.getString("ACT_NO"));
			act_vo.setMem_ac(rs.getString("MEM_AC"));
			act_vo.setOrg_cont(rs.getString("ORG_CONT"));
			act_vo.setAct_name(rs.getString("ACT_NAME"));
			act_vo.setMin_mem(rs.getInt("MIN_MEM"));
			act_vo.setMax_mem(rs.getInt("MAX_MEM"));
			act_vo.setMem_count(rs.getInt("MEM_COUNT"));
			act_vo.setAct_op_date(rs.getDate("ACT_OP_DATE"));
			act_vo.setAct_ed_date(rs.getDate("ACT_ED_DATE"));
			act_vo.setDl_date(rs.getDate("DL_DATE"));
			act_vo.setFd_date(rs.getDate("FD_DATE"));
			act_vo.setAct_add(rs.getString("ACT_ADD"));
			act_vo.setAct_add_lat(rs.getString("ACT_ADD_LAT"));
			act_vo.setAct_add_lon(rs.getString("ACT_ADD_LON"));
			act_vo.setAct_cont(rs.getString("ACT_CONT"));
			act_vo.setAct_tag(rs.getString("ACT_TAG"));
			act_vo.setAct_fee(rs.getInt("ACT_FEE"));
			act_vo.setPay_way(rs.getString("PAY_WAY"));
		
			act_vo.setAct_pic1(rs.getBytes("ACT_PIC1"));
			act_vo.setAct_pic2(rs.getBytes("ACT_PIC2"));
			act_vo.setAct_pic3(rs.getBytes("ACT_PIC3"));
			act_vo.setAct_stat(rs.getString("ACT_STAT"));
			act_vo.setRe_cont(rs.getString("RE_CONT"));
			act_vo.setReview_ed_date(rs.getDate("REVIEW_ED_DATE"));
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{

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
		return act_vo;
		
		
	}
	@Override
	public List<Act_vo> getAll() {
		// TODO Auto-generated method stub
		List<Act_vo> list=new ArrayList<Act_vo>();
		Act_vo act_vo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs=pstmt.executeQuery();
			while(rs.next()){
				act_vo=new Act_vo();
				act_vo.setAct_no(rs.getString("ACT_NO"));
				act_vo.setMem_ac(rs.getString("MEM_AC"));
				act_vo.setOrg_cont(rs.getString("ORG_CONT"));
				act_vo.setAct_name(rs.getString("ACT_NAME"));
				act_vo.setMin_mem(rs.getInt("MIN_MEM"));
				act_vo.setMax_mem(rs.getInt("MAX_MEM"));
				act_vo.setMem_count(rs.getInt("MEM_COUNT"));
				act_vo.setAct_op_date(rs.getDate("ACT_OP_DATE"));
				act_vo.setAct_ed_date(rs.getDate("ACT_ED_DATE"));
				act_vo.setDl_date(rs.getDate("DL_DATE"));
				act_vo.setFd_date(rs.getDate("FD_DATE"));
				act_vo.setAct_add(rs.getString("ACT_ADD"));
				act_vo.setAct_add_lat(rs.getString("ACT_ADD_LAT"));
				act_vo.setAct_add_lon(rs.getString("ACT_ADD_LON"));
				act_vo.setAct_cont(rs.getString("ACT_CONT"));
				act_vo.setAct_tag(rs.getString("ACT_TAG"));
				act_vo.setAct_fee(rs.getInt("ACT_FEE"));
				act_vo.setPay_way(rs.getString("PAY_WAY"));
			
				act_vo.setAct_pic1(rs.getBytes("ACT_PIC1"));
				act_vo.setAct_pic2(rs.getBytes("ACT_PIC2"));
				act_vo.setAct_pic3(rs.getBytes("ACT_PIC3"));
				act_vo.setAct_stat(rs.getString("ACT_STAT"));
				act_vo.setRe_cont(rs.getString("RE_CONT"));
				act_vo.setReview_ed_date(rs.getDate("REVIEW_ED_DATE"));
				
				list.add(act_vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
