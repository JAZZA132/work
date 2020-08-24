<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.memlatestinfo.model.*"%>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/backEndInclude/style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>

<% 
MemlatestinfoVO mliVO = (MemlatestinfoVO) request.getAttribute("mliVO");

%>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/back-end/backEndInclude/head.jsp"%>
</head>
<body>
<%@ include file="/back-end/backEndInclude/header.jsp"%>
<table id="table-1">
	<tr><td>
		 <h3>會員最新訊息資料 </h3>
	</td></tr>
</table>

<table class="table table-hover col-12">
	<thead class="thead-dark">
	<tr>
		<th>訊息編號</th>
		<th>會員編號</th>
		<th>訊息內容</th>
		<th>訊息修改</th>
		<th>訊息刪除</th>
	</tr>
	</thead>
	<tr>
		<td><%=mliVO.getMemLatestInfoNo()%></td>
		<td><%=mliVO.getMemNo()%></td>
		<td><%=mliVO.getInfoContent()%></td>
		<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mli.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改" class="btn btn-primary">
			     <input type="hidden" name="memliNO"  value="${mliVO.memLatestInfoNo}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
		</td>
		<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mli.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除" class="btn btn-primary">
			     <input type="hidden" name="memLatestInfoNo"  value="${mliVO.memLatestInfoNo}">
			     <input type="hidden" name="action" value="delete_B"> </FORM>
		</td>
	</tr>
</table>

</body>
<%@ include file="/back-end/backEndInclude/footer.jsp"%>
</html>