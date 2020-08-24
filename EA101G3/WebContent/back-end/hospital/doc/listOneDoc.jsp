<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.doc.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  DocVO docVO = (DocVO) request.getAttribute("docVO"); //DocServlet.java(Concroller), 存入req的docVO物件
%>
<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />

<!DOCTYPE html>
<html>
<%@ include file="/back-end/backEndInclude/head.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>
table {
	width: 100%;
	background-color: white;
	
}

img
{
  max-width:200px; height:auto;
  vertical-align: middle;
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
<span class="mainTitle">醫師查詢 <button type="button" class="btn btn-info" id="addbtn" onclick="location.href='<%=request.getContextPath()%>/back-end/hospital/doc/select_page.jsp'">返回</button></span>

	<hr class="mainTitlehr">
		 
	


		

<table class="table table-striped">
	<tr>
		<th width="9%">醫生編號</th>
		<th width="9%">科別</th>
		<th width="9%">姓名</th>
		<th width="9%">診間號碼</th>
		<th width="9%">年資</th>
		<th class="text-center" width=>介紹</th>
		<th>醫生照片</th>
		<th width="9%">在職狀態</th>
		<th>修改</th>
	</tr>
	<tr>
		<td><%=docVO.getDocno()%></td>
		<td><c:forEach var="divVO" items="${divSvc.all}">
            <c:if test="${divVO.divno==docVO.divno}">
	                   ${divVO.divname}</font>
            </c:if>
            </c:forEach></td>
		<td><%=docVO.getDocname()%></td>
		<td><%=docVO.getRoomno()%></td>
		<td><%=docVO.getSeniority()%></td>
		<td width="40%"  align="left"><%=docVO.getIntro()%></td>
		<td>
			<img alt="" src="<%=request.getContextPath()%>/back-end/doc/ShowDocPic.do?docno=${docVO.docno}" id="display">
		</td>
		<td width="5%"><%=docVO.getDocstatus()%></td>
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" style="margin-bottom: 0px;">
			     <input type="image" src="<%=request.getContextPath()%>/back-end/hospital/mr/images/icons/edit.jpg" width="40" height="40">
			     <input type="hidden" name="docno"  value="${docVO.docno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
		</td>
	</tr>
</table>

	<!-- ****************************以上為實際功能頁變更區域*************************** -->

</div>




<%@ include file="/back-end/backEndInclude/footer.jsp"%>


</div>

</div>


</body>
</html>