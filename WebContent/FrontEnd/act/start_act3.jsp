<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<html >
<head>
  <meta charset="UTF-8">
  <title>舉辦活動第三頁面</title>
  
  
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>

      <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/css/start_act3.css">

  <style>
  .next .previous:hover{
  text-decoration: none;
  }
  
  
  </style>
  
  
  
</head>

<body>
  
<div class="circles">
  <div class="circle first">
    <h2>1</h2>
  </div>
  <div class="line"></div>
  <div class="circle second">
    <h2>2</h2>
  </div>
  <div class="line"></div>
  <div class="circle third">
    <h2>3</h2>
  </div>
</div>
<div class="container">
  <div class="col-md-12 endMessage">
    <h3>感謝您的填寫，您的活動已送往審核，如審核通過將在您的信箱通知您，如果資料確定無誤請按確認送出，如需修改請點擊上一步修改。</h3>
  </div>
</div>
<div class="next">
  <a class="btn-success btn-lg previous"  href="<%=request.getContextPath() %>/FrontEnd/act/start_act2.jsp">上一步</a>
  <form  method="post"  action="<%=request.getContextPath() %>/act_management/act_managementServlet">
  <button class="btn-success btn-lg end">確認送出</button>
  <input type="hidden" name="action"  value="start_act_complete">
  <input type="hidden" name="start_act3.jsp" value="<%=request.getServletPath() %>">
  </form>
</div>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

  
</body>
</html>
