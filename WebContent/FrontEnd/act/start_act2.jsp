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

<form  method="post"  action="<%=request.getContextPath() %>/act_management/act_managementServlet">
<input type="hidden" name="start_act2.jsp" value="<%=request.getServletPath() %>">
<input type="hidden"  name="action" value="start_act_to_pg3">


<h1 class="title">填寫活動資訊</h1>
<div class="container">
  <div class="col-md-12">
 
            
    <div class="actionPic">
          <div class="form-group">
  				  <label for="exampleInputFile"  class="h3">活動照片1</label>
  					  <input type="file" id="myfiles"    name="act_pic1"  value="">
 					 	<output id="mylist">
 					 	
 					 	<img src="">
 					 	</output>
  						</div>
  						 <div class="form-group">
  				  <label for="exampleInputFile"  class="h3">活動照片2</label>
  					  <input type="file" id="myfiles2"  name="act_pic2"  value="">
 					 	<output id="mylist2">
 					 	
 					 	<img src="">
 					 	</output>
  						</div>
  						 <div class="form-group">
  				  <label for="exampleInputFile"  class="h3">活動照片3</label>
  					  <input type="file" id="myfiles3"  name="act_pic3"  value="">
 					 	<output id="mylist3">
 					 	
 					 	<img src="">
 					 	</output>
  						</div>
  						
        </div>
    <div class="form-group">
                <label for="dtp_input1" class="col-md-2 control-label  ">活動開始時間</label>
                <div class="input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy-mm-dd HH:ii:ss" data-link-field="dtp_input1">
                    <input class="form-control  test" size="16" type="text"  name="act_op_date"    value=""  ">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
          
                <label for="dtp_input1" class="col-md-2 control-label ">活動結束時間</label>
                <div class="input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy-mm-dd HH:ii:ss" data-link-field="dtp_input1">
                    <input class="form-control  test" size="16" type="text"  name="act_ed_date"    value="" >
                    <div class="input-group-addon "><span class="glyphicon glyphicon-remove"></span></div>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>  
            <div class="host">
          <h2>主辦單位簡介</h2>
          <textarea class="form-control host_cont" rows="2" cols="20" wrap="hard" placeholder="留言"   name="org_cont"></textarea>
        </div>
    <div class="introduce">
          <h2>活動介紹:</h2>
          <textarea class="form-control  introduct" rows="2" cols="20" wrap="hard" placeholder="留言"  name="act_cont"></textarea>
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
