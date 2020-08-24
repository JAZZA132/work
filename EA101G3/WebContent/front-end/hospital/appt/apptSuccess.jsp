<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.opt.model.*"%>
<%@ page import="com.mem.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	OptVO optVO = (OptVO) request.getAttribute("optVO"); //�s�Jreq��optVO����

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
	 swal("�w�����\!", "", "success");
	
	</script>
	
	<div class="main">
		<span class="mainTitle">�����w�����e</span>

		<!-- 	<a href="dispOpt.jsp">���s���</a> -->


		<hr class="mainTitlehr">
			<table>
				<tr>
					<th>���E���</th>
					<th>���E�ɬq</th>
					<th>��O</th>
					<th>�~��v</th>
					<th>�E��</th>
					<th>�w�����X</th>
				</tr>
				<tr>

					<%-- 			<td>${optVO.sessionNo}</td> --%>
					<td><fmt:formatDate value="${optVO.optDate}"
							pattern="yyyy/MM/dd (E)" /></td>
					<td>${optVO.optSession}</td>
					<td>
						<!-- 			�Ȯɼg��3�Ӭ�O(��X��ק�) --> <c:forEach var="docVO"
							items="${docSvc.all}">
							<c:if test="${optVO.docNo==docVO.docno}">
	                    ${(docVO.divno == 'D01')?'�߬�':(docVO.divno == 'D02')?'����':'��L��'}
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
	                    ${docVO.roomno}�E
                    </c:if>
						</c:forEach></td>
<%-- 						<jsp:useBean id="optSvc" scope="page" class="com.opt.model.OptService" /> --%>
<%-- 						<c:forEach var="docVO" items="${docSvc.all}"> --%>
<%-- 							<c:if test="${optVO.docNo==docVO.docno}"> --%>
<%-- 	                    		${docVO.roomno}�E --%>
<%--                     		</c:if> --%>
<%-- 						</c:forEach> --%>
					<td><span style="font-size : 24px;color:red;font-weight:bold;">${optVO.currentCount+1}</span></td>
					<%-- 			<td>${optVO.maximum}</td> --%>

				
				</tr>
			</table>
			<br>
			<div style="width: 100%" align="center">
				<span style="font-size : 36px;color:#0E923A;font-weight:bold;">�w���������\</span>
				
			</div>
			<div style="width: 100%" align="center">
				<span style="font-size : 24px;color:black;">�i�H�ɦܹw���d�߽T�{�w����Ƴ�I</span>
				
			</div>


			
		
		
	</div>



	<%@ include file="/front-end/frontEndInclude/footer.jsp"%>


</body>



</html>

