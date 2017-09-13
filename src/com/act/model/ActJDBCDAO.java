package com.act.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ActJDBCDAO implements ActDAO_interface{
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String userid="b0402015";
	String password="02015";
	
	private static final String INSERT_STMT ="insert into act values('A' || act_no_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT ="select * from act";
	private static final String GET_ONE_STMT="select * from act where ACT_NO=?";
	private static final String DELETE = "delete from act where act_no=?";
	private static final String UPDATE ="update act set MEM_AC=?,ORG_CONT=?,ACT_NAME=?,MIN_MEM=?,MAX_MEM=?,MEM_COUNT=?,ACT_OP_DATE=?,ACT_ED_DATE=?,DL_DATE=?,FD_DATE=?,ACT_ADD=?, ACT_ADD_LAT=?,ACT_ADD_LON=?,ACT_CONT=?,ACT_TAG=?,ACT_FEE=?,PAY_WAY=?,ACT_PIC1=?,ACT_PIC2=?,ACT_PIC3=?,ACT_STAT=?,RE_CONT=?,REVIEW_ED_DATE=?where act_no=?";
	
	
	
	@Override
	public void insert(Act_vo act_VO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
	
				con = DriverManager.getConnection(url, userid, password);
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
		
		} catch (ClassNotFoundException e) {
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
			Class.forName(driver);
			
				con = DriverManager.getConnection(url, userid, password);
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
			
		} catch (ClassNotFoundException e) {
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
			Class.forName(driver);
		
				con = DriverManager.getConnection(url, userid, password);
				pstmt=con.prepareStatement(DELETE);
				pstmt.setString(1, ACT_NO);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			
		} catch (ClassNotFoundException e) {
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
		Act_vo act_vo=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
		
				con = DriverManager.getConnection(url, userid, password);
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
	
		} catch (ClassNotFoundException e) {
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
		List<Act_vo> list=new ArrayList<Act_vo>();
		Act_vo act_vo=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			Class.forName(driver);
			
				con = DriverManager.getConnection(url, userid, password);
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
			
		} catch (ClassNotFoundException e) {
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
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
ActJDBCDAO dao=new ActJDBCDAO();

Act_vo act_vo1=new Act_vo();
	act_vo1.setMem_ac("starter4244");
	act_vo1.setOrg_cont("我是主辦人");
	act_vo1.setAct_name("我是活動");
	act_vo1.setMin_mem(6);
	act_vo1.setMax_mem(10);
	act_vo1.setMem_count(5);
	act_vo1.setAct_op_date(java.sql.Date.valueOf("2017-09-07"));
	act_vo1.setAct_ed_date(java.sql.Date.valueOf("2017-09-09"));
	act_vo1.setDl_date(java.sql.Date.valueOf("2017-09-02"));
	act_vo1.setFd_date(java.sql.Date.valueOf("2017-09-01"));
	act_vo1.setAct_add("台灣");
	act_vo1.setAct_add_lat("121.550537");
	act_vo1.setAct_add_lon("25.032904");
	act_vo1.setAct_cont("bababa~~");
	act_vo1.setAct_tag("隨便啦~");
	act_vo1.setAct_fee(0);
	act_vo1.setPay_way("不需繳費");
	byte[ ]pic1=getByteArray("C:\\Users\\Java\\Desktop\\專題照片\\act.jpg");
	act_vo1.setAct_pic1(pic1);
	act_vo1.setAct_pic2(null);
	act_vo1.setAct_pic3(null);
	act_vo1.setAct_stat("已審核");
	act_vo1.setRe_cont(null);
	act_vo1.setReview_ed_date(java.sql.Date.valueOf("2017-09-01"));
	dao.insert(act_vo1);
	
	Act_vo act_vo2=new Act_vo();
	act_vo2.setMem_ac("starter4244");
	act_vo2.setOrg_cont("我不是主辦人");
	act_vo2.setAct_name("我是活動");
	act_vo2.setMin_mem(6);
	act_vo2.setMax_mem(10);
	act_vo2.setMem_count(5);
	act_vo2.setAct_op_date(java.sql.Date.valueOf("2017-09-07"));
	act_vo2.setAct_ed_date(java.sql.Date.valueOf("2017-09-09"));
	act_vo2.setDl_date(java.sql.Date.valueOf("2017-09-02"));
	act_vo2.setFd_date(java.sql.Date.valueOf("2017-09-01"));
	act_vo2.setAct_add("台灣");
	act_vo2.setAct_add_lat("121.550537");
	act_vo2.setAct_add_lon("25.032904");
	act_vo2.setAct_cont("bababa~~");
	act_vo2.setAct_tag("隨便啦~");
	act_vo2.setAct_fee(0);
	act_vo2.setPay_way("不需繳費");
	byte[ ]pic2=getByteArray("C:\\Users\\Java\\Desktop\\專題照片\\act.jpg");
	act_vo2.setAct_pic1(pic2);
	act_vo2.setAct_pic2(null);
	act_vo2.setAct_pic3(null);
	act_vo2.setAct_stat("已審核");
	act_vo2.setRe_cont(null);
	act_vo2.setReview_ed_date(java.sql.Date.valueOf("2017-09-01"));
	act_vo2.setAct_no("A1000000012");
	dao.update(act_vo2);
	
	dao.delete("A1000000012");
	
Act_vo act_vo3=dao.findByPrimaryKey("A1000000005");
System.out.print(act_vo3.getMem_ac());
System.out.print(act_vo3.getOrg_cont());

	List<Act_vo>list=dao.getAll();
	for(Act_vo act_vo4:list){
		System.out.print(act_vo4.getMem_ac()+",");
		System.out.print(act_vo4.getOrg_cont()+",");
		System.out.println();
		
	}


	}
	
	public static byte[] getByteArray(String path) throws IOException{
		FileInputStream fis=new FileInputStream(new File(path));
		ByteArrayOutputStream baos=new ByteArrayOutputStream();
		int i;
		byte [] buffer=new byte [8193];
		if((i=fis.read(buffer))!=-1){
			baos.write(buffer,0,i);
		}
		return baos.toByteArray();
	}
	
}
