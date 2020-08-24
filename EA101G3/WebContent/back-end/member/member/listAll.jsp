<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/backEndInclude/style.css">
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!DOCTYPE html>
<html>
<%
	MemberService mSvc = new MemberService();
	List<com.mem.model.MemberVO> list = mSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<head>
<meta charset="UTF-8">
<%@ include file="/back-end/backEndInclude/head.jsp"%>
</head>
<body>
<%@ include file="/back-end/backEndInclude/header.jsp"%>
<table id="table-1" >
	<tr ><td>
		 <h3>所有會員資料</h3>
	</td></tr>
</table>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red">請修正以下錯誤:</font> -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>

<table class="table-bordered table table-hover col-12">
	<thead class="thead-dark">
	<tr>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>會員信用卡</th>
		<th>手機號碼</th>
		<th>信箱</th>
		<th>地址</th>
		<th>會員狀態</th>
		<th>會員照片</th>
		<th>修改</th>
		<th>停權</th>
	</tr>
	</thead>
	<%@ include file="page1.file" %> 
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memVO.memNo}</td>
			<td>${memVO.memName}</td>
			<td>${memVO.memCreditCardId}</td> 
			<td>${memVO.memPhone}</td>
			<td>${memVO.memEmail}</td>
			<td>${memVO.memAddress}</td>
			<td>
				<c:if test="${memVO.memStatus == 0}">
			 		<c:out value="未驗證"></c:out>
				</c:if>
				<c:if test="${memVO.memStatus == 1}">
					<c:out value="已驗證"></c:out>
				</c:if>
				<c:if test="${memVO.memStatus == 2}">
					<c:out value="已停權"></c:out>
				</c:if>
			</td>
			<td><img alt="" src="<%=request.getContextPath()%>/Puppy/pic.do?memNo=${memVO.memNo}" style="height:100px;width:170px"></td>		
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改" class="btn btn-primary form form-control">
			     <input type="hidden" name="memNO"  value="${memVO.memNo}">
			     <input type="hidden" name="action"	value="getOne_For_Update_B"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="停權" class="btn btn-primary form form-control">
			     <input type="hidden" name="memNO"  value="${memVO.memNo}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>


    <form method="post" action="<%=request.getContextPath()%>/Puppy/mem.do">
    
    <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
	</c:if>
    
    
    
    
    	<b><font color=blue>會員查詢:</font></b> <br>
        <b>輸入會員編號:</b>
        <input type ="text" name= "memNo"><br>
        
        <b>輸入會員姓名:</b>
        <input type="text" name="memName" ><br>
         
        <b>輸入會員帳號:</b>
		<input type="text" name="memAccount" ><br>
		
		<b>輸入會員密碼:</b>
		<input type="text" name="memPassword" ><br>
		
		<b>輸入會員信用卡號:</b>
		<input type="text" name="memCreditCardId" ><br>
		
		<b>輸入會員手機號碼:</b>
		<input type="text" name="memPhone" ><br>
		
		<b>輸入會員信箱:</b>
		<input type="text" name="memEmail" ><br>
		
		<b>輸入會員地址:</b>
		<input type="text" name="memAddress" ><br>
		
	   <input type="hidden" name="action" value="list_Query">
       <input type="submit" value="送出">
		
    </form>


<!-- sweetalert -->

	<c:if test="${not empty update}">
		<script>
			swal("修改成功", "", "success");
		</script>
	</c:if>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
<%@ include file="/back-end/backEndInclude/footer.jsp"%>
</html>