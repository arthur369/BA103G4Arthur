<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<%@ page import="com.act_comm.model.*"%>
<html >
<head>
  <meta charset="UTF-8">
  <title>活動詳細頁面</title>
  
  
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>

       <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/css/act_detail.css">
<style>
.picAndDetail{
	overflow: hidden;
	
	
}




.section_header .backgroundImg .row .picAndDetail .img img {
height: 300px;

}
.col-md-4 .host .hostIcon {
  width: 200px;
  height: 200px;
  border: solid 1px #eee;
  border-radius: 50%;
  overflow: hidden;
  background-image: url("<%=request.getContextPath()%>/MemImg.do?mem_ac=${mem_vo.mem_ac}");
  background-size: cover;
}

.col-md-4 {
  padding: 20px;
  border: solid 1px #eee;
  border-radius: 50px;
  height: 700px;
  background-color: #fff;
}

.section_info .actionMap #map {
  border: solid 1px #eee;
  width: 700px;
  height: 350px;
  transform: translate(0%, 10%);
  margin-bottom: 80px;
}

.icon {
  width: 50px;
  height: 50px;
  border: solid 1px #eee;
  border-radius: 50%;
  left: 50%;
  transform: translate(-50%, 0);
  background-size: cover;
}

.askDetail{
width: 100%;
height: 300px;


}
.askDetail .leave_message{
width: 100%;
height: 200px;

}
.message_button{
float: right;
}

.return_message, .host_message{
width: 100%;
height: 200px;
border: solid 1px #7A3D0B;
padding: 10px;
}
.message_button{
cursor: pointer;
}
.message_button:hover{
text-decoration: none;
}
.response_message{
width: 100%;
height: 300px;

}
</style>


<%
ActVO act_vo= (ActVO) session.getAttribute("act_vo");
Date date_act_op_date=act_vo.getAct_op_date();
java.sql.Timestamp act_op_date = new java.sql.Timestamp(date_act_op_date.getTime());
pageContext.setAttribute("act_op_date",act_op_date);
Date date_act_ed_date=act_vo.getAct_ed_date();
java.sql.Timestamp act_ed_date = new java.sql.Timestamp(date_act_ed_date.getTime());
pageContext.setAttribute("act_ed_date",act_ed_date);
String act_no=act_vo.getAct_no();
ActService actSvc=new ActService();
Set<Act_commVO> act_comm_set= actSvc.getAct_commByAct_no(act_no);
pageContext.setAttribute("act_comm_set",act_comm_set);
	pageContext.setAttribute("act_vo",act_vo);
	
	%>





  
</head>

<body>
  
<div class="container_fluid section_header">
  <div class="backgroundImg">
    <div class="titleBar">
      <div class="row">
        <div class="col-sm-12 beforeTitle">
          <h1>${act_vo.act_name }</h1>
        </div>
        <div class="col-sm-12 picAndDetail">
          <div class="col-sm-6 img">
          
          
        <div id="carousel-id" class="carousel slide" data-ride="carousel">
        <!-- 幻燈片小圓點區 -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-id" data-slide-to="0" class=""></li>
            <li data-target="#carousel-id" data-slide-to="1" class=""></li>
            <li data-target="#carousel-id" data-slide-to="2" class="active"></li>
        </ol>
        <!-- 幻燈片主圖區 -->
        <div class="carousel-inner">
            <div class="item">
                <img src="<%=request.getContextPath()%>/ActImg.do?act_no=${act_vo.act_no}&index=1" alt="">
                <div class="container">
                    <div class="carousel-caption">
                        
                    </div>
                </div>
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/ActImg.do?act_no=${act_vo.act_no}&index=2" alt="">
                <div class="container">
                    <div class="carousel-caption">
                       
                    </div>
                </div>
            </div>
            <div class="item active">
                 <img src="<%=request.getContextPath()%>/ActImg.do?act_no=${act_vo.act_no}&index=3" alt="">
                <div class="container">
                    <div class="carousel-caption">
                       
                    </div>
                </div>
            </div>
        </div>
        <!-- 上下頁控制區 -->
        <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
			
          </div>
          
          <div class="col-sm-6 titleInfo">
            <h1 class="titleText">活動招募中</h1>
            <h3 class="minJoin">最低參加人數
              <div class="bar">
                <div class="joinNumber"  style="width: calc(${act_vo.mem_count }% *  100 /  ${act_vo.max_mem })"></div>
              </div>
            </h3>
            <h2 class="date">報名期限到數
            
              <div class="time"></div>
            </h2>
            <h2 class="price">NT$ ${act_vo.act_fee }<br/>
              <div class="button  doit_instance">立即報名</div>
            </h2>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="section_info container">
  <div class="row">
    <div class="col-md-8">
      <h1 class="information">活動資訊
        <h2>活動時間:<span  class="act_op_date">${act_op_date }</span><span>~</span><span class="act_ed_date">${act_ed_date }</span></h2>
        <h2>活動地點: ${act_vo.act_add }</h2>
      </h1>
      <h1 class="introduction">活動介紹
        <img src="C:/Users/Java/Desktop/專題照片/mule_coffee.jpg" alt="">
        <hr/>
        <p>${act_vo.act_cont }</p>
      </h1>
      <h1  class="actionMap">活動地圖
        <hr/>
        <div  id="map" ></div>
      </h1>
      <h1 class="message">留言發問</h1>
        <div class="guestAsk">
          
          <div class="col-md-1">
            <div class="icon"> </div>
            </div>
          <div class="col-md-11">
          <div class="askDetail">
            
            <form  method="post"  action="<%=request.getContextPath() %>/act_management/act_managementServlet" >
            <textarea class="leave_message" rows="2" cols="20" wrap="hard" name="comm_cont" placeholder="留言"></textarea>
            <input type="hidden" name="action" value="insert_comm">
             <input type="hidden" name="act_no" value="${act_vo.act_no }">
              <input type="hidden" name="mem_ac"  class="acount" value="${(mem_ac==null)? "mamabeak":mem_ac}">
               
                
                 <input type="hidden" name="act_detail.jsp" value="<%=request.getServletPath()%>">
            <br>
            <button class="btn-default  message_button"  type="submit">留言</button>
            </form>
          </div>
          </div>
          
        <%--回復部分 --%>
         <c:forEach var="act_comm_vo"  items="${act_comm_set}" >  
          <div class="col-md-1">
            <div class="icon"  style="background-image: url('<%=request.getContextPath()%>/MemImg.do?mem_ac=${act_comm_vo.mem_ac}')"> </div>
            </div>
          <div class="col-md-11">
          <div class="askDetail">
            <h2 class="name">${act_comm_vo.mem_ac }</h2>
            
            <div class="return_message" >${act_comm_vo.comm_cont }</div>
            <br>
            <input type="hidden"  class="get_comm_no" value="${act_comm_vo.comm_no }">
            <a href='#modal-id' data-toggle="modal"  class="btn-default  message_button">主辦單位回覆</a>
          </div>
          
          <div class="col-md-1 host_icon">
            <div class="icon"  style="background-image: url('<%=request.getContextPath()%>/MemImg.do?mem_ac=${mem_vo.mem_ac}')"> </div>
            </div>
           <div class="col-md-11  host_area">
          <div class="askDetail">
            <h2 class="name">${act_vo.mem_ac }</h2>
            <div class="host_message" >${act_comm_vo.comm_reply_cont }</div>
            <br>
            
          </div>
          </div>
          
          
          </div>
          
           </c:forEach>
          
          
        </div>
        
        
        
    </div>
    <div class="col-md-4">
      <div class="host">
        <h1 class="about">關於主辦單位</h1>
        <div class="hostIcon">
      <%--	<img src="<%=request.getContextPath()%>/MemImg.do?mem_ac=${mem_vo.mem_ac}">  --%>  
        </div>
        <p>${act_vo.org_cont } </p>
        <button class="contractHost btn-success btn-lg">聯絡主辦單位</button>
      </div>
    </div>
  </div>
</div>
<div class="bookMarks fa fa-bookmark-o"></div>


<%--主辦單位回復modal --%>
<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">回覆內容</h4>
					</div>
					    <form  method="post"  action="<%=request.getContextPath() %>/act_management/act_managementServlet" >
					<div class="modal-body">
						 <textarea class="response_message" rows="2" cols="20" wrap="hard" name="comm_reply_cont" placeholder="回覆"></textarea>
						 <input type="hidden"  name="comm_no"  class="set_comm_no" value="${act_comm_vo.comm_no }">
						 <input type="hidden" name="act_detail.jsp" value="<%=request.getServletPath() %>">;
						 <input type="hidden" name="action" value="response_comm">
						 
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
						<button type="submit" class="btn btn-primary">回覆</button>
					</div>
					</form>
				</div>
			</div>
		</div>


  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <%--google map 地圖 --%>
 <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZqbxURS33Q5XimlMq6it_KanwhInsh0Q&callback=initMap">
    </script>
 
 
 <script>
 if("${act_vo.mem_ac}"!=$(".acount").val()){
	 $(".message_button").css("display","none");
	 
	 
 }
 
 
 
 $(".message_button").click(function(){
	var comm_no= $(this).prev().val();
	$(".set_comm_no").val(comm_no);
	 
 })
 
 
 
 var op_date= $(".act_op_date").text().substring(0,19);
 $(".act_op_date").text(op_date);
 var ed_date= $(".act_ed_date").text().substring(0,19);
 $(".act_ed_date").text(ed_date);
 
	for(var i=0;i<$(".host_message").length;i++){
		if($(".host_message").eq(i).text().length==0){
	
	
			$(".host_message").eq(i).parent().parent().css("display","none");
			$(".host_message").eq(i).parent().parent().prev().css("display","none");
	
	
}
	}
 
 
 
 
 var dl_date;

var remain_time=setInterval(function(){
	
	 dl_date=((new Date("${act_vo.dl_date}").getTime())-(new Date().getTime()));
	 if(dl_date>0){
	var second=Math.floor(dl_date/1000);
	var minute=Math.floor(second/60);
	var hour=Math.floor(minute/60);
	var day=Math.floor(hour/24);
	
	var hours=hour%60;
	var minutes=minute%60
	var seconds=second%60
	$(".time").text("剩下"+day+"天"+hours+"小時"+minutes+"分"+seconds+"秒");
	}else{
		$(".time").text("報名已截止");
		$(".titleText").text("停止報名");
		$(".doit_instance").attr("disabled", true);
		$(".doit_instance").css("display","none");
	}
	
},1000)




remain_time();






function initMap() {
        var uluru = {lat: ${act_vo.act_add_lat}, lng: ${act_vo.act_add_lon}};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }

<%--由地圖查經緯度--%>
<%--
function getLatLngByAddr($address) {
	var geocoder = new google.maps.Geocoder(); //定義一個Geocoder物件
	geocoder.geocode({
		address : $address
	}, //設定地址的字串
	function(results, status) { //callback function
		if (status == google.maps.GeocoderStatus.OK) { //判斷狀態
			$lat = results[0].geometry.location.lat();
			var lat = $lat;
			var  lat1 = lat.toFixed(12);
			$(".lat").text(lat1);
			$lng = results[0].geometry.location.lng();
			var lng = $lng;
			var  lng1 = lng.toFixed(12);
			$(".lng").text(lng1);

		}
	});
}
--%>

 </script>
</body>
</html>
