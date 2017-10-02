<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>

<html>
  <head>
    <meta charset="UTF-8">
    <title>後端活動審核</title>
    <link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/css/style.css">
    
 
    
    <%--date picker專用css --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/css/bootstrap-datetimepicker.min.css" />
    
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
text-align: center;
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
        
  .date_picker{
  margin-left: -20px;

  padding: 20px;
  }
    .date_picker  *{
  
  }
  .control-label {
  width: 100px;
  float: left;
  padding-left: 0px;
  }
  #prod_no_selector{
  margin-right: 30px;
  }
  .delete{
  display: inline-block;
  }
  #prod_name{
  display: inline-block;

  }
  .prod_name_update{
   display: inline-block;
 
  }
  .update{
  display: inline-block;
  }
  .action_pic{
  width:120px;
  height: 80px;
  left: 50%;
  transform: translate(-50%,0%);
  }
  
  
  
  </style>
<%
ActService actSvc=new ActService();
List<ActVO> mylist=  actSvc.getAll();
List<ActVO> list=new ArrayList();
for(int i=0;i<mylist.size();i++){
	if(mylist.get(i).getAct_stat().equals("待審核")){
		list.add(mylist.get(i));
	}
	
	
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
          <div class="col-xs-12 right_top"><img src="<%=request.getContextPath()%>/BackEnd/res/images/bear.jpg" alt="">
            <h2>你好</h2><a class="fa fa-bell dropdown-toggle" href="#" data-toggle="dropdown"></a>
            <ul class="dropdown-menu">
              <li><a>10項檢舉未處理</a></li>
              <li><a>10項活動未審核</a></li>
              <li><a>10項廠商會員申請未審核</a></li>
              <li><a  href="<%=request.getContextPath()%>/BackEnd/gift/convert_gift.jsp">10項兌換贈品申請</a></li>
            </ul>
          </div>
          <div class="col-xs-12 right_middle">
            <div class="col-xs-12  middle">
              <h2 class="check">活動審核</h2>
             
            </div>
          </div>
          <div class="col-xs-12 right_bottom">
            <%@ include file="act_page1.file" %> 
          <table class="table table-striped">
          <tr>
            <th>活動編號</th>
            <th>活動名稱</th>
            <th>主辦會員</th>
            <th>活動價格</th>
            <th>活動狀態</th>
            <th>活動照片</th>
            <th>活動審核</th>
          </tr>
          <c:forEach var="act_vo"  items="${list}"  begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1%>">
     
          <tr>
            <td>${act_vo.act_no }</td>
            <td>${act_vo.act_name }</td>
            <td>${act_vo.mem_ac }</td>
            <td>NT$${act_vo.act_fee }</td>
            <td>${act_vo.act_stat }</td>
            <td><img class="img-responsive  action_pic" src="<%=request.getContextPath()%>/ActImg.do?act_no=${act_vo.act_no}&index=1" > </td>
            <td> 
            <form  method="post" action="<%=request.getContextPath() %>/act_management/act_managementServlet">
              <button class="btn btn-danger">退回</button>
               </form>
              <form  method="post" action="<%=request.getContextPath() %>/act_management/act_managementServlet">
               <input type="hidden" name=action  value="action_check_pass" >
                <input type="hidden" name=act_no  value="${act_vo.act_no }" >
                <input type="hidden" name=action_check.jsp  value="<%=request.getServletPath() %>" >
              <button class="btn btn-success">通過</button>
              </form>
            </td>
          </tr>
          	
            </c:forEach>
        </table>
          
          </div>
       <%@ include file="act_page2.file" %> 
           
        </div>
      </div>
     
    </div>
    
    
    
    
    
    
    
    
    
   
  
    
    
    
    
    
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <%--date picker專用js --%> 
     <script type="text/javascript"  src="<%=request.getContextPath()%>/BackEnd/res/js/bootstrap-datetimepicker.js"></script> 
 <script type="text/javascript"  src="<%=request.getContextPath()%>/BackEnd/res/js/bootstrap-datetimepicker.fr.js"></script>
  

  
    		
    	   
    
    

     
    
  </body>
</html>