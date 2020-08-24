<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page import="java.util.*"%>
<%@ page import="com.mr.model.*"%>

<%-- 萬用複合查詢-可由客戶端select_page.jsp隨意增減任何想查詢的欄位 --%>
<%-- 此頁只作為複合查詢時之結果練習，可視需要再增加分頁、送出修改、刪除之功能--%>

<jsp:useBean id="listMr_ByCompositeQuery" scope="request" type="java.util.List<MrVO>" />
<jsp:useBean id="apptSvc" scope="page" class="com.appt.model.ApptService" />
<jsp:useBean id="optSvc" scope="page" class="com.opt.model.OptService" />
<jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />

<!DOCTYPE html>
<html>
<%@ include file="/back-end/backEndInclude/head.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>
table {
	width: 100%;
	background-color: white;
	
}

table, th, td {
	
}

th {
	background-color: lightcoral;
}


.form-control{
display:inline;
width:200px;
}







</style>

</head>
<body>


	<%@ include file="/back-end/backEndInclude/header.jsp"%>
	
	<!-- ****************************以下為實際功能頁變更區域**************************** -->

	<span class="mainTitle">診療紀錄管理</span><button type="button" class="btn btn-info" id="addbtn" onclick="location.href='<%=request.getContextPath()%>/back-end/hospital/mr/select_page.jsp'">返回</button>

	<hr class="mainTitlehr">
	<table class="table table-striped">
	<tr>
		<th>就診紀錄編號</th>
		<th>約診編號</th>
		<th>醫生姓名</th>
		<th>會員寵物編號</th>
		<th>診斷症狀</th>
		<th>診斷處方</th>
		<th>預約費用</th>
		<th>藥品費用</th>
		<th>手術費用</th>
		<th>修改</th>
		
	</tr>

	<c:forEach var="mrVO" items="${listMr_ByCompositeQuery}">
		
		<tr>
			<td>${mrVO.mrno}</td>
			<td>${mrVO.apptno}</td>
			<td>
			
			<c:forEach var="docVO" items="${docSvc.all}">
            <c:if test="${mrVO.docno==docVO.docno}">
	                   ${docVO.docname}</font>
            </c:if>
            </c:forEach>
			</td>
			<td>${mrVO.petno}</td>
			<td>${mrVO.symptom}</td>
			<td>${mrVO.prescription}</td>
			<td>${mrVO.apptfee}</td> 
			<td>${mrVO.medfee}</td>  
			<td>${mrVO.operfee}</td>   
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/mr/mr.do" style="margin-bottom: 0px;">
			     <input type="image" src="<%=request.getContextPath()%>/back-end/hospital/mr/images/icons/edit.jpg" width="20" height="20">
			     <input type="hidden" name="mrno"  value="${mrVO.mrno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			
		</tr>
	</c:forEach>
</table>

</div>




<footer class="Footer">Copyright © 萌寵家族 Cute Family
</footer>


</div>

</div>

</body>

</html>