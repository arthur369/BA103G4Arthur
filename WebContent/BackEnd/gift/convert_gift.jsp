<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.convert_gift.model.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>後端活動審核</title>
    <link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/css/style.css">
  

<style>
.card .right .right_bottom {
  background-color: white; }
  .card .right .right_bottom .left_info {
    background-color: white; }

.card .right .right_bottom tbody {
  text-align: center; }
  .card .right .right_bottom tbody tr th {
    color: #393E46;
    margin-left: 30px;
    text-align: center; }
  .card .right .right_bottom tbody tr td {
    color: #393E46;
    padding: 18px 0px 0px 0px;
    margin-bottom: 0; }
    .card .right .right_bottom tbody tr td button {
      position: relative;
      bottom: 10px; }


.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

 .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}
<%--  --%>
input:checked + .slider:before {
 
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
.confirm{
  
  float: right;
  border-radius: 10px;
  padding: 15px 10px;
  color: #eee;

}
.pager{
  margin-top: 150px;
}
.fade *{
color: #333 ;
}
.modal-title{
display: inline-block;
color: red;
font-size: 50px;
margin-right: 30px;
}
  .errorMessage{
      margin-right: 70%;
       }
   .selectStatus{
   float: right;
   display: inline-block;
   margin-top: 20px;
   }    
   .check{
   display: inline-block;
   }
    .dropdown-menu{
    cursor: pointer;
    }
    .mystatus :hover{
    color: #eee;
    }
    .convert_gift_no{
    cursor: pointer;
    }
    .convert_gift_no:hover{
    text-decoration: none;
    
    }
    .gift_info{
    font-size: 30px;
    font-weight: 800;
    color: #333;
    }
</style>
<%
    Convert_giftService convert_giftSvc = new Convert_giftService();
List<Convert_giftVO> list=null;
if(request.getAttribute("showConvert_gift")==null){
 list=convert_giftSvc.getAll();
}else{
	 list=(List<Convert_giftVO>)request.getAttribute("showConvert_gift");
}
    pageContext.setAttribute("list",list);
%>

  </head>
  <body>
    <div class="container_fluid titlebar"><a class="form-inline titlebarForm" href="<%=request.getContextPath()%>/BackEnd/main.jsp"><img class="icon" src="<%=request.getContextPath()%>/BackEnd/res/images/BeanLifeLogo2.png" alt="">
        <h1>Bean-Life</h1></a></div>
    <div class="container card">
      <div class="row">
        <div class="col-xs-2 left"><a class="h3 title" href="#action" aria-expanded="false" aria-controls="action" data-toggle="collapse" style="text-decoration: none;">
            <div class="fa fa-futbol-o"></div><a class="h3" href="act.html"> 活動審核</a></a><a class="h3 title" href="#check" aria-expanded="false" aria-controls="check" data-toggle="collapse" style="text-decoration: none;">
            <div class="fa fa-check-circle"></div><span class="h3">檢舉管理</span>
            <ul class="collapse" id="check"><a>評論檢舉</a><a>商品檢舉</a><a>討論區檢舉</a></ul></a><a class="h3 title" href="#mem" aria-expanded="false" aria-controls="mem" data-toggle="collapse" style="text-decoration: none;">
            <div class="fa fa-address-card-o"></div><span class="h3">會員管理</span>
            <ul class="collapse" id="mem"><a>會員資料管理</a><a>廠商店家授權</a><a>積分管理</a></ul></a><a class="h3 title" href="#admin" aria-expanded="false" aria-controls="admin" data-toggle="collapse" style="text-decoration: none;">
            <div class="fa fa-user-o"> </div><span class="h3">管理員管理</span>
            <ul class="collapse" id="admin"><a>管理帳戶授權</a><a>帳戶管理</a></ul></a><a class="h3 title" href="#gift" aria-expanded="false" aria-controls="gift" data-toggle="collapse" style="text-decoration: none;">
            <div class="fa fa-gift"> </div><span class="h3">平台業務管理</span>
            <ul class="collapse" id="gift"><a href="<%=request.getContextPath()%>/BackEnd/ad/ad.jsp">廣告管理</a><a  href="<%=request.getContextPath()%>/BackEnd/gift/convert_gift.jsp">兌換贈品管理</a><a href="<%=request.getContextPath()%>/BackEnd/gift/gift_data.jsp">兌換贈品業務管理</a></ul></a></div>
        <div class="right col-xs-10">
          <div class="col-xs-12 right_top">
         <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}" >
	<font color='red' class="errorMessage">請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
          <img src="<%=request.getContextPath()%>/BackEnd/res/images/bear.jpg" alt="">
            <h2>你好</h2><a class="fa fa-bell dropdown-toggle" href="#" data-toggle="dropdown"></a>
            <ul class="dropdown-menu">
              <li><a>10項檢舉未處理</a></li>
              <li><a>10項活動未審核</a></li>
              <li><a>10項廠商會員申請未審核</a></li>
              <li><a href="<%=request.getContextPath()%>/BackEnd/gift/convert_gift.jsp">10項兌換贈品申請</a></li>
            </ul>
          </div>
          <div class="col-xs-12 right_middle">
            <div class="col-xs-12">
              <h2 class="check">兌換贈品業務管理</h2>
             
              <div class="btn-group selectStatus">
  <button class="btn btn-default btn-sm dropdown-toggle  " type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    選擇 <span class="caret "></span>
  </button>
  <ul class="dropdown-menu">
    <li>
    <FORM METHOD="post"   ACTION="<%=request.getContextPath() %>/gift_business/gift_businessServlet" name="form1" >
    <a class="mystatus">全顯示
    </a>
     <input type="hidden"  name="APPLY_STAT" value="全顯示">
    <input type="hidden" name="requestURL"  value="<%=request.getServletPath() %>">
    <input type="hidden"  name="action" value="show_select_list">
    </FORM>
    </li>
    <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/gift_business/gift_businessServlet" name="form1" >
    <a class="mystatus">待出貨
  
    </a>
      <input type="hidden"  name="APPLY_STAT" value="待出貨">
      <input type="hidden" name="requestURL"  value="<%=request.getServletPath() %>">
    <input type="hidden"  name="action" value="show_select_list">
    </FORM>
    </li>
    <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/gift_business/gift_businessServlet" name="form1" >
    <a class="mystatus">已出貨
    
    </a>
    <input type="hidden"  name="APPLY_STAT" value="已出貨">
      <input type="hidden" name="requestURL"  value="<%=request.getServletPath() %>">
    <input type="hidden"  name="action" value="show_select_list">
    </FORM>
    </li>
  </ul>
</div>
              
              
            </div>
          </div>
          <div class="col-xs-12 right_bottom">
            <table class="table table-striped">
              <tr>
                <th>兌換申請編號</th>
                <th>會員帳號</th>
                <th>收件人姓名</th>
                <th>收件人電話</th>
                <th>兌換贈品編號</th>
                <th>兌換申請日期</th>
                <th>收貨地址</th>
                <th>出貨日期</th>
                <th>物流編號</th>
                <th>兌換申請狀態</th>
                <th>兌換狀態切換</th>
              </tr>
               <%@ include file="convert_gift_page1.file" %> 
              <c:forEach var="convert_gift_vo"  items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1%>">
              <tr>
                <td>${convert_gift_vo.apply_no }</td>
                <td>${convert_gift_vo.mem_ac }</td>
                <td>${convert_gift_vo.apply_name }</td>
                <td>${convert_gift_vo.apply_phone }</td>
                 <td  class="gift_no_td">
                 <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/gift_management/gift_managementServlet" name="form1" class="gift_no_form" >
                 <a  class="convert_gift_no">${convert_gift_vo.gift_no }</a>
             </FORM>    
                 </td>
                <td>${convert_gift_vo.apply_date }</td>
                <td>${convert_gift_vo.apply_add }</td>
                <td>${convert_gift_vo.send_date }</td>
                <td><input type="text"  value="${convert_gift_vo.send_no }" class="inputData"></td>     
                <td class="status">${convert_gift_vo.apply_stat }</td>
                <td><label class="switch">
                     <input type="checkbox">
                     <span class="slider round"></span>
                     </label></td>
                
              </tr>
              
 </c:forEach>
  
            </table>
            
            <a href='#modal-update' data-toggle="modal" class="btn btn-success confirm"  style="color: #eee">確定更改狀態</a>
            
             <%-- 
            <ul class="pager">
              <li class="previous"><a href="#">← 上一頁</a></li>
              <li class="next"><a href="#">下一頁 →</a></li>
            </ul>
            --%>
              <%@ include file="convert_gift_page2.file" %> 
          </div>
        
        </div>
      </div>
       
    </div>
    <%--   更新確認視窗madal --%>
    <div class="modal fade" id="modal-update">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h1 class="modal-title fa fa-exclamation-triangle"></h1><span class="h1">確定變更兌換申請狀態?</span>
					</div>
					<div class="modal-body">
						此更動將會更新資料庫內容!!
					</div>
					<div class="modal-footer">
					<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/gift_business/gift_businessServlet" name="form1" >
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<input type="hidden"  name="action" value="changeState">
						<input type="hidden" name="whichPage" value="<%=whichPage%>"  >
						<input type="hidden" name="convert_gift.jsp" value="<%=request.getServletPath() %>">
						<button type="submit" class="btn btn-primary" style="color: #eee">確定</button>
						<div class="getFk"></div>
						
						</FORM>
					</div>
				</div>
			</div>
		</div>
		
		<%--   贈品詳細資訊madal --%>
    <div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title gift_info">贈品詳細資訊</h4>
					</div>
				<div class="modal-body">
					 <h3>贈品名稱:${gift_data_vo.gift_name }<h3>
   
  				
						
				<h3> 剩餘數量:${gift_data_vo.gift_remain }</h3>
				

				<h3> 所需積分:${gift_data_vo.gift_pt }</h3>
				

				
 					 	<img src="<%=request.getContextPath()%>/GiftImg.do?gift_no=${gift_data_vo.gift_no }" >
  					
					<h3>贈品描述:</h3>
					<p>${gift_data_vo.gift_cont }</p>
				
							<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
					</div>
					</div>
				
				</div>
			</div>
	
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    
    <%-- switch被點擊時觸發 --%>
      $(".slider").click(function(){
	$(this).parent().parent().addClass("changeState");
	
	<%-- 錯誤處理，若待出貨改成已出貨，則物流編號須有值否則跳出提醒視窗 --%>
        if($(this).parent().parent().prev().text()=="待出貨"){
        	if($(this).parent().parent().prev().prev().children().val().length==0){
        		
        		alert("請輸入物流編號");
        		
        		return;
        	}
        <%-- 修改頁面文字，將已出貨改成待出貨，待出貨改成已出貨  --%>
        	$(this).parent().parent().prev().text("已出貨");
    }else{
    	$(this).parent().parent().prev().text("待出貨");
        }
        
        <%-- 得到被點擊的贈品明細資訊(兌換申請編號、出貨狀態、物流編號) 產生input type="hidden" 方便之後送出 --%>
        var fk=$(this).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
     var statusValue=$(this).parent().parent().prev().text();
     var send_no=$(this).parent().parent().prev().prev().children().val();
        $(".getFk").append("<input type='hidden' name=primaryKey "+ "value="+fk+">");    	  
        $(".getFk").append("<input type='hidden' name=statusValue "+ "value="+statusValue+">");
        $(".getFk").append("<input type='hidden' name=send_no "+ "value="+send_no+">");
      })
      
      <%-- 滑鼠移入移出時產生背景顏色和顏色的變化  --%>
      $(".dropdown-menu").children().children().mouseenter(function(){
		$(this).css("background-color","#333");
		$(this).children().css("color","#eee")
		                                 .css("text-decoration","none");
	})
	$(".dropdown-menu").children().children().mouseleave(function(){
		$(this).css("background-color","#eee");
		$(this).children().css("color","#333");
		
	})
	
	<%--  點擊超連結後送出(submit) --%>
	$(".mystatus").click(function(){
		$(this).parent().submit();
		
		
	})
	
	
	<%-- 點擊贈品編號，取得相關資訊並產生input type=hidden，在submit將這些資料一併送出 --%>
	$(".convert_gift_no").click(function(){
		var fk= $(this).parent().text();
		var url="<%= request.getServletPath()%>";
		var whichPage="<%= whichPage%>";
				
		$(this).parent().append("<input type='hidden' name=GIFT_NO "+ "value="+fk+">");
		$(this).parent().append("<input type='hidden' name=whichPage "+ "value="+whichPage+">");
		$(this).parent().append("<input type='hidden' name=url "+ "value="+url+">");
		$(this).parent().append("<input type='hidden' name=action "+ "value=getOne_For_Display>");
		
		$(this).parent().submit();
	})
	
	if(${not empty openModal}){
		 $("#modal-id").modal({show: true});
		}
	

    </script>
  </body>
</html>