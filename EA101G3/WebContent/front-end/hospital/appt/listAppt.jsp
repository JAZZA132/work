<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String memNO = (String) session.getAttribute("memNO");
%>

<html>

<head>

</head>

<title>IBM Emp: Home</title>

<%--自動送出 --%>
<body onload="document.form1.submit()"> 
<%-- 萬用複合查詢-以下欄位-可隨意增減 --%>
<ul>  
  <li>   
  <%--自動刷新--%>
    <FORM id="form1" METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/appt/appt.do" name="form1">
        
        
           
<input type="hidden" name="memno" value="${memNO}">
<input type="hidden" name="optstate" value="0">
       
		        
<!--         <input type="submit" value="送出"> -->
        <input type="hidden" name="action" value="listAppt_ByCompositeQuery2">
				</FORM>
  </li>
</ul>



</body>

</html>