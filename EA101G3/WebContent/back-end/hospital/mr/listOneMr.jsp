<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mr.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
MrVO mrVO = (MrVO) request.getAttribute("mrVO");//DocServlet.java(Concroller), 存入req的docVO物件
%>

<jsp:useBean id="apptSvc" scope="page" class="com.appt.model.ApptService" />
<jsp:useBean id="optSvc" scope="page" class="com.opt.model.OptService" />

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











</style>
</head>

<body>
		<%@ include file="/back-end/backEndInclude/header.jsp" %>

	<!-- ****************************以下為實際功能頁變更區域**************************** -->
<span class="mainTitle">診療紀錄管理 <button type="button" class="btn btn-info" id="addbtn" onclick="location.href='<%=request.getContextPath()%>/back-end/hospital/mr/select_page.jsp'">返回</button></span>

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
<jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />
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
	
</table>

</div>




<footer class="Footer">Copyright © 萌寵家族 Cute Family
</footer>


</div>

</div>

</body>

</html>