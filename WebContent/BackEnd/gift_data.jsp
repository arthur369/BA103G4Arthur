<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.gift_data.model.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>後端贈品上下架</title>
    <link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/gift_data.css">
    
    <style>
    *{
    position: relative;
  
    }
    
      .card .right .right_bottom .giftcard .info h3 ,.card .right .right_bottom .giftcard .info  p {
          color: #F2F2F2; }
    .giftImg {
    height: 350px ;
     vertical-align: top;
    }
    .abovegiftcard{
  margin-top:100px;
     vertical-align: top;
 
    }
    .giftcard{
    height: 700px;
    }
    .cardrow{
    vertical-align: top;
   
    }
 .card .right .right_bottom  h4{
    color: #eee;
    }
    .selectPage{

    }
    .selectPageTable{
    float: right;
    
    }
    table{
    margin-top: 30px;
    color: black;
    float: right;
    }
     table *{
    
    color: black;
    
    }
     .card .right .right_middle .middle .btn {
        float: right;
        margin-top: 10px;
        padding: 10px 20px; }
        
       #modal-id *{
        color: #333;
        }
    #modal-id    .btn-primary{
        color: #eee;
        }
.card .right .right_bottom   .btn-danger  {
        color: #eee;
  
        }
        
    </style>
    <%
    Gift_dataService gift_dataSvc = new Gift_dataService();

List<Gift_dataVO> list=gift_dataSvc.getAll();
    pageContext.setAttribute("list",list);
%>
    
  </head>
  <body>
    <div class="container_fluid titlebar"><a class="form-inline titlebarForm" href="main.html"><img class="icon" src="images/BeanLifeLogo2.png" alt="">
        <h1>Bean-Life</h1></a></div>
    <div class="container card">
      <div class="row composing">
        <div class="col-xs-2 left"><a class="h3 title" href="#action" aria-expanded="false" aria-controls="action" data-toggle="collapse" style="text-decoration: none;">
            <div class="fa fa-futbol-o"></div><a class="h3 act" href="act.html"> 活動審核</a></a><a class="h3 title" href="#check" aria-expanded="false" aria-controls="check" data-toggle="collapse" style="text-decoration: none;">
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
            <div class="col-xs-12 middle">
              <h2 class="check">兌換贈品管理</h2>
              <a href='#modal-id' data-toggle="modal"  class="btn btn-success">上架</a>
            </div>
          </div>
          <div class="col-xs-12 right_bottom">
            <%@ include file="page1.file" %> 
           <div class="row  cardrow">
         
           <c:forEach var="gift_data_vo"  items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1%>">
              <div class="col-xs-4 col-sm-4  abovegiftcard">
                <div class="giftcard"><img class="giftImg"src="<%=request.getContextPath()%>/GiftImg.do?gift_no=${gift_data_vo.gift_no }" >
                  <div class="info">
                    <h3>${gift_data_vo.gift_name}</h3>
                    <p>${gift_data_vo.gift_cont}</p>
                    <h3>所需積分${gift_data_vo.gift_pt}</h3>
                    <div class="getitem">
                      <button class="btn-danger">下架</button>
                      <h3>剩下${gift_data_vo.gift_remain}個</h3>
                    </div>
                    <div class="upTime">
                      <h4>上架時間</h4>
                      <h4>${gift_data_vo.gift_launch_date}</h4>
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
              
              
         <%--    
              <div class="col-xs-4 col-sm-4">
                <div class="giftcard"><img src="images/cup.jpg" alt="">
                  <div class="info">
                    <h3>頂級咖啡杯</h3>
                    <p>頂級，獨一無二</p>
                    <h3>所需積分50</h3>
                    <div class="getitem">
                      <button class="btn-danger">下架</button>
                      <h3>剩下5個</h3>
                    </div>
                    <div class="upTime">
                      <h4>上架時間</h4>
                      <h4>2017/08/28        </h4>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xs-4 col-sm-4">
                <div class="giftcard"><img src="images/cup.jpg" alt="">
                  <div class="info">
                    <h3>極品咖啡杯</h3>
                    <p>品嘗極品咖啡專用</p>
                    <h3>所需積分50</h3>
                    <div class="getitem">
                      <button class="btn-danger">下架</button>
                      <h3>剩下1個</h3>
                    </div>
                    <div class="upTime">
                      <h4>上架時間</h4>
                      <h4>2017/08/28     </h4>
                    </div>
                  </div>            
                </div>
              </div>
              --%>  
            
            </div>
            
            <%-- 
            <ul class="pager">
              <li class="previous"><a href="#">← 上一頁</a></li>
              <li class="next"><a href="#">下一頁 →    </a></li>
              --%>
           
          </div>
            <%@ include file="page2.file" %>
        </div>
        
      </div>
    </div>
    <div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">贈品上架</h3>
					</div>
					<div class="modal-body">
					<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/gift_data/gift_dataServlet" name="form1" enctype="multipart/form-data">
						 <div class="form-group">
    <label for="ad_title" class="h3">贈品名稱</label>
    <input type="text" class="form-control" id="ad_title"  name="GIFT_NAME" placeholder="請輸入標題">
  					</div>
						<div class="modal-body">
				<h3> 剩餘數量</h3>
				<div class="input-group number-spinner">

				<span class="input-group-btn">
					<button type="button" class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text"   name="GIFT_REMAIN"  class="form-control text-center" value="1">
				<span class="input-group-btn">
					<button   type="button" class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>

				<h3> 所需積分</h3>
				<div class="input-group number-spinner">

				<span class="input-group-btn">
					<button  type="button" class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text"  name="GIFT_PT" class="form-control text-center" value="1">
				<span class="input-group-btn">
					<button type="button" class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>

				<div class="form-group">
  				  <label for="exampleInputFile">贈品圖片</label>
  					  <input type="file" id="myfiles"  name="GIFT_IMG">
 					 	<output id="mylist"></output>
  						</div>
					<h3>贈品描述</h3>
					<textarea class="form-control"  name="GIFT_CONT" rows="3"></textarea>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
						<input type="hidden" name="action" value="insert">
						<button type="submit" class="btn btn-primary">Save changes</button>
					</div>
					</FORM>
				</div>
				
			</div>
				
		</div>
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
			$(document).on('click', '.number-spinner button', function () {    
	var btn = $(this),
		oldValue = btn.closest('.number-spinner').find('input').val().trim(),
		newVal = 0;
	
	if (btn.attr('data-dir') == 'up') {
		newVal = parseInt(oldValue) + 1;
	} else {
		if (oldValue > 1) {
			newVal = parseInt(oldValue) - 1;
		} else {
			newVal = 1;
		}
	}
	btn.closest('.number-spinner').find('input').val(newVal);
});
		
  
	function handleFileSelect(evt) {
		$("#mylist").empty();
		
		
		
	    var files = evt.target.files; // FileList object

	    // Loop through the FileList and render image files as thumbnails.
	    for (var i = 0, f; f = files[i]; i++) {

	      // Only process image files.
	      if (!f.type.match('image.*')) {
	        continue;
	      }

	      var reader = new FileReader();

	      // Closure to capture the file information.
	      reader.onload = (function(theFile) {
	        return function(e) {
	          // Render thumbnail.
	          var span = document.createElement('span');
	          span.innerHTML = ['<img class="thumb" src="', e.target.result,
	                            '" title="', escape(theFile.name), '"/>'].join('');
	          document.getElementById('mylist').insertBefore(span, null);
	          $(".thumb").width(150).height(100);
	                        
	        };
	      })(f);

	      // Read in the image file as a data URL.
	      reader.readAsDataURL(f);
	    }
	  }

	  document.getElementById('myfiles').addEventListener('change', handleFileSelect, false);
	
	
	
	
	</script>	
  </body>
</html>