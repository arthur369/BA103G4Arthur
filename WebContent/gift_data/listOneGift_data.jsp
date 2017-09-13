<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.gift_data.model.*"%>
<%
Gift_dataVO gift_dataVO = (Gift_dataVO) request.getAttribute("gift_data_vo"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<html>
<head>
<title>贈品資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>


<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>贈品資料 - ListOneGift_data.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>贈品編號</th>
		<th>贈品名稱</th>
		<th>剩餘數量</th>
		<th>贈品描述</th>
		<th>贈品圖片</th>
		<th>兌換所需積分</th>
		<th>贈品上架時間</th>
	</tr>
	<tr align='center' valign='middle'>
	<% 
	byte[] data=gift_dataVO.getGift_img();
	StringBuilder sb = new StringBuilder();
	sb.append("data:image/png;base64,");
	sb.append(com.sun.org.apache.xerces.internal.impl.dv.util.Base64.encode(data));
	String gift_img = sb.toString();
	
	 
	%>
		<td><%=gift_dataVO.getGift_no()%></td>
		<td><%=gift_dataVO.getGift_name()%></td>
		<td><%=gift_dataVO.getGift_remain()%></td>
		<td><%=gift_dataVO.getGift_cont()%></td>
		<td>
		<img src="<%=gift_img%>"   >
		
		
		</td>
		<td><%=gift_dataVO.getGift_pt()%></td>
		<td><%=gift_dataVO.getGift_launch_date()%></td>
	</tr>
	
</table>

</body>
</html>
