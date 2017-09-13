<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.gift_data.model.*"%>
<%-- 此頁採用 JSTL 與 EL 取值 --%>

<%
    Gift_dataService gift_dataSvc = new Gift_dataService();

List<Gift_dataVO> list=gift_dataSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>所有員工資料 - listAllGift_data.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>所有員工資料 - ListAllGift_data.jsp</h3>
		          <a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></td></tr></table>

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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>兌換贈品編號</th>
		<th>贈品名稱</th>
		<th>剩餘數量</th>
		<th>贈品描述</th>
		<th>贈品圖片</th>
		<th>兌換所需積分</th>
		<th>贈品上架時間</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
	<%@ include file="page1.file" %> 
		<% 
		for(int i=pageIndex;(i<list.size()) && (i<pageIndex+rowsPerPage-1);i++){
		%>
		<tr align='center' valign='middle'>
			<% 
			byte[] data=list.get(i).getGift_img();
	StringBuilder sb = new StringBuilder();
	sb.append("data:image/png;base64,");
	sb.append(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(data));
	String gift_img = sb.toString();
	%>	
	 <td><%=list.get(i).getGift_no() %></td>
	 <td><%=list.get(i).getGift_name() %></td>
	 <td><%=list.get(i).getGift_remain() %></td>
	 <td><%=list.get(i).getGift_cont() %></td>
	 <td><img src="<%=gift_img %>"></td>
	 <td><%=list.get(i).getGift_pt() %></td>
	 <td><%=list.get(i).getGift_launch_date() %></td>
	 <td>
			  <FORM METHOD="post" ACTION="gift_dataServlet">
			     <input type="submit" value="修改">
			     <input type="hidden" name="GIFT_NO" value="<%=list.get(i).getGift_no() %>">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="gift_dataServlet">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="GIFT_NO" value="<%=list.get(i).getGift_no() %>">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
		
<% 	} %>
	</table>
	<%--
	<%@ include file="page1.file" %> 
	<c:forEach var="gift_data_VO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${gift_data_VO.gift_no}</td>
			<td>${gift_data_VO.gift_name}</td>
			<td>${gift_data_VO.gift_remain}</td>
			<td>${gift_data_VO.gift_cont}</td>
		
			
			<td>
			
			<img src="<%=gift_img%>"   >
			</td>
			<td>${gift_data_VO.gift_pt}</td>
			<td>${gift_data_VO.gift_launch_date}</td>
			<td>
			  <FORM METHOD="post" ACTION="gift_dataServlet">
			     <input type="submit" value="修改">
			     <input type="hidden" name="GIFT_NO" value="${gift_data_VO.gift_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="gift_dataServlet">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="GIFT_NO" value="${empVO.empno}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
 --%>
<%@ include file="page2.file" %>

</body>
</html>
