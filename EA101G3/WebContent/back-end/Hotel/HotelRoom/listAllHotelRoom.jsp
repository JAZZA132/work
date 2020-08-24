<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.HotelRoom.model.*"%>
<%@ page import="com.MemberPet.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	HotelRoomService hotelRoomSvc = new HotelRoomService();
	List<HotelRoomVO> list = hotelRoomSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
#section-1 {
	position: relative;
	top: -10px;
}
.table tr {
	vertical-align: middle;
/* 	font-size: 20px; */
}

.table tr td {
	vertical-align: middle;
/* 	font-size: 20px; */
}

.images {
	width: 243px;
	height: 162px;
}
</style>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="/back-end/backEndInclude/header.jsp"%>
	<div class="container-fluid" id="section-1">
		<div class="row">
			<div class="col-12">
				<h1 class="topTitle text-center">
					<span class="badge badge-warning">- 房間管理 -(全部資料)</span>
					<div class="d-flex justify-content-end">
						<a class="btn btn-success" href="<%=request.getContextPath()%>/back-end/Hotel/HotelRoom/addHotelRoom.jsp" role="button">新增房間</a>
					</div>
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4">
				<!-- 錯誤表列 -->
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<table class="table table-striped text-center align-middle">
					<thead>
						<tr>
							<th scope="col">房間編號</th>
							<th scope="col">房型名稱</th>
							<th scope="col">寵物編號</th>
							<th scope="col">寵物名稱</th>
							<th scope="col">寵物圖片</th>
							<th scope="col">房間狀態</th>
							<th scope="col">房間修改</th>
					</thead>
					<tbody>
						<%@ include file="page1.file"%>
						<jsp:useBean id="roomTypeSVC" scope="page" class="com.HotelRoomType.model.HotelRoomTypeService" />
						<jsp:useBean id="memberPetSVC" scope="page" class="com.MemberPet.model.MemberPetService" />
						<c:forEach var="hotelRoomVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

							<tr>
								<td>${hotelRoomVO.roomNo}</td>
								<td>${roomTypeSVC.getOneHotelRoomType(hotelRoomVO.roomTypeNo).roomTypeName}</td>
								<td>${hotelRoomVO.petNo}</td>
								<td>${memberPetSVC.getOneMemberPet(hotelRoomVO.petNo).petName}</td>
								<td><img alt="寵物圖片" class="images" src="<%=request.getContextPath()%>/back-end/HotelRoom/HotelRoomPic2.do?petNo=${hotelRoomVO.petNo}" onerror="this.src='<%=request.getContextPath()%>/back-end/Hotel/HotelRoom/images/NOPIC2.jpg'"></td>
<%-- 								<td>${memberPetSVC.getOneMemberPet(hotelRoomVO.petNo).petPic}</td> --%>
								<td>
									<font style="color:blue">
									<c:if test="${hotelRoomVO.roomStatus == 0}">
										<c:out value="已存在"></c:out>
									</c:if>
									</font>
									<font style="color:red">
									<c:if test="${hotelRoomVO.roomStatus == 1}">
										<c:out value="已移除"></c:out>
									</c:if>
									</font>
								</td>
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/HotelRoom/HotelRoom.do" style="margin-bottom: 0px;">
										<button type="submit" class="btn btn-primary">修改</button>
										<input type="hidden" name="roomNo" value="${hotelRoomVO.roomNo}">
										<input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-end">
					<%@ include file="page2.file"%>
				</div>

				<jsp:useBean id="hotelRoomSvc2" scope="page" class="com.HotelRoom.model.HotelRoomService" />
				<div class="col-4">
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/HotelRoom/HotelRoom.do">
						<div class="form-group font-weight-bold">
							<label for="exampleFormControlSelect1">選擇房間編號</label>
							<select class="form-control" id="exampleFormControlSelect1" name="roomNo">
								<c:forEach var="hotelRoomVO" items="${hotelRoomSvc2.all}">
									<option value="${hotelRoomVO.roomNo}">${hotelRoomVO.roomNo}
								</c:forEach>
							</select>
							<input type="hidden" name="action" value="getOne_For_Display">
							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-primary" style="margin-top: 1%;">送出查詢</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${not empty success}">
		<script>
			swal("新增成功", "", "success");
		</script>
	</c:if>
	<c:if test="${not empty fail}">
		<script>
			swal("刪除成功", "", "success");
		</script>
	</c:if>




	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<%@ include file="/back-end/backEndInclude/footer.jsp"%>
</body>
</html>