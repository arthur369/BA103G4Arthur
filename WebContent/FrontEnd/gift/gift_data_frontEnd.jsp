<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.gift_data.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.convert_gift.model.*"%>
<html >
<head>
  <meta charset="UTF-8">
  <title>積分兌換專區</title>
  
  
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/font-awesome-4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/css/gift_data_frontEnd.css">
      
      
      <style>
      
      html, body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
 background-color: white;
}
      
      *{
font-family:"微軟正黑體";
}
      .card{
      height: 800px;
      }
      .giftImg{
      height: 350px;
      }
      .gift .card img {
border-style: none;
  left: 50%;
  transform: translate(-50%, 0);
  width: 100%;
}
.gift .card {
  border: solid 1px #eee;
  padding: 0px;
  border-radius: 30px;
  overflow: hidden;
  background-color: #eee;
  box-shadow: 0px 0px 35px rgba(0, 0, 0, 0.3);
}
.range{
width:120%;
}
.remain{
left: 40%;

}
.fa{
color: red;
font-size: 50px;
margin-right: 30px;


}
.my_pt_title{
margin-bottom: 30px;

}
.gift{
margin-bottom: 30px;
}

.myGift_table>tbody>tr>td,.pt_table>tbody>tr>td{
vertical-align:middle;
text-align: center;
}	

.show_gift_pic{
width: 80%;
height: auto
}

.large_bold{
font-size: 25px;
font-weight: 900;

}



      </style>
      
      
<%
    Gift_dataService gift_dataSvc = new Gift_dataService();

List<Gift_dataVO> list=gift_dataSvc.getAll();
    request.setAttribute("list",list);
    
    String mem_ac=(String)session.getAttribute("mem_ac");
    if(mem_ac==null){
    	mem_ac="mamabeak";
    	}
    
    request.setAttribute("mem_ac",mem_ac);
    MemService memSvc=new MemService();
   MemVO mem_vo= memSvc.getOneProd(mem_ac);
    
    
    
   request.setAttribute("mem_vo",mem_vo);
    
    
   Convert_giftService convert_giftSvc=new Convert_giftService();
   List<Convert_giftVO> convert_gift_list=convert_giftSvc.getAll();
   
   request.setAttribute("convert_gift_list",convert_gift_list);
   
    
    
    
    
%>
  
</head>

<body>




  <div class="container">
	    <div class="row">
  <h1 class="my_pt_title">積分兌換</h1>
  <div role="tabpanel">
		    <!-- 標籤面板：標籤區 -->
		    <ul class="nav nav-tabs" role="tablist">
		        <li role="presentation" class="active">
		            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">積分兌換專區</a>
		        </li>
		        <li role="presentation">
		            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">兌換訂單查詢</a>
		        </li>
		        <li role="presentation">
		            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">積分取得規則</a>
		        </li>
		    </ul>
		
		    <!-- 標籤面板：內容區 -->
		    <div class="tab-content">
		        <div role="tabpanel" class="tab-pane active" id="tab1">
		        <div class="title"> 
  <h1>積分兌換專區</h1>
  <h1>您目前持有${mem_vo.mem_pt }積分</h1>
</div>
 <%@ include file="page1.file" %> 
<div class="container gift">

  <div class="row">
    <div class="col-md-12 col-sm-12 range">
      <c:forEach var="gift_data_vo"  items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1%>">
      <div class="col-md-4 col-sm-4">
        <div class="card"><img class="giftImg"src="<%=request.getContextPath()%>/GiftImg.do?gift_no=${gift_data_vo.gift_no }" >
          <div class="info">
            <h3>${gift_data_vo.gift_name}</h3>
            <p>${gift_data_vo.gift_cont}</p>
            <h3>所需積分<span>${gift_data_vo.gift_pt}</span></h3>
            <div class="getitem">
            <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/gift_management/gift_managementServlet" name="form1" >
            <div>
              <button class="btn-success">兌換</button>
              <input type="number" name="gift_amount"  class="gift_amount" ><span class="h4">個</span>
              </div>
              <h3  class="remain">剩下<span class="gift_remain">${gift_data_vo.gift_remain}</span>個</h3>
              <input type="hidden"  name="action"  value="buy_gift">
               <input type="hidden"  name="gift_data_frontEnd.jsp"  value="<%=request.getServletPath()%>">
                <input type="hidden"  name="gift_no"  value="${gift_data_vo.gift_no}">
              </FORM>
            </div>
            <div class="upTime">
              <h4>上架時間</h4>
              <h4>${gift_data_vo.gift_launch_date}</h4>
            </div>
          </div>
        </div>
      </div>
  
 </c:forEach>
    </div>
   
  </div>
</div>
		        
		        <%@ include file="gift_data_page2.file" %>
		        
		        
		        </div>
		        <div role="tabpanel" class="tab-pane" id="tab2">
		       <table class="table table-striped myGift_table">
							<tr>
								<td>兌換申請編號</td>
								<td>贈品名稱</td>
								<td>兌換申請日期</td>
								<td>兌換申請狀態</td>
								<td>收貨地址</td>
								<td>出貨日期</td>
								<td>贈品圖片</td>
							</tr>
							
							<c:forEach var="convert_gift_vo" items="${convert_gift_list}"  >
						
						<c:if test="${convert_gift_vo.mem_ac==mem_ac}">
							<c:forEach var="gift_data_vo" items="${list}"  >
							<c:if test="${convert_gift_vo.gift_no==gift_data_vo.gift_no}">
							<tr>
								<td>${convert_gift_vo.apply_no }</td>
								<td>${gift_data_vo.gift_name }</td>
								<td>${convert_gift_vo.apply_date }</td>
								<td>${convert_gift_vo.apply_stat }</td>
								<td>${convert_gift_vo.apply_add }</td>
								<td>${(convert_gift_vo.send_date==null)?"無": convert_gift_vo.send_date}</td>
								<td><img class="img-responsive  show_gift_pic"src="<%=request.getContextPath()%>/GiftImg.do?gift_no=${gift_data_vo.gift_no }" ></td>
							</tr>
							</c:if>
							</c:forEach>
							</c:if>
								
							</c:forEach>
						</table>
		        
		        
		        
		        
		        
		        </div>
		        <div role="tabpanel" class="tab-pane" id="tab3">
		        <table class="table table-bordered pt_table table-striped ">
  							<tr >
  								<td></td>
  								<td  class="large_bold">3積分</td>
  								<td class="large_bold">5積分</td>
  							</tr>
  							<tr>
  								<td class="large_bold">商品評價</td>
  								<td></td>
  								<td><i class="fa fa-check" aria-hidden="true"></i></td>
  							</tr>
  							<tr>
  								<td class="large_bold">商品評論</td>
  								<td><i class="fa fa-check" aria-hidden="true"></i></td>
  								<td></td>
  							</tr>
  							<tr>
  								<td class="large_bold">舉辦活動</td>
  								<td></td>
  								<td><i class="fa fa-check" aria-hidden="true"></i></td>
  							</tr>
  							<tr>
  								<td class="large_bold">參加活動</td>
  								<td></td>
  								<td><i class="fa fa-check" aria-hidden="true"></i></td>
  							</tr>
							</table>
		        
		        
		        
		        </div>
		    </div>
		</div>
  </div>
  </div>


<%--   積分不足視窗madal --%>
    <div class="modal fade" id="modal-update">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h1 class="modal-title fa fa-exclamation-triangle"></h1><span class="h1">積分不足</span>
					</div>
					<div class="modal-body">
						請努力獲得積分!!
					</div>
					<div class="modal-footer">
					
						<button type="button" class="btn btn-default" data-dismiss="modal">確定</button>
						
						<div class="getFk"></div>
						
						
					</div>
				</div>
			</div>
		</div>


<%--   贈品不足視窗madal --%>
    <div class="modal fade" id="modal-notEnough">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h1 class="modal-title fa fa-exclamation-triangle"></h1><span class="h1">剩餘數量不足</span>
					</div>
					<div class="modal-body">
						請等待工作人員補貨!!
					</div>
					<div class="modal-footer">
					
						<button type="button" class="btn btn-default" data-dismiss="modal">確定</button>
						
						<div class="getFk"></div>
						
						
					</div>
				</div>
			</div>
		</div>


  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(".gift_amount").change(function(){
	if($(this).val()*$(this).parent().parent().parent().prev().children().text()>${mem_vo.mem_pt }){
	
	$(this).val(0);
	 $("#modal-update").modal({show: true});
	}
	if($(this).val()>$(this).parent().next().children().text()){
		$(this).val(0);
		 $("#modal-notEnough").modal({show: true});
	}
	
	
	
	
})




</script>
  
</body>
</html>