<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.gift_data.model.*"%>
<%
Gift_dataVO gift_dataVO = (Gift_dataVO) request.getAttribute("gift_data_vo"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>
<html>
<head>
<title>�ث~��� - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>


<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�ث~��� - ListOneGift_data.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>�ث~�s��</th>
		<th>�ث~�W��</th>
		<th>�Ѿl�ƶq</th>
		<th>�ث~�y�z</th>
		<th>�ث~�Ϥ�</th>
		<th>�I���һݿn��</th>
		<th>�ث~�W�[�ɶ�</th>
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
