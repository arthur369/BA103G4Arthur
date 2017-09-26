package com.act_management.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.act.model.ActService;
import com.act.model.ActVO;
import com.act_comm.model.Act_commService;
import com.act_comm.model.Act_commVO;
import com.convert_gift.model.Convert_giftService;
import com.convert_gift.model.Convert_giftVO;
import com.gift_data.model.Gift_dataJDBCDAO;
import com.gift_data.model.Gift_dataJNDIDAO;
import com.gift_data.model.Gift_dataService;
import com.gift_data.model.Gift_dataVO;
import com.google.gson.Gson;
import com.mem.model.MemService;
import com.mem.model.MemVO;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 500 * 1024 * 1024, maxRequestSize = 500* 5 * 1024 * 1024)
public class Act_managementServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException{
		req.setCharacterEncoding("UTF-8");
		
		String action = req.getParameter("action");
		
		if("start_act_to_pg2".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			  req.setAttribute("errorMsgs", errorMsgs);
			try{
				String act_name= req.getParameter("act_name");
				if(act_name.length()==0){
					  errorMsgs.add("請輸入活動名稱");
				}
				String act_add=req.getParameter("act_add");
				if(act_add.length()==0){
					errorMsgs.add("請輸入活動地點");
				}
				
				Integer act_fee=null;
				try{
				 act_fee=new Integer(req.getParameter("act_fee"));
				}catch(NumberFormatException e){
					act_fee=0;
					errorMsgs.add("價格請填數字");
				}
			String act_tag=req.getParameter("act_tag");
			if(act_tag.length()==0){
				errorMsgs.add("請輸入活動標籤");
			}
		Integer min_mem=null;
		try{
			min_mem=new Integer(req.getParameter("min_mem"));
		}catch(NumberFormatException e){
			min_mem=0;
			errorMsgs.add("最低參加人數請填數字");
		}
			if(min_mem==0){
				errorMsgs.add("請輸入最低參加人數");
			}
		Integer max_mem=null;
		try{
			max_mem=new Integer(req.getParameter("max_mem"));
		}catch(NumberFormatException e){
			max_mem=0;
			errorMsgs.add("最高參加人數請填數字");
		}	
		if(max_mem==0){
			errorMsgs.add("請輸入最高參加人數");
		}
		if(min_mem>max_mem || min_mem==max_mem){
			errorMsgs.add("最高人數須大於最低人數");
		}
		
		
		java.sql.Timestamp timestamp_dl_date;
		java.sql.Date dl_date;
		try{		
			timestamp_dl_date=java.sql.Timestamp.valueOf(req.getParameter("dl_date"));
			dl_date=timestampToDate(timestamp_dl_date);
		}catch(IllegalArgumentException e){
			timestamp_dl_date=new java.sql.Timestamp(System.currentTimeMillis());
			dl_date=timestampToDate(timestamp_dl_date);
			errorMsgs.add("請輸入截止日期!");
		}
		
		String pay_way=req.getParameter("pay_way");
		if(pay_way==null){
			errorMsgs.add("請選擇繳費方式");
		}
		
		ActVO act_vo=new ActVO();
		act_vo.setAct_name(act_name);
		act_vo.setAct_add(act_add);
		act_vo.setAct_fee(act_fee);
		act_vo.setAct_tag(act_tag);
		act_vo.setMin_mem(min_mem);
		act_vo.setMax_mem(max_mem);
		act_vo.setDl_date(dl_date);
		act_vo.setPay_way(pay_way);
		HttpSession session=req.getSession();
		System.out.println(dateToTimestamp(dl_date));	
		session.setAttribute("dl_date",dateToTimestamp(dl_date));
		session.setAttribute("act_vo",act_vo);
		if (!errorMsgs.isEmpty()) {
		
			String url=req.getParameter("start_act.jsp");
			RequestDispatcher failureView = req
					.getRequestDispatcher(url);
			failureView.forward(req, res);
			return;
		}
		
		String url="/FrontEnd/act/start_act2.jsp";
		RequestDispatcher successView=req.getRequestDispatcher(url);
		successView.forward(req, res);
		
			}catch(Exception e){
				String url=req.getParameter("start_act.jsp");
				errorMsgs.add(e.getMessage());
				errorMsgs.add("系統錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher(url);
				failureView.forward(req, res);
			}
			
			
			
		}
		
		
		
		if("sort".equals(action)){
			String url=req.getParameter("act.jsp");
			try{
				String sort=req.getParameter("sort");
				ActService actSvc=new ActService();
				List<ActVO> list=   actSvc.getSort(sort);
				HttpSession session=req.getSession();
				session.setAttribute("add_date_query", list);
				RequestDispatcher dispatcher=req.getRequestDispatcher(url);
				dispatcher.forward(req, res);
				
				
				
			}catch(Exception e){
				RequestDispatcher dispatcher=req.getRequestDispatcher(url);
				dispatcher.forward(req, res);
			}
			
			
		}
		
		
		
		
		
		
		if ("add_date_query".equals(action)) {
		
			
		String url=req.getParameter("act.jsp");
		try{
			Map<String,String[]>map= req.getParameterMap();
			String act_add=req.getParameter("act_add");
			String act_op_date=req.getParameter("act_op_date");
			String act_ed_date=req.getParameter("act_ed_date");
			req.setAttribute("act_add",act_add);
			req.setAttribute("act_op_date",act_op_date);
			req.setAttribute("act_ed_date", act_ed_date);
		
		
		
			
			
			ActService actSvc=new ActService();
			List<ActVO> list=actSvc.getAll(map);
			HttpSession session=req.getSession();
		
			session.setAttribute("add_date_query", list);
			
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listEmps_ByCompositeQuery.jsp
			
			successView.forward(req, res);
		}catch(Exception e){
			
			RequestDispatcher errorView = req.getRequestDispatcher(url); // 成功轉交listEmps_ByCompositeQuery.jsp
			errorView.forward(req, res);
			
		}
		}
		
		if ("goto_act_detail".equals(action)) {
			try{
		String act_no=req.getParameter("act_no");
		System.out.println("act_no= "+act_no);
		ActService actSvc=new ActService();
		ActVO act_vo= actSvc.getOneAct(act_no);
		String mem_ac=act_vo.getMem_ac();
		System.out.println("mem_ac= "+mem_ac);
		MemService memSvc=new MemService();
		System.out.println("track1");
		MemVO mem_vo= memSvc.getOneProd(mem_ac);
	
		Set<Act_commVO> act_comm_set= actSvc.getAct_commByAct_no(act_no);
		
		
		
		System.out.println("mem_vo.getMem_email()= "+mem_vo.getMem_email());
		
		HttpSession session=req.getSession();
		session.setAttribute("mem_vo",mem_vo);
		session.setAttribute("act_vo", act_vo);
		session.setAttribute("act_comm_set", act_comm_set);
		String url="/FrontEnd/act/act_detail.jsp";
		System.out.println(url);
		RequestDispatcher dispatcher=req.getRequestDispatcher(url);
		dispatcher.forward(req, res);
		
		
			}catch(Exception e){
				System.out.println("gotoDetail error");
				String url=req.getParameter("act.jsp");
				RequestDispatcher dispatcher=req.getRequestDispatcher(url);
				dispatcher.forward(req, res);
				
				
				
			}
			
			
			
		}
		
//		if ("getOne_For_Display".equals(action)) {
//		
//			List<String> errorMsgsForUpdate = new LinkedList<String>();
//			List<String> openModal=new LinkedList<String>();
//			openModal.add("baba");
//			req.setAttribute("openModal", openModal);
//			
//			req.setAttribute("errorMsgsForUpdate", errorMsgsForUpdate);
//		
//		try{	
//			String str = req.getParameter("GIFT_NO");
//		
//			if (str == null || (str.trim()).length() == 0) {
//				errorMsgsForUpdate.add("請輸入贈品編號");
//			}
//			req.setAttribute("whichPage",req.getParameter("whichPage"));   //取得目前所在的頁數，不管失敗獲成功都會停留在同一頁，不會跑到第一頁
//		
//			String url=req.getParameter("gift_data.jsp");
//	
//			if (!errorMsgsForUpdate.isEmpty()) {
//				RequestDispatcher failureView = req
//						.getRequestDispatcher(url);
//				failureView.forward(req, res);
//				return;//程式中斷
//			}
//		
//			String gift_no=str;
//			Gift_dataService gift_dataSvc=new Gift_dataService();
//		
//			Gift_dataVO gift_data_vo=gift_dataSvc.getOneGift_data(gift_no);
//			
//			if ( gift_data_vo == null) {
//				
//				errorMsgsForUpdate.add("查無資料");
//			}
//		
//			if (!errorMsgsForUpdate.isEmpty()) {
//				RequestDispatcher failureView = req
//						.getRequestDispatcher(url);
//				failureView.forward(req, res);
//				return;//程式中斷
//			}
//	
//			
//	
//			if(req.getParameter("url")!=null){
//				url=(String) req.getParameter("url");
//			
//			}else{
//				url=(String) req.getParameter("url");
//		
//			}
//			
//			req.setAttribute("gift_data_vo", gift_data_vo);
//		
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			successView.forward(req, res);
//			
//			
//		}catch (Exception e) {
//		
//			String url=req.getParameter("gift_data.jsp");
//			errorMsgsForUpdate.add("無法取得資料:" + e.getMessage());
//			RequestDispatcher failureView = req
//					.getRequestDispatcher(url);
//			failureView.forward(req, res);
//		}
//			
//		}
//		
//		  if ("insert".equals(action)) { 
//			  
//			  List<String> errorMsgs = new LinkedList<String>();
//			  req.setAttribute("errorMsgs", errorMsgs);
//			
//			  try{
//				  String gift_name=req.getParameter("GIFT_NAME").trim();
//				  if(gift_name.length()==0){
//					  errorMsgs.add("請輸入贈品名稱");
//				  }
//				  
//				  
//				  String gift_cont=req.getParameter("GIFT_CONT").trim();
//				  if(gift_cont.length()==0){
//					  errorMsgs.add("請輸入贈品描述");
//				  }
//				 
//				  java.sql.Date gift_launch_date=null;
//				 
//				  try{
//					  gift_launch_date=java.sql.Date.valueOf(req.getParameter("GIFT_LAUNCH_DATE").trim());
//					 
//				  }catch (IllegalArgumentException e) {
//					 
//					  gift_launch_date=new java.sql.Date(System.currentTimeMillis());
//						errorMsgs.add("請輸入日期!");
//					}
//				 
//				  Integer gift_remain=null;
//				 
//				  try{
//				  gift_remain=new Integer(req.getParameter("GIFT_REMAIN").trim());
//				
//				  }catch (NumberFormatException e) {
//						gift_remain = 0;
//						errorMsgs.add("數量請填數字.");
//					}
//				  Integer gift_pt=null;
//				  try{
//					  gift_pt=new Integer(req.getParameter("GIFT_PT").trim());
//				  }catch (NumberFormatException e) {
//					  gift_pt = 0;
//						errorMsgs.add("積分請填數字.");
//					}
//				 
//
//				 
//				  InputStream  is= req.getPart("GIFT_IMG").getInputStream(); 
//				
//				  byte[] 	gift_img=null;
//				  if(!req.getPart("GIFT_IMG").getContentType().contains("image")){   //判斷是否有上傳照片
//					 
//					
//					 
//					   gift_img= ( byte[]) req.getSession().getAttribute("gift_img");         //抓使用者之前上傳的圖片
//					   if(gift_img==null){                                                                                         //判斷是否曾經上傳過圖片
//						   errorMsgs.add("請上傳贈品圖片");
//					   }
//				  }else{
//				  
//				
//					 ByteArrayOutputStream buffer = new ByteArrayOutputStream();
//
//					 int nRead;
//					 byte[] gift = new byte[16384];
//
//					 while ((nRead = is.read(gift)) != -1) {
//					   buffer.write(gift, 0, nRead);
//					 }
//
//					 	gift_img=buffer.toByteArray();
//				  req.getSession().setAttribute("gift_img",gift_img);  //將gift_img上傳到session上，如果使用者上架失敗可以從session拿到舊圖，使用者不用重新上傳
//				  }
//				  String url=req.getParameter("gift_data.jsp");
//				  
//				  Gift_dataVO gift_data_VO=new Gift_dataVO();
//				  gift_data_VO.setGift_name(gift_name);
//				  gift_data_VO.setGift_cont(gift_cont);
//				  gift_data_VO.setGift_launch_date(gift_launch_date);
//				  gift_data_VO.setGift_remain(gift_remain);
//				  gift_data_VO.setGift_pt(gift_pt);
//				  gift_data_VO.setGift_img(gift_img);
//					if (!errorMsgs.isEmpty()) {
//						req.setAttribute("gift_data_VO", gift_data_VO); // 含有輸入格式錯誤的empVO物件,也存入req
//						RequestDispatcher failureView = req
//								.getRequestDispatcher(url);
//						failureView.forward(req, res);
//						return;
//					}
//				  
//				  Gift_dataService gift_data_service=new Gift_dataService();
//				   gift_data_VO=gift_data_service.addGift_data(gift_name,gift_remain,gift_cont,gift_img,gift_pt,gift_launch_date);
//				  
//				   req.setAttribute("gift_data_VO", null);
////				  req.setAttribute("gift_data_VO",gift_data_VO);
//			
//				  
//				  
//				  
//				  RequestDispatcher successView=req.getRequestDispatcher(url);
//				  successView.forward(req,res);
//				  
//			  }catch (Exception e) {
//				  String url=req.getParameter("gift_data.jsp");
//				  errorMsgs.add(e.getMessage());
//					errorMsgs.add("系統錯誤");
//					RequestDispatcher failureView = req
//							.getRequestDispatcher(url);
//					failureView.forward(req, res);
//				}
//		
//		  }
//		
//		  if ("getOne_For_Update".equals(action)) { 
//			  List<String> errorMsgs = new LinkedList<String>();
//			  req.setAttribute("errorMsgs", errorMsgs);
//			 
//			  try{
//				  String gift_no=req.getParameter("GIFT_NO");
//				 
//				 
//				  Gift_dataService gift_dataSvc=new Gift_dataService();
//				
//				  Gift_dataVO gift_dataVO=gift_dataSvc.getOneGift_data(gift_no);
//				 
//				  
//				 
//				  req.setAttribute("gift_dataVO",gift_dataVO);
//				
//				  String url="/gift_data/update_gift_data_input.jsp";
//				  RequestDispatcher successView=req.getRequestDispatcher(url);
//				  successView.forward(req, res);
//				  
//			  }catch (Exception e) {
//					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/gift_data/listAllGift_data.jsp");
//					failureView.forward(req, res);
//				}
//			  
//			  
//		  }
//		  
//		  
//		  if ("update".equals(action)) { 
//			  
//				List<String> errorMsgsForUpdate = new LinkedList<String>();
//				req.setAttribute("errorMsgsForUpdate", errorMsgsForUpdate);
//			
//				try{
//					String gift_no=req.getParameter("gift_no").trim();
//				
//					String gift_name=req.getParameter("gift_name").trim();
//					if(gift_name.length()==0){
//						errorMsgsForUpdate.add("請輸入贈品名稱");
//					}
//					
//					Integer gift_remain=null;
//					try{
//					 gift_remain=new Integer(req.getParameter("gift_remain"));
//					
//					}catch(NumberFormatException e){
//						errorMsgsForUpdate.add("剩餘數量請填入數字");
//					}
//					
//					String gift_cont=req.getParameter("gift_cont").trim();
//					if(gift_name.length()==0){
//						errorMsgsForUpdate.add("請輸入贈品描述");
//					}
//				
//
//					
//					  InputStream  is= req.getPart("gift_img").getInputStream(); 
//					
//				
//					  byte[] 	gift_img=null;
//					  if(!req.getPart("gift_img").getContentType().contains("image")){   //判斷是否有上傳照片
//						  Gift_dataService gift_dataSvc=new Gift_dataService();
//						 
//							Gift_dataVO gift_data_vo=gift_dataSvc.getOneGift_data(gift_no);
//						  gift_img=gift_data_vo.getGift_img();
//						  
//						  
//
//					  }else{
//					  
//					  
//				
//					  
//						 ByteArrayOutputStream buffer = new ByteArrayOutputStream();
//
//						 int nRead;
//						 byte[] gift = new byte[16384];
//
//						 while ((nRead = is.read(gift)) != -1) {
//						   buffer.write(gift, 0, nRead);
//						 }
//					 
//				 	gift_img=buffer.toByteArray();
//					  }
//					
//			
//					 Integer gift_pt=null;
//					 try{
//					gift_pt=new Integer(req.getParameter("gift_pt"));
//					 }catch(NumberFormatException e){
//						 errorMsgsForUpdate.add("積分請填入數字");
//						 
//					 }
//				
//					java.sql.Date gift_launch_date=null;
//					try{
//						gift_launch_date=java.sql.Date.valueOf(req.getParameter("gift_launch_date"));
//					}catch(IllegalArgumentException e){
//						errorMsgsForUpdate.add("請輸入日期");
//					}
//					req.setAttribute("whichPage",req.getParameter("whichPage")); //取得目前所在的頁數，不管失敗獲成功都會停留在同一頁，不會跑到第一頁
//					Gift_dataVO gift_data_vo=new Gift_dataVO();
//					gift_data_vo.setGift_no(gift_no);
//					gift_data_vo.setGift_name(gift_name);
//					gift_data_vo.setGift_remain(gift_remain);
//					gift_data_vo.setGift_cont(gift_cont);
//					gift_data_vo.setGift_img(gift_img);
//					gift_data_vo.setGift_pt(gift_pt);
//					gift_data_vo.setGift_launch_date(gift_launch_date);
//				
//					if (!errorMsgsForUpdate.isEmpty()) {
//					 // 含有輸入格式錯誤的empVO物件,也存入req
//						String url=req.getParameter("gift_data.jsp");
//						
//						req.setAttribute("gift_data_vo", gift_data_vo);
//						RequestDispatcher failureView = req
//								.getRequestDispatcher(url);
//						failureView.forward(req, res);
//						return; //程式中斷
//					}
//					
//					Gift_dataService gift_dataSvc=new Gift_dataService();
//					 gift_data_vo=gift_dataSvc.updateGift_data(gift_no, gift_name, gift_remain, gift_cont, gift_img, gift_pt, gift_launch_date);
//				
//					req.setAttribute("gift_data_vo", gift_data_vo);
//					
//					String url=req.getParameter("gift_data.jsp");
//					RequestDispatcher successView=req.getRequestDispatcher(url);
//					successView.forward(req, res);
//				}catch (Exception e) {
//					errorMsgsForUpdate.add("修改資料失敗:"+e.getMessage());
//					String url=req.getParameter("gift_data.jsp");
//					RequestDispatcher failureView = req
//							.getRequestDispatcher(url);
//				
//					failureView.forward(req, res);
//				}
//			  
//		  }
//		  
//		  
//		  
//		  if ("delete".equals(action)) {
//			  
//			  List<String> errorMsgs = new LinkedList<String>();
//			  req.setAttribute("errorMsgs", errorMsgs);
//			  
//			  try{
//				  
//				  String gift_no=req.getParameter("gift_no");
//				  Gift_dataService gift_dataSvc=new Gift_dataService();
//				  gift_dataSvc.deleteGift_data(gift_no);
//				  
//				  String url=req.getParameter("gift_data.jsp");
//				  RequestDispatcher successView=req.getRequestDispatcher(url);
//				  successView.forward(req,res);
//			  }catch (Exception e) {
//					errorMsgs.add("刪除資料失敗:"+e.getMessage());
//					String url=req.getParameter("gift_data.jsp");
//					RequestDispatcher failureView = req
//							.getRequestDispatcher(url);
//					failureView.forward(req, res);
//				}
//			  
//		  }
		  
		  
		  
		  
		  
		  
		  
		  
		  
		
	}
	
	public static java.sql.Date timestampToDate(java.sql.Timestamp timestamp){
		Date test_timestamp=timestamp;
		java.sql.Date test_date=new java.sql.Date(test_timestamp.getTime());
		return test_date;
	}

	public static java.sql.Timestamp dateToTimestamp(java.sql.Date date){
		
		java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
		return timestamp;
		
	}
	
	
	
	
	
	
}
