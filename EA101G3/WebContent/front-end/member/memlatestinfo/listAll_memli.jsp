<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.memlatestinfo.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
        integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style2.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/frontEndInclude/style.css">
<%
	MemlatestinfoService mSvc = new MemlatestinfoService();
	List<MemlatestinfoVO> list = mSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<%@ include file="/front-end/frontEndInclude/header.jsp"%>

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
</style>
<body background="<%= request.getContextPath()%>/front-end/member/member/images/cat3.jpg" style="background-size:Cover;" >
<div class="container">
<div class="row justify-content-center align-items-center">
<table class="table table-hover text-nowrap ">
		 <h3>最新消息</h3>
	<tr>
		<th>訊息編號</th>
		<th>會員編號</th>
		<th>訊息內容</th>
<!-- 		<th>訊息修改</th> -->
		<th>訊息刪除</th>
	</tr>
	
	<c:forEach var="mliVO" items="${list}">
		<c:if test="${mliVO.memNo == mli}">
		<tr>
			<td>${mliVO.memLatestInfoNo}</td>
			<td>${mliVO.memNo}</td>
			<td>${mliVO.infoContent}</td>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mli.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="memliNO"  value="${mliVO.memLatestInfoNo}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mli.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除" class="btn btn-primary form form-control">
			     <input type="hidden" name="memLatestInfoNo"  value="${mliVO.memLatestInfoNo}">
			     <input type="hidden" name="memNO" value="${mliVO.memNo}"> <%--為了讓控制器跳轉後能知道是哪一個會員 --%>
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
		</c:if>		
		<c:if test="${mli == null}">
		<tr>
			<td>${mliVO.memLatestInfoNo}</td>
			<td>${mliVO.memNo}</td>
			<td>${mliVO.infoContent}</td>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mli.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="memliNO"  value="${mliVO.memLatestInfoNo}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mli.do" style="margin-bottom: 0px;">
			     <input
			      type="submit" value="刪除" class="btn btn-primary form form-control">
			     <input type="hidden" name="memLatestInfoNo"  value="${mliVO.memLatestInfoNo}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
		</c:if>	
	</c:forEach>
</table>
</div>
</div>

<c:if test="${not empty delete}">
		<script>
			swal("刪除成功", "", "success");
		</script>
</c:if>




	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>
</html>