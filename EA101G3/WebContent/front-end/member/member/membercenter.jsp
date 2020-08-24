<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員中心</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/member/member/membercentercss.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,700" rel="stylesheet">
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

#backgroundimg{
/* background-image:url('images/naigou.jpg');  */
background-size: Cover;
width:100%;
height:100%;
z-index: -999;
opacity:0.4; 
 position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
}


</style>

</head>
<body>
	<div>
		<img src="<%=request.getContextPath()%>/front-end/member/member/images/naigou.jpg" id="backgroundimg">
	</div>

	<div class="container">
		<h1>會員中心</h1>
		<div class="members">
			<div class="member">
				<a href="<%=request.getContextPath()%>/Puppy/mem.do?action=getOne_For_Update&memNO=${memNO}">
					<img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/member.png" >
					<h2 class="member-name">編輯會員資料</h2>
					<span class="member-role">Edit Member Information</span>
				</a>
			</div>
			<div class="member">
				<a href="<%=request.getContextPath()%>/front-end/member/memberpet/ListAllPetsByMember.jsp">
					<img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/puppy.png">
					<h2 class="member-name">寵物專區</h2>
					<span class="member-role">Pet Zone</span>
				</a>
			</div>
			<div class="member">
				<a href="<%=request.getContextPath()%>/front-end/hospital/appt/listAppt.jsp">
				<img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/hosiptal.png">
				<h2 class="member-name">診所預約</h2>
				<span class="member-role">Clinic appointment</span>
			</div>
			
			<div class="member">
			<a href="<%=request.getContextPath()%>/front-end/product/myorder.jsp">
				<img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/mall.png">
				<h2 class="member-name">商城明細</h2>
				<span class="member-role">Mall details</span>
				</a>
			</div>
			<div class="member">
				<a href="<%=request.getContextPath()%>/front-end/Hotel/hotelOrderInfo/hotelOrderInfo.jsp">
				<img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/hotel.png">
				<h2 class="member-name">旅館訂單</h2>
				<span class="member-role">Hotel Order</span>
				</a>
			</div>

			<div class="member">
				<a href="<%=request.getContextPath()%>/Puppy/mli.do?action=getAll_For_Display&mli=${memNO}">
					<img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/news.png">
					<h2 class="member-name">最新消息</h2>
					<span class="member-role">news</span>
				</a>
			</div>


			<div class="member">
				<a href="<%=request.getContextPath()%>/front-end/member/accusation/add_acc.jsp">
					<img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/center.png">
					<h2 class="member-name">客訴中心</h2>
					<span class="member-role">Customer Complaint Center</span>
				</a>
			</div>
		</div>
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
</body>
</html>
