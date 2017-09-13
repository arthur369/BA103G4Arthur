<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.gift_data.model.*"%>

<%
Gift_dataVO gift_dataVO = (Gift_dataVO) request.getAttribute("gift_dataVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<html>
<head>
<title>贈品資料修改 - update_gift_data_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>


<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>贈品資料修改 - update_emp_input.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></td>
	</tr>
</table>

<h3>資料修改:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/gift_data/gift_dataServlet"name="form1" enctype="multipart/form-data">
<table border="0">
<jsp:useBean id="gift_dataSvc" scope="page" class="com.gift_data.model.Gift_dataService" />
	
	<tr>
		<td>兌換贈品編號:<font color=red><b>*</b></font></td>
		<td><%=gift_dataVO.getGift_no()%></td>
	</tr>
	
	<tr>
		<td>贈品名稱:</td>
		<td><input type="TEXT" name="gift_name" size="45" value="<%=gift_dataVO.getGift_name()%>" /></td>
	</tr>
	<tr>
		<td>剩餘數量:</td>
		<td><input type="TEXT" name="gift_remain" size="45"	value="<%=gift_dataVO.getGift_remain()%>" /></td>
	</tr>
	<tr>
		<td>贈品描述:</td>
		<td><input type="TEXT" name="gift_cont" size="45"	value="<%=gift_dataVO.getGift_cont()%>" /></td>
	</tr>
	<tr>
	<% 
	byte[] data=gift_dataVO.getGift_img();
	StringBuilder sb = new StringBuilder();
	sb.append("data:image/png;base64,");
	sb.append(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(data));
	String gift_img = sb.toString();
	
	 
	%>
	
	
		<td>贈品圖片:<img src="<%=gift_img%>"></td>
		<td><input type="file" name="gift_img" size="45"
			value="<%= (gift_dataVO==null)? "hextoraw('b0102')" : gift_dataVO.getGift_img()%>" /></td>
	</tr>
	<tr>
		<td>兌換所需積分:</td>
		<td><input type="TEXT" name="gift_pt" size="45"	value="<%=gift_dataVO.getGift_pt()%>" /></td>
	</tr>
	<tr>
		<td>贈品上架時間:</td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="gift_launch_date" value="<%=gift_dataVO.getGift_launch_date()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','gift_launch_date','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
		</td>
	</tr>
	
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="gift_no" value="<%=gift_dataVO.getGift_no()%>">
<input type="submit" value="送出修改"></FORM>

</body>
</html>
