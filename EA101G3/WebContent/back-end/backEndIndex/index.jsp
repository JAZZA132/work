<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.auth.model.*"%>
<%
// 	取得登入成功時拿到的姓名跟照片
// 	下面用EL取值，不用JAVA語法取值了
// EmpVO empVONav = (EmpVO) session.getAttribute("empVONav");
// System.out.print(empVONav.getEmpID());   

%>


<!DOCTYPE html>
<html>
<head>

<style>
.indexMain {
	font-family: 'Noto Sans TC', sans-serif;
	text-align: center;
	font-size: 50px;
	padding: 20px 10px 20px 10px;
	float: left;
	min-height: 900px;
	background: rgba(255, 255, 255, 0.90);
	border-radius: 7px;
	margin-top: 8px;
	margin-bottom: 108px;
	right: 8px;
}

.welcome {
	font-size: 80px;
	font-family: 'Pacifico';
}

.welMsg{
	font-size: 42px;
	font-family: 'Noto Sans TC';
}
</style>
<link rel="stylesheet" href="style.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>萌寵家族後台</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>



</head>

<body>



	<nav class="navbar fixed-top">
		<div class="icon">
			<a href="<%=request.getContextPath()%>/back-end/backEndIndex/index.jsp">Cute:)<span style="color: #00E8E8;">Family</span>
			</a>

		</div>



		<div class="logout">
			<img
				src="<%= request.getContextPath()%>/back-end/emp/img.do?empID=${empVONav.empID}"
				class="mem-pic"> <span class="mem-name">${empVONav.empName}</span>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/back-end/backEndLogin/login.do"
				class="logoutForm">
				<%-- 				<a class="dropdown-item" href="<%=request.getContextPath()%>/back-end/login.html">登出</a> --%>
				<!-- 			<input type="submit" value="登出"> -->
				<button type="submit" class="btn btn-link">登出</button>

				<input type="hidden" name="action" value="logout">
			</FORM>
		</div>



	</nav>

	<div class="container-fluid">



		<div class="row">


			<div class="aside col-xl-2">
<jsp:useBean id="set" scope="session" type="java.util.LinkedHashSet<AuthVO>" />

			<ul class="nav flex-column">
<c:forEach var="authVO" items="${set}" varStatus="authContent">
<c:if test="${authVO.bgFuncNo=='O'}">
				<li class="nav-item">
					<div class="nav-link active" href="#">
						<svg class="bi bi-calendar3" width="1em" height="1em"
							viewBox="0 0 16 16" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd"
								d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z" />
							<path fill-rule="evenodd"
								d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
						</svg>
						門診管理&nbsp;<svg class="downarrow" width="0.6em" height="0.6em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg>

						<ul>
							<li><a
								href="<%=request.getContextPath()%>/back-end/hospital/opt/select_page.jsp">班表管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/hospital/appt/select_page.jsp">預約管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/hospital/doc/select_page.jsp">團隊資料管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/hospital/mr/select_page.jsp">診療紀錄</a></li>
						</ul>

					</div>

				</li>

</c:if>
</c:forEach>

<c:forEach var="authVO" items="${set}" varStatus="authContent">
<c:if test="${authVO.bgFuncNo=='S'}">
				<li class="nav-item">
					<div class="nav-link" href="#">
						<svg class="bi bi-basket" width="1em" height="1em"
							viewBox="0 0 16 16" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd"
								d="M10.243 1.071a.5.5 0 0 1 .686.172l3 5a.5.5 0 1 1-.858.514l-3-5a.5.5 0 0 1 .172-.686zm-4.486 0a.5.5 0 0 0-.686.172l-3 5a.5.5 0 1 0 .858.514l3-5a.5.5 0 0 0-.172-.686z" />
						<path fill-rule="evenodd"
								d="M1 7v1h14V7H1zM.5 6a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 .5.5h15a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 0-.5-.5H.5z" />
						<path fill-rule="evenodd"
								d="M14 9H2v5a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V9zM2 8a1 1 0 0 0-1 1v5a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V9a1 1 0 0 0-1-1H2z" />
						<path fill-rule="evenodd"
								d="M4 10a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3a.5.5 0 0 1 .5-.5z" />
					</svg>
						商城管理&nbsp;<svg class="downarrow" width="0.6em" height="0.6em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg>

						<ul>
							<li><a
								href="<%=request.getContextPath()%>/back-end/product/listAllproduct.jsp">商品管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/productorder/cancel.jsp">訂單管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/promotion/listAllpromotion.jsp">優惠管理</a></li>
						</ul>

					</div>
				</li>

</c:if>
</c:forEach>
<c:forEach var="authVO" items="${set}" varStatus="authContent">
<c:if test="${authVO.bgFuncNo=='H'}">
				<li class="nav-item">
					<div class="nav-link" href="#">
						<svg class="bi bi-shop" width="1em" height="1em"
							viewBox="0 0 16 16" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd"
								d="M0 15.5a.5.5 0 0 1 .5-.5h15a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zM3.12 1.175A.5.5 0 0 1 3.5 1h9a.5.5 0 0 1 .38.175l2.759 3.219A1.5 1.5 0 0 1 16 5.37v.13h-1v-.13a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.13H0v-.13a1.5 1.5 0 0 1 .361-.976l2.76-3.22z" />
					<path
								d="M2.375 6.875c.76 0 1.375-.616 1.375-1.375h1a1.375 1.375 0 0 0 2.75 0h1a1.375 1.375 0 0 0 2.75 0h1a1.375 1.375 0 1 0 2.75 0h1a2.375 2.375 0 0 1-4.25 1.458 2.371 2.371 0 0 1-1.875.917A2.37 2.37 0 0 1 8 6.958a2.37 2.37 0 0 1-1.875.917 2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.5h1c0 .76.616 1.375 1.375 1.375z" />
					<path
								d="M4.75 5.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm3.75 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm3.75 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
					<path fill-rule="evenodd"
								d="M2 7.846V7H1v.437c.291.207.632.35 1 .409zm-1 .737c.311.14.647.232 1 .271V15H1V8.583zm13 .271a3.354 3.354 0 0 0 1-.27V15h-1V8.854zm1-1.417c-.291.207-.632.35-1 .409V7h1v.437zM3 9.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5V15H7v-5H4v5H3V9.5zm6 0a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-4zm1 .5v3h2v-3h-2z" />
				</svg>
						旅館管理&nbsp;<svg class="downarrow" width="0.6em" height="0.6em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg>


						<ul>
							<li><a
								href="<%=request.getContextPath()%>/back-end/Hotel/HotelOrder/fullcalendar.jsp">訂單日曆資訊</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/Hotel/HotelOrder/listAllHotelOrder.jsp">旅館訂單管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/Hotel/HotelRoomType/listAllHotelRoomType.jsp">房型資訊管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/Hotel/HotelRoom/listAllHotelRoom.jsp">房間資訊管理</a></li>
						</ul>


					</div>
				</li>
				
</c:if>
</c:forEach>
<c:forEach var="authVO" items="${set}" varStatus="authContent">
<c:if test="${authVO.bgFuncNo=='A'}">
				<li class="nav-item">
					<div class="nav-link" href="#">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
</svg> 領養管理&nbsp;<svg class="downarrow" width="0.6em" height="0.6em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg>


						<ul>
							<li><a
								href="<%=request.getContextPath()%>/back-end/adopt/adoptedpets/listAllAdoptedPets.jsp">收容寵物管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/adopt/petshelter/listAllPetShelter.jsp">收容住所管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/adopt/adopter/listAllAdopter.jsp">領養人管理</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/adopt/interaction/listAllInteraction.jsp">互動管理</a></li>
						</ul>

					</div>
				</li>
</c:if>
</c:forEach>
<c:forEach var="authVO" items="${set}" varStatus="authContent">
<c:if test="${authVO.bgFuncNo=='M'}">									
				<li class="nav-item">
					<div class="nav-link" href="#">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-people-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
</svg> 會員管理&nbsp;<svg class="downarrow" width="0.6em" height="0.6em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg>


						<ul>
							<li><a
								href="<%=request.getContextPath()%>/back-end/member/member/listAll.jsp">編輯會員資料</a></li>
							<li><a
								href="<%=request.getContextPath()%>/back-end/member/memlatestinfo/listAll_memli.jsp">會員最新消息</a></li>
						</ul>

					</div>
				</li>

</c:if>
</c:forEach>				
<c:forEach var="authVO" items="${set}" varStatus="authContent">
<c:if test="${authVO.bgFuncNo=='T'}">				
				

				<li class="nav-item-single"><a class="nav-link"
					href="<%=request.getContextPath()%>/back-end/member/accusation/listAll_acc.jsp"><svg
							class="bi bi-emoji-frown" width="1em" height="1em"
							viewBox="0 0 16 16" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
								d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
			<path fill-rule="evenodd"
								d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683z" />
			<path
								d="M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z" />
		</svg> 客訴管理</a></li>

</c:if>
</c:forEach>
<c:forEach var="authVO" items="${set}" varStatus="authContent">
<c:if test="${authVO.bgFuncNo=='E'}">
				<li class="nav-item-single"><a class="nav-link" href="<%=request.getContextPath()%>/back-end/emp/listAllEmp.jsp"><svg
							class="bi bi-unlock" width="1em" height="1em" viewBox="0 0 16 16"
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd"
								d="M9.655 8H2.333c-.264 0-.398.068-.471.121a.73.73 0 0 0-.224.296 1.626 1.626 0 0 0-.138.59V14c0 .342.076.531.14.635.064.106.151.18.256.237a1.122 1.122 0 0 0 .436.127l.013.001h7.322c.264 0 .398-.068.471-.121a.73.73 0 0 0 .224-.296 1.627 1.627 0 0 0 .138-.59V9c0-.342-.076-.531-.14-.635a.658.658 0 0 0-.255-.237A1.122 1.122 0 0 0 9.655 8zm.012-1H2.333C.5 7 .5 9 .5 9v5c0 2 1.833 2 1.833 2h7.334c1.833 0 1.833-2 1.833-2V9c0-2-1.833-2-1.833-2zM8.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z" />
		</svg> 員工管理</a></li>

</c:if>
</c:forEach>



			</ul>


		</div>

			
			<div class="indexMain col-xl-10">
				<div class="welcome">Welcome</div>
				<span class="welMsg">${empVONav.empJob}</span>
				<span class="welMsg">${empVONav.empName}</span>
				<br>
				<span class="welMsg">歡迎使用萌寵家族後台管理系統</span>
				
<%-- 				<c:forEach var="authVO" items="${set}" varStatus="authContent"> --%>
<%-- 				 <c:if test="${authVO.bgFuncNo=='O'}"> --%>
<!-- 				 <div>你有門診權限</div> -->
<%-- 				 </c:if> --%>
<%-- 				 <c:if test="${authVO.bgFuncNo=='A'}"> --%>
<!-- 				 <div>你有領養權限</div> -->
<%-- 				 </c:if> --%>
				
<%-- 				</c:forEach> --%>
			</div>
			
			<footer class="Footer">Copyright © 萌寵家族 Cute Family </footer>

		</div>

	</div>


</body>
</html>