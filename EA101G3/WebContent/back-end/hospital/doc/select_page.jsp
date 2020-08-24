<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.doc.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    DocService docSvc = new DocService();
    List<DocVO> list = docSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
<html>
<%@ include file="/back-end/backEndInclude/head.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style type="text/css">
table {
	width: 100%;
	background-color: white;
	
}

.form-control{
display:inline;
width:200px;
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



#addbtn {
	float: right;
	font-size: 26px;
	padding: 5px 20px;
	margin-bottom: 20px;
}



</style>


</head>
<body>


	<%@ include file="/back-end/backEndInclude/header.jsp"%>

	<!-- ****************************以下為實際功能頁變更區域**************************** -->
<span class="mainTitle">所有醫師資料</span>

	<hr class="mainTitlehr">
		 
	


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
 <jsp:useBean id="docSvc2" scope="page" class="com.doc.model.DocService" />
	<table class="table table-striped">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" >
       <b>查詢醫師姓名:</b>
       <select class= "form-control" name="docno">
         <c:forEach var="docVO" items="${docSvc2.all}" > 
          <option value="${docVO.docno}">${docVO.docname}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <button type="submit" class="btn btn-primary">查詢</button>
     </FORM>
       <jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
     
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/div/div.do" >
       <b><font>查詢科別:</font></b>
       <select class= "form-control" size="1" name="divno">
         <c:forEach var="divVO" items="${divSvc.all}" > 
          <option value="${divVO.divno}">${divVO.divname}
         </c:forEach>   
       </select>
       <button type="submit" class="btn btn-primary">查詢</button>
       <input type="hidden" name="action" value="listDocs_ByDivno_A">
     </FORM>
     		<button type="button" class="btn btn-success" id="addbtn" onclick="location.href='<%=request.getContextPath()%>/back-end/hospital/doc/addDoc.jsp'">新增醫師</button>	
     
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
	<%@ include file="page1.file" %> 
	<c:forEach var="docVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${docVO.docno}</td>
			<td>
			<c:forEach var="divVO" items="${divSvc.all}">
            <c:if test="${divVO.divno==docVO.divno}">
	                   ${divVO.divname}</font>
            </c:if>
            </c:forEach>
			</td>
			<td>${docVO.docname}</td>
			<td>${docVO.roomno}</td>
			<td>${docVO.seniority}</td>
			<td width="40%" align="left">${docVO.intro}</td> 
			<td>
			<img alt="" src="<%=request.getContextPath()%>/back-end/doc/ShowDocPic.do?docno=${docVO.docno}" id="display">
			</td>
			<td width="5%">${docVO.docstatus}</td>
			<td align="center">
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" style="margin-bottom: 0px;">
			     <input type="image" src="<%=request.getContextPath()%>/back-end/hospital/mr/images/icons/edit.jpg" width="40" height="40">
			     <input type="hidden" name="docno"  value="${docVO.docno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="刪除"> -->
<%-- 			     <input type="hidden" name="docno"  value="${docVO.docno}"> --%>
<!-- 			     <input type="hidden" name="action" value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

	<!-- ****************************以上為實際功能頁變更區域*************************** -->
</div>




<%@ include file="/back-end/backEndInclude/footer.jsp"%>


</div>

</div>


</body>
</html>