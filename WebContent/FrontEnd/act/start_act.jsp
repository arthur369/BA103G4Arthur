<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<html >
<head>
  <meta charset="UTF-8">
  <title>舉辦活動第一頁面</title>
  
  
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>

      <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/css/start_act.css">
      
      <%--date picker專用css --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/css/bootstrap-datetimepicker.min.css" />
      
<style>
.left input , .right  .long{
width: 60%;
}
.dollor{
font-size: 24px;
}
.number-spinner{
width: 50%;

}
.minJoin, .maxJoin{

display: flex;
justify-content: left;
align-items: center;
}
.deadline{
font-size: 24px;
width: 40%;
}
.endTime{
display: flex;
justify-content: left;
}

.input-group{
width: 60%;
}
.form_datetime,.deadline{
margin-top: 20px;
transform: translate(-8%,0);
}
.form_datetime{
transform: translate(-15%,0);
}
.myerror{
position: relative;
left: 45%;
transform: translate(-100%,0);
}

</style>
  
</head>

<body>
  
<div class="circles">
  <div class="circle first">
    <h2>1</h2>
  </div>
  <div class="line"></div>
  <div class="circle">
    <h2>2</h2>
  </div>
  <div class="line"></div>
  <div class="circle"> 
    <h2>3</h2>
  </div>
</div>
<h1 class="title">填寫活動資訊</h1>
<c:if test="${not empty errorMsgs}">
	<font color='red'  class="myerror" >請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs} ">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<form method="post"  action="<%=request.getContextPath() %>/act_management/act_managementServlet">
<input type="hidden"  name="action"  value="start_act_to_pg2">
<input type="hidden" name="start_act.jsp"  value=<%=request.getServletPath() %> >
<div class="container">
  <div class="info">
    <div class="row">
      <div class="col-md-6 left">
      
        <div class="actionName">
          <h2>活動名稱:</h2>
          <input type="text"   name="act_name"  value="${(act_vo==null)?"":act_vo.act_name }"/>
        </div>
        
        <div class="address">
          <h2>活動地點:</h2>
          <input type="text"   name="act_add"  value="${(act_vo==null)?"":act_vo.act_add }"/>
        </div>
         <div class="price"  >
          <h2>活動費用: NT</h2>
          <input type="text"  name="act_fee" value="${(act_vo==null)?"":act_vo.act_fee }"/>
          <span  class="dollor">元</span>
        </div>
        <div class="time">
          
        </div>
        <div class="actionLabel">
          <h2>活動標籤:</h2>
          <input type="text"  name="act_tag" value="${(act_vo==null)?"":act_vo.act_tag }"/>
        </div>
        
      </div>
      <div class="col-md-6 right">
       
        <div class="minJoin">
          <h2  class="mimPeople">最低參加人數:</h2>
          <div class="input-group number-spinner">

				<span class="input-group-btn">
					<button  type="button" class="btn btn-default " data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text"  name="min_mem" class="form-control text-center" value="${(act_vo==null)?"0":act_vo.min_mem }">
				<span class="input-group-btn">
					<button type="button" class="btn btn-default add" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>
        </div>
        <div class="maxJoin">
         <h2  class="maxPeople">最高參加人數:</h2>
          <div class="input-group number-spinner">

				<span class="input-group-btn">
					<button  type="button" class="btn btn-default " data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
				</span>
				<input type="text"  name="max_mem" class="form-control text-center" value="${(act_vo==null)?"0":act_vo.max_mem }">
				<span class="input-group-btn">
					<button type="button" class="btn btn-default add" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
				</span>
			</div>
        </div>
        <div class="endTime form-group">
          
           <span class="col-md-2 control-label  deadline">報名截止日期:</span>
                <div class="input-group date form_datetime " data-date="" data-date-format="yyyy-mm-dd HH:ii:ss" data-link-field="dtp_input1">
                    <input class="form-control  test" size="16" type="text"  name="dl_date"    value="${(act_vo==null)?"":dl_date }">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				
        </div>
        <div class="payWay">
          <h2>繳費方式:</h2>
          <input type="radio"   class="payWay" name="pay_way"   value="不須繳費"/><span>不須繳費</span>
          <input type="radio"  class="payWay" name="pay_way"  value="ATM"/><span>ATM</span>
          <input type="radio"  class="payWay"  name="pay_way"  value="信用卡"/><span>信用卡</span>
          <input type="radio"  class="payWay"  name="pay_way"  value="現場繳費"/><span>現場繳費</span>
        </div>
        
      </div>
    </div>
  </div>
</div>

<div class="next">
  <button class="btn-success btn-lg"  type="submit">下一步</button>
 
</div>
 </form>
   <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%--date picker專用js --%> 
     <script type="text/javascript"  src="<%=request.getContextPath()%>/BackEnd/res/js/bootstrap-datetimepicker.js"></script> 
 <script type="text/javascript"  src="<%=request.getContextPath()%>/BackEnd/res/js/bootstrap-datetimepicker.fr.js"></script>


<script>
 // 數字的+、-按鈕控制
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
 
			<%--Date picker--%>
			$('.form_datetime').datetimepicker({
			    //language:  'fr',
			    weekStart: 1,
			    todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				forceParse: 0,
			    showMeridian: 1
			});
 
 if(${(act_vo!=null)}){
	 for(var i=1;i<=$(".payWay").length;i++){
		 if($(".payWay").eq(i).val()==("${act_vo.pay_way}")){
			 $(".payWay").eq(i).attr("checked",true);
		 }
		 
		 
	 }
	 
	 
 }
			

 
			</script>
</body>
</html>
