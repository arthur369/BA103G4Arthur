<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
<style type="text/css">
	.buy_title{
		margin-bottom: 50px;
		font-weight: 900;
	}
	.bold{
		font-weight: 900;
	}

</style>


	<body>
		
		
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1 class="buy_title">參與活動--付款資訊</h1>
			<h4>購買活動即可獲得5積分喔~</h4>
			<table class="table table-striped">
			
			
				
				<tr>
					<td class="bold">活動名稱</td>
					<td >${act_vo.act_name }</td>
				</tr>
				<tr>
					<td class="bold">主辦會員</td>
					<td>${act_vo.mem_ac }</td>
				</tr>
				<tr>
					<td class="bold">活動價格</td>
					<td>NT$${act_vo.act_fee }</td>
				</tr>
				<tr>
					<td class="bold">付款資訊
					<input type="hidden"  class="pay_way" name="pay_way" value="${act_vo.pay_way }">
					</td>
					<td>
					<div class="atm">${act_vo.act_atm_info }</div>
					<div class="creadit_card">
					<div><div>
<label>卡號:</label>


<input type="text" name="cc_no1" size="4" maxlength="4" />
<input type="text" name="cc_no2" size="4" maxlength="4" />
<input type="text" name="cc_no3" size="4" maxlength="4" />
<input type="text" name="cc_no4" size="4" maxlength="4" />
<input type="text" name="cc_no4" size="3" maxlength="3"  placeholder="檢核碼" />
</div>
<div>
<label>到期日:</label>
<select name="cc_m"  class="month"></select> 月
<select name="cc_y"  class="year"></select> 年
</div></div>
					</div>
					<div class="other" >${act_vo.pay_way }</div>
					
					</td>
				</tr>
			
			
			
			</table>
			<div class="col-md-offset-9">
			<form  method="post"  action="<%=request.getContextPath() %>/act_management/act_managementServlet" >
				<a class="btn btn-danger"  href="<%=request.getContextPath()%>/FrontEnd/act/act_detail.jsp">取消購買</a>
				
				<button class="btn btn-success" >確定購買</button>
				<input type="hidden"  name="mem_ac"  value="${(mem_ac==null)? "mamabeak":mem_ac}">
				<input type="hidden"  name="action"  value="confirm_buy">
				<input type="hidden"  name="buy_act.jsp"  value="<%=request.getServletPath()%>">
				</form>
			</div>

		</div>
	</div>
</div>


<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">購買成功!!</h4>
					</div>
					
					<div class="modal-footer">
					<%session.removeAttribute("add_date_query");%>
						<a type="button" class="btn btn-default"  href="<%=request.getContextPath()%>/FrontEnd/act/act.jsp">回活動列表</a>
						
					</div>
				</div>
			</div>
		</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script>
		for(var i=1;i<=12;i++){
		$(".month").append("<option value="+i+">"+i);
		}
		
		for(var i=1991;i<=2030;i++){
			$(".year").append("<option value="+i+">"+i);
			}
		
		
		<%--依付款方式條件顯示訊息或輸入視窗--%>
		var pay_way=$(".pay_way").val();
		if(pay_way=="ATM"){
			$(".atm").show();
			$(".creadit_card").hide();
			$(".other").hide();
		}else if(pay_way=="信用卡"){
			$(".atm").hide();
			$(".creadit_card").show();
			$(".other").hide();
		}else{
			$(".atm").hide();
			$(".creadit_card").hide();
			$(".other").show();
		}
		
		if(${not empty openModal}){
			 $("#modal-id").modal({show: true});
			}
		
		</script>
		
		
		
	</body>
</html>