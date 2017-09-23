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


<%
List<ActVO>	 list=(List<ActVO>) request.getAttribute("getOne_For_Display");
pageContext.setAttribute("list",list);
	
	%>





  
</head>

<body>
  
<div class="container_fluid section_header">
  <div class="backgroundImg">
    <div class="titleBar">
      <div class="row">
        <div class="col-sm-12 beforeTitle">
          <h1>${list.act_name }</h1>
        </div>
        <div class="col-sm-12 picAndDetail">
          <div class="col-sm-5 img"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/275px-A_small_cup_of_coffee.JPG" alt=""/></div>
          <div class="col-sm-7 titleInfo">
            <h1 class="titleText">活動招募中</h1>
            <h3 class="minJoin">最低參加人數
              <div class="bar">
                <div class="joinNumber"></div>
              </div>
            </h3>
            <h2 class="date">報名期限到數
              <div class="time">9天8時59秒</div>
            </h2>
            <h2 class="price">NT$300<br/>
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
        <h2>活動時間:<span>2017/08/26~2017/09/26</span></h2>
        <h2>活動地點: div Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto quia reprehenderit enim alias ut harum totam explicabo nulla voluptatum. Autem culpa iure unde ut quis voluptas deleniti incidunt minus suscipit!</h2>
      </h1>
      <h1 class="introduction">活動介紹
        <hr/>
        <p>div Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia sint natus ea quo, eos in! Voluptatibus sunt architecto neque esse. Quisquam, cupiditate. Rem totam necessitatibus ea id eius! Eum maiores mollitia non reprehenderit voluptatibus quisquam ex! Dicta dolorum facilis, vitae quibusdam iste esse numquam repellendus accusamus, labore, delectus sit doloremque?</p>
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
        <p>div Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptas dolores praesentium, placeat beatae rerum voluptatibus pariatur suscipit. Corporis quisquam veniam dolorem accusantium explicabo qui, rem recusandae consectetur, praesentium, quae sapiente!</p>
        <button class="contractHost btn-success btn-lg">聯絡主辦單位</button>
      </div>
    </div>
  </div>
</div>
<div class="bookMarks fa fa-bookmark-o"></div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.mi'></script>

  
</body>
</html>
