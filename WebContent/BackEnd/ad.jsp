<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ad.model.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>後端活動審核</title>
    <link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/css/act.css">
  <style type="text/css">
    *{
      position: relative;
    }
    .ad_img{
      width: 150px;
      height: 120px;
    }
    td{
      vertical-align: middle;
     
     padding: 10px;
    }
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{

  vertical-align: middle;
}
.prod_no{
text-decoration: none;
cursor: pointer;
}
.prod_no:hover{
text-decoration: none;
}
 .card .right .right_middle .middle .btn {
        float: right;
        margin-top: -50px;
        padding: 10px 20px; }
  </style>
<%
AdService adSvc=new AdService();
List<AdVO> list=  adSvc.getAll();
pageContext.setAttribute("list",list);
%>

  </head>
  <body>
    <div class="container_fluid titlebar"><a class="form-inline titlebarForm" href="main.html"><img class="icon" src="images/BeanLifeLogo2.png" alt="">
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
            <ul class="collapse" id="gift"><a>廣告管理</a><a>兌換贈品管理</a><a href="gift_data.html">兌換贈品業務管理</a></ul></a></div>
        <div class="right col-xs-10">
          <div class="col-xs-12 right_top"><img src="images/bear.jpg" alt="">
            <h2>你好</h2><a class="fa fa-bell dropdown-toggle" href="#" data-toggle="dropdown"></a>
            <ul class="dropdown-menu">
              <li><a>10項檢舉未處理</a></li>
              <li><a>10項活動未審核</a></li>
              <li><a>10項廠商會員申請未審核</a></li>
              <li><a>10項兌換贈品申請</a></li>
            </ul>
          </div>
          <div class="col-xs-12 right_middle">
            <div class="col-xs-12  middle">
              <h2 class="check">廣告管理</h2>
                <a href='#modal-id' data-toggle="modal"  class="btn btn-success">上架</a>
            </div>
          </div>
          <div class="col-xs-12 right_bottom">
          <%@ include file="ad_page1.file" %> 
            <table class="table table-striped">
              <tr>
                <th>廣告編號</th>
                <th>商品編號</th>
                <th>廣告標題</th>
                <th>廣告圖片</th>
                <th>開始時間</th>
                <th>結束時間</th>
                <th>管理</th>
              </tr>
              <c:forEach var="ad_vo"  items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1%>">
              <tr>
                <td  valign="middle">${ad_vo.ad_no }</td>
                <td><a class="prod_no">${ad_vo.prod_no }</a></td>
                <td>${ad_vo.ad_title }</td>
                <td><img class="ad_img"src="<%=request.getContextPath()%>/AdImg.do?ad_no=${ad_vo.ad_no }"></td>
                <td>${ad_vo.ad_op_date }</td>
                <td>${ad_vo.ad_ed_date }</td>
                <td>
                  <button class="btn btn-danger">下架</button>
                  <button class="btn btn-success">修改</button>
                </td>
              </tr>
                </c:forEach>
            </table>
          
          </div>
          <%@ include file="ad_page2.file" %> 
        </div>
      </div>
    </div>
    
    <%--         廣告上架的modal  (0919更新 未完成)                      --%>
 
 <% AdVO ad_vo=(AdVO) request.getAttribute("ad_vo");  %>
 
    <div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">廣告上架</h3>
					</div>
					<div class="modal-body">
					<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'  >請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs} ">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/gift_management/gift_managementServlet" name="form1" enctype="multipart/form-data">
						 <div class="form-group">
    <label for="ad_title" class="h3">廣告名稱</label>
    <input type="text" class="form-control" id="ad_title"  name="GIFT_NAME" placeholder="請輸入標題"  value="<%= (gift_data_VO==null)? "":gift_data_VO.getGift_name()%>"/>
  					</div>
						<div class="modal-body">
				<h3> 剩餘數量</h3>
				<div class="input-group number-spinner">

				<span class="input-group-btn">
					<button type="button" class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text"   name="GIFT_REMAIN"  class="form-control text-center" value="<%= (gift_data_VO==null)? "1":gift_data_VO.getGift_remain()%>">
				<span class="input-group-btn">
					<button   type="button" class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>

				<h3> 所需積分</h3>
				<div class="input-group number-spinner">

				<span class="input-group-btn">
					<button  type="button" class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text"  name="GIFT_PT" class="form-control text-center" value="<%= (gift_data_VO==null)? "1":gift_data_VO.getGift_pt()%>">
				<span class="input-group-btn">
					<button type="button" class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>

				<div class="form-group">
  				  <label for="exampleInputFile">贈品圖片</label>
  					  <input type="file" id="myfiles"  name="GIFT_IMG"  value="">
 					 	<output id="mylist">
 					 	<%-- 如果上架失敗，將之前上傳的那一張用base64編碼後秀出來預覽，讓使用者不用重新上傳 --%>
 					 	
 					 	<% 
 					 	String gift_img="";
  						  if(gift_data_VO!=null){
 					 	byte[] data=gift_data_VO.getGift_img();
  						StringBuilder sb = new StringBuilder();
  						sb.append("data:image/png;base64,");
  						sb.append(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(data));
  						gift_img = sb.toString();
  						}else{
  							gift_img="";
  						}
 						%>	
 					 	<img src="<%=gift_img %>">
 					 	</output>
  						</div>
					<h3>贈品描述</h3>
					<textarea class="form-control"  name="GIFT_CONT" rows="3"  id="gift_cont"><%= (gift_data_VO==null)? "" :gift_data_VO.getGift_cont()%></textarea>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
						<input type="hidden" name="action" value="insert">
						<input type="hidden" name="GIFT_LAUNCH_DATE" value="" class="nowTime">
						<button type="submit" class="btn btn-primary">Save changes</button>
					</div>
					</FORM>
				</div>
				
			</div>
				
		</div>
	</div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>
</html>