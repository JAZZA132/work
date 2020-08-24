<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.accusation.model.*"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/member/accusation/sockettest.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/frontEndInclude/style.css">
<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<%@ include file="/front-end/frontEndInclude/header.jsp"%>
<!DOCTYPE html>

<%
	AccusationVO accVO = (AccusationVO) request.getAttribute("accVO");
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>萌寵家族</title>

<style>
.navbar-brand {
	font-family: 'Pacifico';
	font-size: 35px;
	color: lightcoral !important;
}

.menu-right-btn {
	padding: 13px 46px;
	margin-right: 4%;
	background-color: transparent;
	transition: all 300ms ease-in;
	font-family: 'Noto Sans TC';
	white-space: nowrap;
}

.menu-right-btn:hover {
	color: white;
	background-color: #00E8E8;
}


h3 ,td{
	font-size: 30px;
	margin: 15px;
	color: black !important;
	font-family: 'Noto Sans TC';
	white-space: nowrap;
}
h5{
	font-size: 50px;
	margin: 15px;
	color: black !important;
	font-family: 'Noto Sans TC';
	white-space: nowrap;
}
</style>


</head>

<body background="<%=request.getContextPath()%>/front-end/member/member/images/cat.jpg" style="background-size: Cover;">



	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div class="wrapper container mt-5">
		<div class="row justify-content-center align-items-center">

			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/acc.do" name="">
				<!-- 上方的圖 -->
				<h5>客訴區</h3>
				</td>
				<td>

					<h3>客訴內容:</h3>

					<table class="table " style="background-color: rgba(210, 210, 210, 0.6);">
						<tr>
							<!-- 		<td>客訴編號:</td> -->
							<td>
								<input type="hidden" name="accusationNo" size="45" value="<%=(accVO == null) ? "accusationNo" : accVO.getAccusationNo()%>" />
							</td>
						</tr>
						<tr>
							<td>客訴類型:</td>
							<td>
								<select name="accusationType" style="width: 100%" class="form form-control">
									<option value="商城">商城
									<option value="診所">診所
									<option value="旅館">旅館
									<option value="領養">領養
									<option value="會員">會員
									<option value="網頁">網頁
									<option value="員工">員工
									<option value="其他">其他
								</select>
							</td>
						</tr>
						<!-- 	原先的input先不用因為只有單行,可刪	<input type="TEXT" name="accusationContent" size="45" style="height:200px" -->
						<%-- 			 value="<%= (accVO==null)? "accusationContent" : accVO.getAccusationContent()%>" /> --%>
						<tr>
							<td>客訴內容:</td>
							<td>
								<textarea class="form form-control" name="accusationContent" style="width: 500px; height: 200px;"><%=(accVO == null) ? "退一步海闊天空喔~" : accVO.getAccusationContent()%></textarea>
							</td>
						</tr>
						<tr>
							<!-- 		<td>客訴狀態:</td> -->
							<td>
								<input type="hidden" name="accusationStatue" size="45" value="<%=(accVO == null) ? "1" : accVO.getAccusationStatue()%>" />
							</td>
						</tr>

					</table>

					<br>
					<input type="hidden" name="action" value="insert">
					<input type="submit" value="送出新增" class="btn btn-primary form form-control">
			</FORM>
		</div>
	</div>


	<%@ include file="/front-end/member/accusation/websocketjs.jsp"%>


	<!--     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
	<!--         integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
	<!--         crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>