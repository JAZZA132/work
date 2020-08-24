<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.memlatestinfo.model.*"%>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/member/member/logincss.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/frontEndInclude/style.css">
<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<%@ include file="/front-end/frontEndInclude/header.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	<c:if test="${not empty memberjoin}">
		<script>
			swal("註冊成功","${memberjoin}");
		</script>
	</c:if>
<body background="<%= request.getContextPath()%>/front-end/member/member/images/534557.jpg" style="background-size:Cover;" >

		<div class="login-box">
			<c:if test="${not empty errorMsgs}">
		<c:forEach var="message" items="${errorMsgs}">
			<p style="color:red;font-size:20px"">${message}</p>
		</c:forEach>
	</c:if>	
		 <h2>登入</h2>
		<form class="" action="<%=request.getContextPath()%>/Puppy/login.do" METHOD="post">
				
				 
				    <div class="user-box">
				      <input type="text" name="memAccount" required="">
				      <label>帳號</label>
				    </div>
				    <div class="user-box">
				      <input type="password" name="memPassword" required="">
				      <label>密碼</label>
				    </div>
				    
				    <input type="hidden" name="action" value="login">
				    <button class="" type="submit">
				    <span></span>
				      <span></span>
				      <span></span>
				      <span></span>
						登入
				    </button>

		</form>
		</div>
	
	<c:if test="${not empty update}">
		<script>
			swal("修改成功", "", "success");
		</script>
	</c:if>
	<c:if test="${not empty insertacc}">
		<script>
			swal("新增成功", "", "success");
		</script>
	</c:if>
	<c:if test="${not empty fail}">
		<script>
			swal("修改失敗", "", "success");
		</script>
	</c:if>
	
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
<!--         integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
<!--         crossorigin="anonymous"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" -->
<!--         integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" -->
<!--         crossorigin="anonymous"></script> -->
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" -->
<!--         integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" -->
<!--         crossorigin="anonymous"></script> -->
</body>
</html>
