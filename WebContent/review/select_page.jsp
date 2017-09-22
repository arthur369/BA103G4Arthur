<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.gift_data.model.*"%>
<html>
<head><title>IBM Emp: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Emp: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>


<p>This is the Home page for IBM Emp: Home</p>

<h3>��Ƭd��:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<ul>
  <li><a href='listAllGift_data.jsp'>List</a> all Emps. </li> <br><br>
  
  <li>
    <FORM METHOD="post" ACTION="gift_dataServlet" >
        <b>�I���ث~�s�� (�pG1000000001):</b>
        <input type="text" name="GIFT_NO">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="gift_dataSvc" scope="page" class="com.gift_data.model.Gift_dataService" />
   
  <li>
     <FORM METHOD="post" ACTION="gift_dataServlet" >
       <b>�I���ث~�s��:</b>
       <select size="1" name="GIFT_NO">
         <c:forEach var="gift_data_VO" items="${gift_dataSvc.all}" > 
          <option value="${gift_data_VO.gift_no}">${gift_data_VO.gift_no}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="gift_dataServlet" >
       <b>����ث~�W��:</b>
       <select size="1" name="GIFT_NO">
         <c:forEach var="gift_data_VO" items="${gift_dataSvc.all}" > 
          <option value="${gift_data_VO.gift_no}">${gift_data_VO.gift_name}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
</ul>


<h3>�ث~�޲z</h3>

<ul>
  <li><a href='addGift_data.jsp'>Add</a> a new Gift_Data.</li>
</ul>

</body>

</html>
