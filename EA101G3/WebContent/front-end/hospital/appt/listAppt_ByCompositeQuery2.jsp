<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page import="java.util.*"%>
<%@ page import="com.appt.model.*"%>

<%-- 萬用複合查詢-可由客戶端select_page.jsp隨意增減任何想查詢的欄位 --%>
<%-- 此頁只作為複合查詢時之結果練習，可視需要再增加分頁、送出修改、刪除之功能--%>

<jsp:useBean id="listAppt_ByCompositeQuery2" scope="request" type="java.util.List<ApptVO>" />
<jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />
<jsp:useBean id="optSvc" scope="page" class="com.opt.model.OptService" />


<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>預約查詢</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css'><link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/appt/style.css">

</head>
<body>

<!-- partial:index.partial.html -->
<c:forEach var="apptVO" items="${listAppt_ByCompositeQuery2}">
<div class="courses-container">
	<div class="course">
		<div class="course-preview">
	
			<h3>寵物編號${apptVO.petNo}</h3>
			<h2>
			<c:forEach var="optVO" items="${optSvc.all}">
            <c:if test="${apptVO.sessionno==optVO.sessionNo}">
	        ${optVO.optDate}<br>${optVO.optSession}  
	        </c:if>
            </c:forEach>
            
            </h2>
			<a href="#">約診號${apptVO.apptno}</a>
		</div>
		
		<div class="course-info">
			<table>
	<tr><td>
			<c:forEach var="optVO" items="${optSvc.all}"> 
			<c:forEach var="docVO" items="${docSvc.all}">
            <c:if test="${(apptVO.sessionno==optVO.sessionNo)&&(optVO.docNo==docVO.docno)}">
	       <h6> ${docVO.docno}</h6><h2>${docVO.docname}</h2>
            </c:if>
            </c:forEach>
            </c:forEach>
            
            <h3> 診間號<c:forEach var="optVO" items="${optSvc.all}"> 
			<c:forEach var="docVO" items="${docSvc.all}">
            <c:if test="${(apptVO.sessionno==optVO.sessionNo)&&(optVO.docNo==docVO.docno)}">
	        ${docVO.roomno}
            </c:if>
            </c:forEach>
            </c:forEach>
            <br>
			看診號 ${apptVO.seqno}<br>
			寵物症狀:${apptVO.symdesc}</h3>
			<td>
			<br>
			
			</td>
		</td>
			<td>
			
				<img src="<%=request.getContextPath()%>/front-end/appt/ShowSymPhoto.do?apptno=${apptVO.apptno}" id="display" width="200" height="200">
			</td>
</tr>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/appt/appt.do">
			<button class="btn" type="submit" value="Submit">取消</button>
			<td>
			     <input type="hidden" name="apptno"  value="${apptVO.apptno}">
			     <input type="hidden" name="action" value="cancel"></FORM>
			</td>
		</table>
		</div>
	</div>
</div>

	</c:forEach>
<!--panel-->



<button class="floating-btn">
	<a href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page3.jsp" style="color:white;">回門診首頁</a>
</button>

<div class="floating-text">
	 <a href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page.jsp">前往預約門診</a>
</div>
</div>

<!-- partial -->
  <script  src="<%=request.getContextPath()%>/front-end/hospital/appt/script.js"></script>

</body>
</html>
