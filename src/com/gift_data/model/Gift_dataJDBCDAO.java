package com.gift_data.model;

import java.util.*;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;


public class Gift_dataJDBCDAO implements Gift_dataDAO_interface{
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String userid="b0402015";
	String password="02015";
	
	private static final String INSERT_STMT ="insert into gift_data values('G' || gift_no_seq.nextval,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT ="select * from gift_data";
	private static final String GET_ONE_STMT="select * from gift_data where GIFT_NO=?";
	private static final String DELETE = "delete from gift_data where gift_no=?";
	private static final String UPDATE ="update gift_data set GIFT_NAME=?,GIFT_REMAIN=?,GIFT_CONT=?,GIFT_IMG=?,GIFT_PT=?,GIFT_LAUNCH_DATE=? where gift_no=?";
	

	@Override
	public void insert(Gift_dataVO gift_data_VO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			

			pstmt.setString(1,gift_data_VO.getGift_name());
			pstmt.setInt(2,gift_data_VO.getGift_remain());
			pstmt.setString(3,gift_data_VO.getGift_cont());
			byte[] pic=gift_data_VO.getGift_img();
			Blob blobpic=con.createBlob();
			
			
			pstmt.setBlob(4,blobpic);
			blobpic.setBytes(1, pic);
			pstmt.setInt(5,gift_data_VO.getGift_pt());
			pstmt.setDate(6,gift_data_VO.getGift_launch_date());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		
			
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
	public void update(Gift_dataVO gift_data_VO) {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			
				con = DriverManager.getConnection(url, userid, password);
				pstmt = con.prepareStatement(UPDATE);
				
				pstmt.setString(1,gift_data_VO.getGift_name());
				pstmt.setInt(2, gift_data_VO.getGift_remain());
				pstmt.setString(3, gift_data_VO.getGift_cont());
				byte[] img=gift_data_VO.getGift_img();
				Blob blobChange=con.createBlob();
				blobChange.setBytes(1,img);
				pstmt.setBlob(4,blobChange);
				pstmt.setInt(5,gift_data_VO.getGift_pt());
				pstmt.setDate(6,gift_data_VO.getGift_launch_date());
				pstmt.setString(7,gift_data_VO.getGift_no());
				pstmt.executeUpdate();
				con.commit();
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
	public void delete(String GIFT_NO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);

			pstmt=con.prepareStatement(DELETE);
			pstmt.setString(1,GIFT_NO);
			
			
			pstmt.executeUpdate();
		

			} catch (SQLException se) {
				
				if (con != null) {
					try {
						
						// 3●設定於當有exception發生時之catch區塊內
						con.rollback();
					} catch (SQLException excep) {
						throw new RuntimeException("rollback error occured. "
								+ excep.getMessage());
					}
				}
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
			} catch (ClassNotFoundException e) {
				
				throw new RuntimeException("Couldn't load database driver. "
						+ e.getMessage());
				// Handle any SQL errors
			}catch(Exception a){
				
				System.out.println("something wrong");
				a.printStackTrace();
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
	public Gift_dataVO findByPrimaryKey(String GIFT_NO) {
		// TODO Auto-generated method stub
		Gift_dataVO gift_data_vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, GIFT_NO);
			 rs=pstmt.executeQuery();
			 
			 while(rs.next()){
				 gift_data_vo=new Gift_dataVO();
				 gift_data_vo.setGift_no(rs.getString("GIFT_NO"));
				 gift_data_vo.setGift_name(rs.getString("GIFT_NAME"));
				 gift_data_vo.setGift_remain(rs.getInt("GIFT_REMAIN"));
				 gift_data_vo.setGift_cont(rs.getString("GIFT_CONT"));
				 gift_data_vo.setGift_img(rs.getBytes("GIFT_IMG"));
				 gift_data_vo.setGift_pt(rs.getInt("GIFT_PT"));
				 gift_data_vo.setGift_launch_date(rs.getDate("GIFT_LAUNCH_DATE"));
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
		return gift_data_vo;
		
	}

	@Override
	public List<Gift_dataVO> getAll() {
		// TODO Auto-generated method stub
		List<Gift_dataVO> list=new ArrayList<Gift_dataVO>();
		Gift_dataVO gift_data_vo=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			Class.forName(driver);
	
				con = DriverManager.getConnection(url, userid, password);
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					gift_data_vo=new Gift_dataVO();
					gift_data_vo.setGift_no(rs.getString("GIFT_NO"));
					gift_data_vo.setGift_name(rs.getString("GIFT_NAME"));
					gift_data_vo.setGift_remain(rs.getInt("GIFT_REMAIN"));
					gift_data_vo.setGift_cont(rs.getString("GIFT_CONT"));
					gift_data_vo.setGift_img(rs.getBytes("GIFT_IMG"));
					gift_data_vo.setGift_pt(rs.getInt("GIFT_PT"));
					gift_data_vo.setGift_launch_date(rs.getDate("GIFT_LAUNCH_DATE"));
					list.add(gift_data_vo);
					
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
	
		Gift_dataJDBCDAO dao=new Gift_dataJDBCDAO();
		
		Gift_dataVO gift_data_vo1=new Gift_dataVO();
		gift_data_vo1.setGift_name("鋼杯");
		gift_data_vo1.setGift_remain(100);
		gift_data_vo1.setGift_cont("當兵喝咖啡的好幫手");
		byte[ ]pic1=getByteArray("C:\\Users\\Java\\Desktop\\專題照片\\forcoffee.jpg");
		gift_data_vo1.setGift_img(pic1);
		gift_data_vo1.setGift_pt(5);
		gift_data_vo1.setGift_launch_date(java.sql.Date.valueOf("2017-09-07"));
		dao.insert(gift_data_vo1);
		System.out.println("ee");
		
		Gift_dataVO gift_data_vo2=new Gift_dataVO();
		gift_data_vo2.setGift_name("小小鋼杯");
		gift_data_vo2.setGift_remain(77);
		gift_data_vo2.setGift_cont("小鋼杯 大享受");
		byte[]pic2=getByteArray("C:\\Users\\Java\\Desktop\\專題照片\\a101.jpg");
		gift_data_vo2.setGift_img(pic2);
		gift_data_vo2.setGift_pt(5);
		gift_data_vo2.setGift_launch_date(java.sql.Date.valueOf("2017-04-01"));
		gift_data_vo2.setGift_no("G1000000006");
		dao.update(gift_data_vo2);
		
		dao.delete("G1000000007");
		
		
		Gift_dataVO gift_data_vo3=dao.findByPrimaryKey("G1000000005");
		System.out.println(gift_data_vo3.getGift_no());
		System.out.println(gift_data_vo3.getGift_name());
		System.out.println(gift_data_vo3.getGift_remain());
		System.out.println(gift_data_vo3.getGift_cont());
		System.out.println(gift_data_vo3.getGift_img());
		System.out.println(gift_data_vo3.getGift_pt());
		System.out.println(gift_data_vo3.getGift_launch_date());
		
		List<Gift_dataVO> list=dao.getAll();
		for(Gift_dataVO gift:list){
			System.out.print(gift.getGift_no()+",");
			System.out.print(gift.getGift_name()+",");
			System.out.print(gift.getGift_remain()+",");
			System.out.print(gift.getGift_cont()+",");
			System.out.print(gift.getGift_img()+",");
			System.out.print(gift.getGift_pt()+",");
			System.out.print(gift.getGift_launch_date()+",");
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
