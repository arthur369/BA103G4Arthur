<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.gift_data.model.*"%>
<%@ page import="com.mem.model.*"%>
<html >
<head>
  <meta charset="UTF-8">
  <title>積分兌換專區</title>
  
  
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>

      <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/css/gift_data_frontEnd.css">
<%
    Gift_dataService gift_dataSvc = new Gift_dataService();

List<Gift_dataVO> list=gift_dataSvc.getAll();
    pageContext.setAttribute("list",list);
    
    String mem_ac=(String)session.getAttribute("mem_ac");
    if(mem_ac==null){
    	mem_ac="mamabeak";
    	}
    MemService memSvc=new MemService();
   MemVO mem_vo= memSvc.getOneProd(mem_ac);
    
    
    
    pageContext.setAttribute("mem_vo",mem_vo);
    
    
%>
  
</head>

<body>
  
<div class="title"> 
  <h1>積分兌換專區</h1>
  <h1>你目前持有${mem_vo.mem_pt }積分</h1>
</div>
 <%@ include file="page1.file" %> 
<div class="container gift">

  <div class="row">
    <div class="col-md-12 col-sm-12 range">
      <c:forEach var="gift_data_vo"  items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1%>">
      <div class="col-md-4 col-sm-4">
        <div class="card"><img class="giftImg"src="<%=request.getContextPath()%>/GiftImg.do?gift_no=${gift_data_vo.gift_no }" >
          <div class="info">
            <h3>贈品介紹</h3>
            <p>${gift_data_vo.gift_cont}</p>
            <h3>所需積分${gift_data_vo.gift_pt}</h3>
            <div class="getitem">
              <button class="btn-success">兌換</button>
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
    </div>
   
  </div>
</div>
  <%@ include file="page2.file" %>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  
</body>
</html>
