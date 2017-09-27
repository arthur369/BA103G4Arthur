<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.cart_list.model.*"%>


<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
<jsp:useBean id="cart_listSvc" scope="page" class="com.cart_list.model.Cart_listService" />

<c:set var="mem_ac" value="${sessionScope.mem_ac}" scope="page"/>

<c:set var="cart_listSet" value="${cart_listSvc.getVOsByMem(mem_ac)}" scope="page"/>






<!DOCTYPE html>
<html lang="">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>BeanLife</title>
    <link rel="Shortcut Icon" type="image/x-icon" href="<%=request.getContextPath()%>/FrontEnd/res/img/logo/BeanLifeIco2.ico" />

    <!--[if lt IE 9]>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/plugin/jquery.scrollbar.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/css/beanlife.base.css">
    
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/FrontEnd/res/plugin/jquery.scrollbar.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/FrontEnd/res/js/beanlife.base.js"></script>




  </head>
  <body>

    <!-- NavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbar -->
    <nav class="navbar navbar-default navbar-fixed-top bg-light-brn border0 cus-nav" role="navigation">
      <div class="container">
        <div>
          <button type="button" class="navbar-toggle pull-left cus-ham" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">選單切換</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>


          <div class="pull-left">
            <a href="<%=request.getContextPath()%>/FrontEnd/index/index.jsp">
              <img class="w50 padt5 padb2 mgr20" src="<%=request.getContextPath()%>/FrontEnd/res/img/BeanLifeLogoR.png">
            </a>
          </div>
          
          <div class="pull-right padt5">
            <div class="dropdown pull-right">
                      <a class="navbar-brand dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        <span id="cartSize" class="badge cus-badge">${cart_listSvc.getVOsByMem(mem_ac).size()}</span>
                      </a>
                      <ul id="cartList" class="dropdown-menu zidx5">
	                    
	                    <c:forEach var="cart_listVO" items="${cart_listSet}">
	                    	<li><a href="#">
	                    		${prodSvc.getOneProd(cart_listVO.prod_no).prod_name}
	                    		<span class="pull-right">$${prodSvc.getOneProd(cart_listVO.prod_no).prod_price}ｘ${cart_listVO.prod_amount}</span>
	                    	</a></li>
	                    </c:forEach>
	                   
                    <li role="presentation" class="divider"></li>
                    <a href="<%=request.getContextPath()%>/FrontEnd/cart/cart.jsp"><div  class="btn btn-info btn-sm pull-right mgr20">前往購物車</div></a>
                  </ul>
                    </div>

                    <div class="dropdown pull-right">
                      <a class="navbar-brand dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                      </a>
                      <ul class="dropdown-menu zidx5">
                    <c:if test="${storeSvc.getOneByMem(mem_ac) != null}">
	                    <li><a href="#">店家資訊</a></li>
	                    <li><a href="#">商品管理</a></li>
	                    <li><a href="#">訂單管理</a></li>
	                    <li role="presentation" class="divider"></li>
                    </c:if>
                    <li><a href="#">個人資料</a></li>
                    <li><a href="#">訂單查詢</a></li>
                    <li><a href="#">我的收藏</a></li>
                    <li><a href="#">個人文章</a></li>
                    <li><a href="#">個人活動</a></li>
                    <li><a href="#">積分兌換</a></li>
                  </ul>
                    </div>
                </div>
        </div>


        <div class="h-block-depn-nav"></div>

        <!-- 手機隱藏選單區 -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <!-- 左選單 -->
          <ul class="nav navbar-nav">
            <li><a class="padt20 padb17" href="<%=request.getContextPath()%>/FrontEnd/shop/shop.jsp">找豆</a></li>
            <li><a class="padt20 padb17" href="<%=request.getContextPath()%>/FrontEnd/forum/forum.jsp">討論板</a></li>
            <li><a class="padt20 padb17" href="<%=request.getContextPath()%>/FrontEnd/activity/activity.jsp">辦活動</a></li>
            <li><a class="padt20 padb17" href="#">地圖</a></li>
          </ul>
        </div>
        <!-- 手機隱藏選單區結束 -->
      </div>
    </nav>

<!-- --------------------------------------NAV尾NAV尾NAV尾NAV尾NAV尾----------FUNC BAR開頭--------------------------------------------- -->

<!--  --------------------------------------------------------------跳窗---------------------------------------------------------------->





    <div class="modal" id="modal-id">
        <div class="modal-dialog modal-lg">
            <div class="modal-content fix-h scrollbar-macosx" id="modalX">

<!-- 				這邊是跳窗塞內容 -->
                
            </div>
        </div>
    </div>
    
<!--  --------------------------------------------------------------跳窗結束---------------------------------------------------------------->