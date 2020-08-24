<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.doc.model.*"%>
<%@ page import="com.div.model.*"%>

<jsp:useBean id="listDocs_ByDivno" scope="request" type="java.util.Set<DocVO>" /> <!-- 於EL此行可省略 -->
<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
<%
String divno = request.getParameter("divno");
pageContext.setAttribute("divno", divno); 
%>
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

img
{
  max-width:200px; height:auto;
  vertical-align: middle;
}








</style>
</head>

<body>
		<%@ include file="/back-end/backEndInclude/header.jsp" %>

	<!-- ****************************以下為實際功能頁變更區域**************************** -->
<span class="mainTitle">

			<c:forEach var="divVO" items="${divSvc.all}">
				<c:if test="${divno==divVO.divno}"> 
 				 
 				</b></h3>${(divVO.divname)}醫師檢索
 				</c:if> 
			</c:forEach>
 <button type="button" class="btn btn-info" id="addbtn" onclick="location.href='<%=request.getContextPath()%>/back-end/hospital/doc/select_page.jsp'">返回</button></span>

	<hr class="mainTitlehr">
		 

	</td></tr>
</table>
<table>
		
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table class="table table-striped">
		
	<tr>
		<th width="9%">醫生編號</th>
		<th width="9%">姓名</th>
		<th width="9%">診間號碼</th>
		<th width="9%">年資</th>
		<th class="text-center" width=>介紹</th>
		<th>醫生照片</th>
		<th width="9%">在職狀態</th>
		<th>修改</th>
	</tr>
	
	<c:forEach var="docVO" items="${listDocs_ByDivno}" >
		<tr>
			
			<td>${docVO.docno}</td>
			<td>${docVO.docname}</td>
			<td>${docVO.roomno}</td>
			<td>${docVO.seniority}</td>
			<td  width="40%"  align="left">${docVO.intro}</td> 
			<td>
			<img alt="" src="<%=request.getContextPath()%>/back-end/doc/ShowDocPic.do?docno=${docVO.docno}" id="display">
			</td>
			<td width="5%">${docVO.docstatus}</td>	
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" style="margin-bottom: 0px;">
			  <input type="image" src="<%=request.getContextPath()%>/back-end/hospital/mr/images/icons/edit.jpg" width="40" height="40">				     <input type="hidden" name="docno"  value="${docVO.docno}">
			  <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
		</td>		
		
		</tr>
	</c:forEach>
</table>



</body>
</html>