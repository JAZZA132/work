<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.HotelOrder.model.*"%>

<%
	String memNO = (String) session.getAttribute("memNO");
	String memName = (String) session.getAttribute("memName");

	HotelOrderService hotelOrderSvc = new HotelOrderService();
	List<HotelOrderVO> list = hotelOrderSvc.getOneMemOrder(memNO);
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<title>萌寵家族旅館</title>
<!-- bootstrap、FontAwesome、googleFont -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/frontEndInclude/style.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/Hotel/hotelOrderInfo/style.css"> --%>

<style>
/* .navbar { */
/* 	background: #ccedd2; */
/* } */

.section-2 {
 	height: 400px; 
 	background-color:white;
}

footer h4 {
	position: relative;
	top: 50px;
}

footer .form-inline {
	position: relative;
	top: 50px;
}
</style>


</head>

<body>
	<header>
	<nav class="navbar navbar-expand-lg navbar-light ">
			<a href="<%=request.getContextPath()%>/front-end/frontEndIndex/index.jsp" class="navbar-brand ml-3">
				Cute:)
				<span style="color: #00E8E8;">Family</span>
			</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle Navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse"></div>
		<div class="collapse navbar-collapse" id="navbarMenu">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a href="<%=request.getContextPath()%>/front-end/frontEndIndex/index.jsp" class="nav-link">首頁</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/member/member/membercenter.jsp" class="nav-link">會員專區</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page3.jsp" class="nav-link">門診專區</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/Hotel/hotelIndex.jsp" class="nav-link">寵物旅館</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/product/shopindex.jsp" class="nav-link">寵物商城</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/adopt/adoptedpets/listAllPets.jsp" class="nav-link">領養專區</a>
				</li>
			</ul>
			<div style="<%=(memNO == null) ? "visibility:hidden" : "visibility:"%>" id="loginFonts">
				<span class="nav-link">
				<img alt="" src="<%=request.getContextPath()%>/Puppy/pic.do?memNo=${memNO}" style="height: 50px" id="mempic">
				 <%=memName%>您好~
				  </span>
			</div>


			<a href="<%=request.getContextPath()%>/front-end/member/member/addMem.jsp">
				<button class="btn menu-right-btn border" type="button" style="<%=(memNO == null) ? "display:" : "display:none"%>">註冊</button>
			</a>
			<a href="<%=request.getContextPath()%>/front-end/member/member/login.jsp">
				<button class="btn menu-right-btn border" type="submit" id="login" style="<%=(memNO == null) ? "display:" : "display:none"%>">登入</button>
			</a>
			<form class="form-inline my-2 my-lg-0" action="<%=request.getContextPath()%>/Puppy/logout.do">
				<button class="btn menu-right-btn border" type="submit" id="logout" style="<%=(memNO != null) ? "display:" : "display:none"%>">登出</button>
			</form>
		</div>
	</nav>
</header>

	<div class="section-2">
		<div class="col-12 mt-5">
			<table class="table table-striped text-center">
				<thead>
					<tr>
						<th scope="col">訂單編號</th>
<!-- 						<th scope="col">會員編號</th> -->
						<th scope="col">房型編號</th>
						<th scope="col">房間編號</th>
						<th scope="col">房型價格</th>
						<th scope="col">訂單時間</th>
						<th scope="col">入住時間</th>
						<th scope="col">退房時間</th>
						<th scope="col">訂單總價</th>
						<th scope="col">訂單狀態</th>
					</tr>
				</thead>
				<tbody>
					<%@ include file="page1.file"%>
					<c:forEach var="hotelOrderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<tr>

							<td>${hotelOrderVO.orderNo}</td>
<%-- 							<td>${hotelOrderVO.memNo}</td> --%>
							<td>${hotelOrderVO.roomTypeNo}</td>
							<td>${hotelOrderVO.roomNo}</td>
							<td>${hotelOrderVO.roomTypePrice}</td>
							<td>
								<fmt:formatDate value="${hotelOrderVO.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>
								<fmt:formatDate value="${hotelOrderVO.checkInDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>
								<fmt:formatDate value="${hotelOrderVO.checkOutDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>${hotelOrderVO.totalPrice}</td>
							<td>
								<font style="color:red;">
								<c:if test="${hotelOrderVO.hotelOrderStatus == 0}">
									<c:out value="待確認"></c:out>
								</c:if>
								</font>
								<font style="color:blue;">
								<c:if test="${hotelOrderVO.hotelOrderStatus == 1}">
									<c:out value="已完成"></c:out>
								</c:if>
								</font>
								<c:if test="${hotelOrderVO.hotelOrderStatus == 2}">
									<c:out value="已取消"></c:out>
								</c:if>
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-flex justify-content-end">
				<%@ include file="page2.file"%>
			</div>
		</div>
	</div>

	<footer>
			<div class="section-5 text-center">
				<h4 style="margin-top: 5%;">最完善的寵物平台</h4>
				<h4 class="my-4">如果您有需要 請聯絡我們</h4>

				<div class="form-inline justify-content-center">
					<input type="text" name="Email" id="email" placeholder="Email" size="40" class="form-control px-4 py-2">
					<input type="button" value="Contact US" class="btn btn-danger px-4 py-2 ml-1">
				</div>
				<a href="<%=request.getContextPath()%>//front-end/member/accusation/add_acc.jsp">
					<button class="btn btn-outline-secondary" style="margin-top: 5%;">
						<h5>我要客訴</h5>
					</button>
				</a>
				<div class="social" style="margin: 5%;">
					<div class="d-flex flex-row justify-content-center">
						<i class="fab fa-facebook-f m-2"></i>
						<i class="fab fa-twitter m-2"></i>
						<i class="fab fa-instagram m-2"></i>
						<i class="fab fa-youtube m-2"></i>
					</div>
				</div>
				<hr>
				<h5 style="color: lightseagreen;">Cute Family &copy;</h5>
			</div>
		</footer>

	<c:if test="${not empty payMoney}">
		<script>
			swal("付款成功", "", "success");
		</script>
	</c:if>


	<!--BootStrap -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>