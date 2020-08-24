<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.opt.model.*"%>
<%@ page import="com.mem.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	OptVO optVO = (OptVO) request.getAttribute("optVO"); //存入req的optVO物件

%>
<jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />
<jsp:useBean id="petSvc" scope="page"
	class="com.MemberPet.model.MemberPetService" />
<html>
<head>
<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
table {
	width: 100%;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 2px solid grey;
	font-size: 24px;
	
}

table, th, td {
	text-align: center;
	
}

th {
	padding: 5px;
	background-color: #E1F5FF;
	
}

th, td {
	
	padding: 5px;
}
.mainTitlehr{
	background-color:#E1F5FF;
	color:#E1F5FF;
	
	height:2px;
	
}
.submit {
	/* margin-left:45%; */
	font-size: 24px;
}

.main {
	width: 90%;
	margin: 0 auto;
	font-family: 'Noto Sans TC';
}

.mainTitle {
	font-size: 32px;
	font-weight:bold;
}
</style>


</head>
<body>

	<%@ include file="/front-end/frontEndInclude/header.jsp"%>
	<script>
	 swal("預約成功!", "", "success");
	
	</script>
	
	<div class="main">
		<span class="mainTitle">掛號預約內容</span>

		<!-- 	<a href="dispOpt.jsp">重新選擇</a> -->


		<hr class="mainTitlehr">
			<table>
				<tr>
					<th>門診日期</th>
					<th>門診時段</th>
					<th>科別</th>
					<th>獸醫師</th>
					<th>診間</th>
					<th>預約號碼</th>
				</tr>
				<tr>

					<%-- 			<td>${optVO.sessionNo}</td> --%>
					<td><fmt:formatDate value="${optVO.optDate}"
							pattern="yyyy/MM/dd (E)" /></td>
					<td>${optVO.optSession}</td>
					<td>
						<!-- 			暫時寫死3個科別(整合後修改) --> <c:forEach var="docVO"
							items="${docSvc.all}">
							<c:if test="${optVO.docNo==docVO.docno}">
	                    ${(docVO.divno == 'D01')?'貓科':(docVO.divno == 'D02')?'犬科':'其他科'}
                    </c:if>
						</c:forEach>

					</td>
					<td><c:forEach var="docVO" items="${docSvc.all}">
							<c:if test="${optVO.docNo==docVO.docno}">
	                    ${docVO.docname}
                    </c:if>
						</c:forEach></td>
					<td><c:forEach var="docVO" items="${docSvc.all}">
							<c:if test="${optVO.docNo==docVO.docno}">
	                    ${docVO.roomno}診
                    </c:if>
						</c:forEach></td>
<%-- 						<jsp:useBean id="optSvc" scope="page" class="com.opt.model.OptService" /> --%>
<%-- 						<c:forEach var="docVO" items="${docSvc.all}"> --%>
<%-- 							<c:if test="${optVO.docNo==docVO.docno}"> --%>
<%-- 	                    		${docVO.roomno}診 --%>
<%--                     		</c:if> --%>
<%-- 						</c:forEach> --%>
					<td><span style="font-size : 24px;color:red;font-weight:bold;">${optVO.currentCount+1}</span></td>
					<%-- 			<td>${optVO.maximum}</td> --%>

				
				</tr>
			</table>
			<br>
			<div style="width: 100%" align="center">
				<span style="font-size : 36px;color:#0E923A;font-weight:bold;">預約掛號成功</span>
				
			</div>
			<div style="width: 100%" align="center">
				<span style="font-size : 24px;color:black;">可隨時至預約查詢確認預約資料喔！</span>
				
			</div>


			
		
		
	</div>



	<%@ include file="/front-end/frontEndInclude/footer.jsp"%>


</body>



</html>

