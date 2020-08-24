<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page import="java.util.*"%>
<%@ page import="com.appt.model.*"%>

<%-- 萬用複合查詢-可由客戶端select_page.jsp隨意增減任何想查詢的欄位 --%>
<%-- 此頁只作為複合查詢時之結果練習，可視需要再增加分頁、送出修改、刪除之功能--%>

<jsp:useBean id="listAppt_ByCompositeQuery" scope="request" type="java.util.List<ApptVO>" />

 <% 
 ApptService apptSvc = new ApptService();
 List<ApptVO> list  = listAppt_ByCompositeQuery;
 pageContext.setAttribute("list",list);
 %>
 
<html>
<head><title>看診進度 </title>
<meta http-equiv="refresh" content="10;URL=<%=request.getContextPath()%>/front-end/hospital/appt/queue1.jsp">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
	integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
	crossorigin="anonymous">
</head>
<body bgcolor='white'>

<h1>

 ${listAppt_ByCompositeQuery.sessionno}
 <jsp:useBean id="optSvc" scope="page" class="com.opt.model.OptService" />
 
 
 <c:forEach var="optVO" items="${optSvc.all}">
				<c:if test="${listAppt_ByCompositeQuery.sessionno==optVO.sessionNo}"> 
 				【${(optVO.currentCount)}】
 				
 				</c:if> 
			</c:forEach>

<c:choose>
    <c:when test="${fn:length(listAppt_ByCompositeQuery)==0}">
       <i class="fas fa-exclamation-circle"></i> 今日沒有看診
    </c:when>
    <c:otherwise>
        <i class="fas fa-user-md"></i>目前看診號${fn:length(listAppt_ByCompositeQuery)+1}
    </c:otherwise>
</c:choose>


</body>
</html>