<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<html >
<head>
  <meta charset="UTF-8">
  <title>舉辦活動第二頁面</title>
  
  
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>

     <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/css/start_act2.css">

  <%--date picker專用css --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/BackEnd/res/css/bootstrap-datetimepicker.min.css" />
</head>
<style>
textarea.form-control{
height: 300px;

}
.control-label {
font-size: 24px;
font-weight: 100;
}
.previous{
cursor: pointer;
}
.previous:hover{
text-decoration: none;
}
.memory{
width: 150px;
height: 100px;
}
.myerror{
position: relative;
left: 45%;


}
</style>



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
  <div class="circle">
    <h2>3</h2>
  </div>
</div>
<% ActVO act_vo=(ActVO) session.getAttribute("act_vo");  %>
<form  method="post"  action="<%=request.getContextPath() %>/act_management/act_managementServlet" enctype="multipart/form-data">
<input type="hidden" name="start_act2.jsp" value="<%=request.getServletPath() %>">
<input type="hidden"  name="action" value="start_act_to_pg3">


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



<div class="container">
  <div class="col-md-12">
 
            
    <div class="actionPic">
          <div class="form-group">
  				  <label for="exampleInputFile"  class="h3">活動照片1</label>
  					  <input type="file" id="myfiles"    name="act_pic1"  value="">
 					 	<output id="mylist">
 					 	
 					 <%-- 如果上架失敗，將之前上傳的那一張用base64編碼後秀出來預覽，讓使用者不用重新上傳 --%>
 					 	
 					 	<% 
 					 	String act_pic1="";
  						  if(act_vo!=null){
 					 	byte[] data=act_vo.getAct_pic1();
  						StringBuilder sb = new StringBuilder();
  						sb.append("data:image/png;base64,");
  						sb.append(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(data));
  						act_pic1 = sb.toString();
  						}else{
  							act_pic1="";
  						}
 						%>	
 					 	<img class="memory"  src="<%=act_pic1 %>">
 					 	</output>
  						</div>
  						 <div class="form-group">
  				  <label for="exampleInputFile"  class="h3">活動照片2</label>
  					  <input type="file" id="myfiles2"  name="act_pic2"  value="">
 					 	<output id="mylist2">
 					 	
 					 	<%-- 如果上架失敗，將之前上傳的那一張用base64編碼後秀出來預覽，讓使用者不用重新上傳 --%>
 					 	
 					 	<% 
 					 	String act_pic2="";
  						  if(act_vo!=null){
 					 	byte[] data=act_vo.getAct_pic2();
  						StringBuilder sb = new StringBuilder();
  						sb.append("data:image/png;base64,");
  						sb.append(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(data));
  						act_pic2 = sb.toString();
  						}else{
  							act_pic2="";
  						}
 						%>	
 					 	<img  class="memory" src="<%=act_pic2 %>">
 					 	</output>
  						</div>
  						 <div class="form-group">
  				  <label for="exampleInputFile"  class="h3">活動照片3</label>
  					  <input type="file" id="myfiles3"  name="act_pic3"  value="">
 					 	<output id="mylist3">
 					 	
 					 	<%-- 如果上架失敗，將之前上傳的那一張用base64編碼後秀出來預覽，讓使用者不用重新上傳 --%>
 					 	
 					 	<% 
 					 	String act_pic3="";
  						  if(act_vo!=null){
 					 	byte[] data=act_vo.getAct_pic3();
  						StringBuilder sb = new StringBuilder();
  						sb.append("data:image/png;base64,");
  						sb.append(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(data));
  						act_pic3 = sb.toString();
  						}else{
  							act_pic3="";
  						}
 						%>	
 					 	<img  class="memory" src="<%=act_pic3 %>">
 					 	</output>
  						</div>
  						
        </div>
    <div class="form-group">
                <label for="dtp_input1" class="col-md-2 control-label  ">活動開始時間</label>
                <div class="input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy-mm-dd hh:ii:00" data-link-field="dtp_input1">
                    <input class="form-control  test act_op_date" size="16" type="text"  name="act_op_date"    value="${(act_vo==null)?"":act_op_date }">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
          
                <label for="dtp_input1" class="col-md-2 control-label ">活動結束時間</label>
                <div class="input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy-mm-dd hh:ii:00" data-link-field="dtp_input1">
                    <input class="form-control  test act_ed_date" size="16" type="text"  name="act_ed_date"    value="${(act_vo==null)?"":act_ed_date }" >
                    <div class="input-group-addon "><span class="glyphicon glyphicon-remove"></span></div>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>  
            <div class="host">
          <h2>主辦單位簡介</h2>
          <textarea class="form-control host_cont" rows="2" cols="20" wrap="hard" placeholder="介紹一下你自己吧~"   name="org_cont">${(act_vo==null)?"":act_vo.org_cont }</textarea>
        </div>
    <div class="introduce">
          <h2>活動介紹:</h2>
          <textarea class="form-control  introduct" rows="2" cols="20" wrap="hard" placeholder="說明一下這個精彩絕倫的活動~"  name="act_cont">${(act_vo==null)?"":act_vo.act_cont }</textarea>
        </div>
    
    
  </div>
</div>

<div class="next">
  <a class="btn-success btn-lg previous"  href="<%=request.getContextPath() %>/FrontEnd/act/start_act.jsp" >上一步</a>
  <button type="submit"  class="btn-success btn-lg end">完成</button>
</div>
</form>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.mi'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

  <%--date picker專用js --%> 
     <script type="text/javascript"  src="<%=request.getContextPath()%>/BackEnd/res/js/bootstrap-datetimepicker.js"></script> 
 <script type="text/javascript"  src="<%=request.getContextPath()%>/BackEnd/res/js/bootstrap-datetimepicker.fr.js"></script>
 
 <script>
 for(var i=0;i<$(".memory").length;i++){
	 if($(".memory").eq(i).attr("src")=="data:image/png;base64,null"){
		 $(".memory").eq(i).css("display","none");
	 }
 }
 
 
 
 <%-- 修正日曆會選取到秒數 強制將秒數設成0 --%>
 $(".act_op_date").change(function(){
 var de=$(".act_op_date").val();
 new_time=  de.substring(0,17)+"00";
 $(".act_op_date").val(new_time);
 })
 
 <%-- 修正日期會跑出秒數以下的部分 --%>
 var act_op_date= $(".act_op_date").val().substring(0,19);
 $(".act_op_date").val(act_op_date);
 
 <%-- 修正日曆會選取到秒數 強制將秒數設成0 --%>
 $(".act_ed_date").change(function(){
 var de=$(".act_ed_date").val();
 new_time=  de.substring(0,17)+"00";
 $(".act_ed_date").val(new_time);
 })
 
 <%-- 修正日期會跑出秒數以下的部分 --%>
 var act_ed_date= $(".act_ed_date").val().substring(0,19);
 $(".act_ed_date").val(act_ed_date);
 
 
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
 
 // 上傳預覽1
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
 
 
 // 上傳預覽2
	function handleFileSelect2(evt) {
		$("#mylist2").empty();
		
		
		
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
	          document.getElementById('mylist2').insertBefore(span, null);
	          $(".thumb").width(150).height(100);
	                        
	        };
	      })(f);

	      // Read in the image file as a data URL.
	      reader.readAsDataURL(f);
	    }
	  }
	  document.getElementById('myfiles2').addEventListener('change', handleFileSelect2, false);
	  
	  　 // 上傳預覽3
		function handleFileSelect3(evt) {
			$("#mylist3").empty();
			
			
			
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
		          document.getElementById('mylist3').insertBefore(span, null);
		          $(".thumb").width(150).height(100);
		                        
		        };
		      })(f);

		      // Read in the image file as a data URL.
		      reader.readAsDataURL(f);
		    }
		  }
		  document.getElementById('myfiles3').addEventListener('change', handleFileSelect3, false);
	  
	  
 </script>
 
 
</body>
</html>
