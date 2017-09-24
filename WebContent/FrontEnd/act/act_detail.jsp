<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
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
</style>


<%
ActVO act_vo= (ActVO) session.getAttribute("act_vo");
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
                <div class="joinNumber"></div>
              </div>
            </h3>
            <h2 class="date">報名期限到數
            
              <div class="time"></div>
            </h2>
            <h2 class="price">NT$ ${act_vo.act_fee }<br/>
              <div class="button">立即報名</div>
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
        <h2>活動時間:<span>${act_vo.act_op_date }~${act_vo.act_ed_date }</span></h2>
        <h2>活動地點: ${act_vo.act_add }</h2>
      </h1>
      <h1 class="introduction">活動介紹
        <img src="C:/Users/Java/Desktop/專題照片/mule_coffee.jpg" alt="">
        <hr/>
        <p>${act_vo.act_cont }</p>
      </h1>
      <h1 class="actionMap">活動地圖
        <hr/>
        <div class="map"></div>
      </h1>
      <h1 class="message">留言發問
        <hr/>
        <div class="guestAsk">
          <div class="iconSpace">
            <div class="icon"> </div>
          </div>
          <div class="askDetail">
            <h2 class="name">我是會員</h2>
            <textarea rows="2" cols="20" wrap="hard" placeholder="留言"></textarea>
            <button class="btn-default">留言</button>
          </div>
        </div>
        <div class="showAnswer">
          <div class="iconSpace">
            <div class="icon"> </div>
          </div>
          <div class="askDetail">
            <div class="answerTitle">
              <h2 class="name">我是會員</h2>
              <h2>xxx天前</h2>
              <button class="btn-default">檢舉</button>
            </div>
            <div class="answerArea"></div>
            <button class="replay btn-default">回覆</button>
            <div class="showAnswer">
              <div class="iconSpace">
                <div class="icon"> </div>
              </div>
              <div class="askDetail">
                <div class="answerTitle">
                  <h2 class="name">我是會員</h2>
                  <h2>xxx天前</h2>
                  <button class="btn-default">檢舉</button>
                </div>
                <div class="answerArea"></div>
                <button class="replay btn-default">回覆</button>
              </div>
            </div>
          </div>
        </div>
      </h1>
    </div>
    <div class="col-md-4">
      <div class="host">
        <h1 class="about">關於主辦單位</h1>
        <div class="hostIcon"></div>
        <p>${act_vo.org_cont } </p>
        <button class="contractHost btn-success btn-lg">聯絡主辦單位</button>
      </div>
    </div>
  </div>
</div>
<div class="bookMarks fa fa-bookmark-o"></div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 <script>
 
 var dl_date;
function remain_time(){
	
	
}
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
	}
	
},1000)


$(document).ready(function(){

	remain_time();
	
	
	
	
})








 </script>
</body>
</html>
