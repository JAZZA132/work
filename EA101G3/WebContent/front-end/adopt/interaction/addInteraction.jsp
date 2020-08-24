<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptedpets.model.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO member = (MemberVO) session.getAttribute("member");
	String memNO = (String) session.getAttribute("memNO");
	String memName = (String) session.getAttribute("memName");
%>

<%
	AdoptedPetsVO adoptedpetsVO = (AdoptedPetsVO) request.getAttribute("adoptedpetsVO");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0  shrink-to-fit=no">
<title>萌寵家族</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
	integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/frontEndIndex/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/front-end/adopt/datetimepicker/jquery.datetimepicker.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/front-end/adopt/fullcalendar-scheduler-5.1.0/lib/main.css">

<script src="https://kit.fontawesome.com/a559a578e4.js"
	crossorigin="anonymous"></script>
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
<!-- bootstrap、FontAwesome、googleFont -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/moment.min.js"></script>

<!-- FullCalendar -->
<script
	src="<%=request.getContextPath()%>/front-end/adopt/fullcalendar-scheduler-5.1.0/lib/main.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			
			initialView : 'dayGridMonth',
			selectable: true,
			events:${interactionList},
			dateClick: function(info) {
				
				var nowStr = moment().format('yyyy-MM-DD');
				var nowDate = moment(nowStr, 'yyyy-MM-DD');
				var clickDate = moment(info.dateStr, 'yyyy-MM-DD');
					
				if(clickDate.isBefore(nowDate)){
					alert('時間不能倒退，請選擇未來的時段吧！')
					return false;
				}else{
				
				$('#btn-modal').click();
				$('#interactionDay').val(info.dateStr);
				if ($('#interactionDay').val() === '') {
					$('div.interactionTime-row').attr("style", "display:none");
				} else {
					$('div.interactionTime-row').attr("style", "display:flex");
				}
				$('button.interactionTime-btn').click(function() {
					var timeStr = $(this).text();
					$('#interactionTime-input').val(timeStr)
				});
				}
			},		
		});
		calendar.render();
	});
</script>



<style>
a.nav-link-sub {
	color: #8a8a90 !important;
	font-size: 20px;
	padding: 12.5px 50px !important;
	margin: 0%;
	font-family: 'Noto Sans TC';
	white-space: nowrap;
}

.fas, .far {
	font-size: 30px;
	margin: 0px 5px;
}

.nav-link-sub:hover {
	color: white !important;
}

.navbar-sub-main {
	padding: 0px 16px;
}

.subnavli {
	/* 	border-left: 1px solid #8a8a90; */
	/* 	border-right: 1px solid #8a8a90; */
	
}

#subnavli-last {
	/* 	border-right: 1px solid #8a8a90; */
	
}

.pet-card-img-top {
	position: relative;
	width: 100%;
	height: 225px;
}

.pet-img {
	width: auto;
	height: 400px;
	max-width: 100%;
}

.pet-card {
	height: auto;
}

ul.info-list {
	list-style-type: circle;
	list-style-position: inside;
}

.list-group-item {
	display: list-item;
}

.col-gender {
	padding: 0px;
}

main {
	font-family: 'Noto Sans TC';
}

hr {
	margin-top: 0px;
}

.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}

div.interactionTime-row {
	display: none;
}

#mempic {
	border-radius: 50%;
	border: 0px solid rgba(255, 0, 0, 1.00);
}

#loginFonts {
	font-family: 'Noto Sans TC';
}

.modal-body {
	font-family: 'Noto Sans TC';
}

.m-5 {
	margin-top: 10rem !important;
	margin-right: auto !important;
	margin-bottom: 10rem !important;
	margin-left: auto !important;
}
</style>

</head>

<body class="d-flex flex-column vh-100">

	<div class="container">
		<button type="button" class="btn btn-info btn-lg d-none"
			id="btn-modal" data-toggle="modal" data-target="#myModal">Open
			Modal</button>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg m-5">

				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-body">
						<form method="get"
							action="<%=request.getContextPath()%>/interaction/interaction.do">
							<div class="form-group row ">

								<label for="interactionDay" class="col-sm-4 col-form-label">預約日期</label>

								<div class="col-sm-8 align-self-center">
									<input type="text" class="form-control" name="interactionDay"
										id="interactionDay" value="">
								</div>
							</div>
							<div class="form-group row interactionTime-row">

								<label for="interactionTime" class="col-sm-4 col-form-label">預約時段</label>
								<div class="col-sm-8 align-self-center">
									<div class="btn-toolbar" role="toolbar"
										aria-label="Toolbar with button groups">
										<div class="btn-group mr-2" role="group"
											aria-label="First group">
											<button type="button" class="btn btn-warning interactionTime-btn">09:00</button>
										</div>
										<div class="btn-group mr-2" role="group"
											aria-label="Second group">
											<button type="button"
												class="btn btn-warning interactionTime-btn ">11:00</button>
										</div>
										<div class="btn-group mr-2 interactionTime-btn " role="group"
											aria-label="Second group">
											<button type="button"
												class="btn btn-warning interactionTime-btn ">13:00</button>
										</div>
										<div class="btn-group mr-2" role="group"
											aria-label="Second group">
											<button type="button"
												class="btn btn-warning interactionTime-btn ">15:00</button>
										</div>
										<div class="btn-group mr-2" role="group"
											aria-label="Second group">
											<button type="button"
												class="btn btn-warning interactionTime-btn ">17:00</button>
										</div>
										<div class="btn-group" role="group" aria-label="Third group">
											<button type="button"
												class="btn btn-warning interactionTime-btn ">19:00</button>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" name="interactionTime"
								id="interactionTime-input" value="">
							<div class="form-group row">
								<div class="col text-center">
									<button type="submit" class="btn btn-primary mt-2 ">送出</button>
								</div>

								<input type="hidden" name="action" value="insert_Frontend">
								<input type="hidden" name="petNo" id="petNo"
									value="${adoptedpetsVO.petNo}"> <input type="hidden"
									name="adopterName" id="adopterName" value="${adopterName}">
								<input type="hidden" name="adopterNo" id="adopterNo"
									value="${adopterNo}">

							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<header>
		<nav class="navbar navbar-expand-lg navbar-light ">
			<a
				href="<%=request.getContextPath()%>/front-end/frontEndIndex/index.jsp"
				class="navbar-brand ml-3"> Cute:) <span style="color: #00E8E8;">Family</span>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarMenu" aria-controls="navbarMenu"
				aria-expanded="false" aria-label="Toggle Navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse"></div>
			<div class="collapse navbar-collapse" id="navbarMenu">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a
						href="<%=request.getContextPath()%>/front-end/frontEndIndex/index.jsp"
						class="nav-link">首頁</a></li>
					<li class="nav-item dropdown"><a
						href="<%=request.getContextPath()%>/front-end/member/member/membercenter.jsp"
						class="nav-link">會員專區</a></li>
					<li class="nav-item dropdown"><a
						href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page3.jsp"
						class="nav-link">門診專區</a></li>
					<li class="nav-item dropdown"><a
						href="<%=request.getContextPath()%>/front-end/Hotel/hotelIndex.jsp"
						class="nav-link">寵物旅館</a></li>
					<li class="nav-item dropdown"><a
						href="<%=request.getContextPath()%>/front-end/product/shopindex.jsp"
						class="nav-link">寵物商城</a></li>
					<li class="nav-item dropdown"><a
						href="<%=request.getContextPath()%>/front-end/adopt/adoptedpets/listAllPets.jsp"
						class="nav-link">領養專區</a></li>
				</ul>
				<div
					style="<%=(memNO == null) ? "visibility:hidden" : "visibility:"%>"
					id="loginFonts">
					<span class="nav-link"> <img alt=""
						src="<%=request.getContextPath()%>/Puppy/pic.do?memNo=${memNO}"
						style="height: 50px" id="mempic"> <%=memName%>您好~
					</span>
				</div>
				<a
					href="<%=request.getContextPath()%>/front-end/member/member/addMem.jsp">
					<button class="btn menu-right-btn border" type="button"
						style="<%=(memNO == null) ? "display:" : "display:none"%>">註冊</button>
				</a> <a
					href="<%=request.getContextPath()%>/front-end/member/member/login.jsp">
					<button class="btn menu-right-btn border" type="submit" id="login"
						style="<%=(memNO == null) ? "display:" : "display:none"%>">登入</button>
				</a>
				<form class="form-inline my-2 my-lg-0"
					action="<%=request.getContextPath()%>/Puppy/logout.do">
					<button class="btn menu-right-btn border" type="submit" id="logout"
						style="<%=(memNO != null) ? "display:" : "display:none"%>">登出</button>
				</form>
			</div>
		</nav>
		<nav class="navbar navbar-expand-lg navbar-light navbar-sub-main"
			style="background-color: #f1f3f3">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="justify-content-center collapse navbar-collapse"
				id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item subnavli"><a
						class="d-flex nav-link nav-link-sub align-items-center"
						href="<%=request.getContextPath()%>/front-end/adopt/adoptedpets/listAllPets.jsp"><i
							class="fas fa-house-damage"></i>尋找浪浪</a></li>
					<li class="nav-item subnavli"><a
						class="d-flex nav-link nav-link-sub align-items-center"
						href="<%=request.getContextPath()%>/front-end/adopt/interaction/listInteractionByAdopter.jsp"><i
							class="fas fa-search-plus"></i>領養互動查詢</a></li>
					<li class="nav-item subnavli" id="subnavli-last"><a
						class="d-flex nav-link nav-link-sub align-items-center"
						href="<%=request.getContextPath()%>/front-end/adopt/adopter/addAdopter.jsp"><i
							class="fas fa-user-edit"></i>領養人登記</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<main role="main" class="mt-auto bg-light">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4 mt-5">
					<div class="form-group row justify-content-end my-3">
						<img
							src="<%=request.getContextPath()%>/adoptedpetspic.do?petNo=${adoptedpetsVO.petNo}"
							class="pet-img rounded mr-5">
					</div>
					<div class="form-group row justify-content-end ">

						<label for="petNo" class="col-lg-3 col-form-label">收容寵物編號</label>

						<div class="col-lg-4">
							<input type="text" class="form-control-plaintext" id="petNo"
								name="petNo" readonly value="${adoptedpetsVO.petNo}">

						</div>


					</div>
					<div class="form-group row justify-content-end">

						<label for="adopterName" class="col-lg-3 col-form-label">預約領養人姓名</label>

						<div class="col-lg-4">
							<input type="text" class="form-control-plaintext"
								id="adopterName" name="adopterName" readonly
								value="${adopterName}">
						</div>


					</div>
					<div class="row errorMsgs justify-content-center">
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
				<div class="col-lg-6 mt-3">
					<div id="calendar"></div>
				</div>
				<div class="col-2"></div>
			</div>
		</div>
	</main>
	<%@ include file="/front-end/frontEndInclude/footer.jsp"%>

	<script
		src="<%=request.getContextPath()%>/front-end/adopt/datetimepicker/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/adopt/datetimepicker/jquery.datetimepicker.full.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/adopt/base64-js-master/base64js.min.js"></script>

	<script>
		$.datetimepicker.setLocale('ch');

		$('#interactionDay').datetimepicker({
			theme : '', //theme: 'dark',
			timepicker : false, //timepicker:true,
			step : 60, //step: 60 (這是timepicker的預設間隔60分鐘)
			format : 'Y-m-d', //format:'Y-m-d H:i:s',
			allowTimes : [ '09:00', '11:00', '13:00', '15:00', '17:00', '19:00' ], // 設定timepicker顯示的時間   如：allowTimes:['09:00','11:00','12:00','21:00'],
			opened : false,
			closeOnWithoutClick : false,
			scrollMonth : false
		});

		var somedate1 = new Date();
		$('#interactionDay').datetimepicker({
			beforeShowDay : function(date) {
				if (date.getYear() < somedate1.getYear() || (date.getYear() == somedate1.getYear() && date.getMonth() < somedate1.getMonth()) || (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())) {
					return [ false, "" ]
				}
				return [ true, "" ];
			}
		});
	</script>
	<script>
		$(document).ready(function() {
			$('li.subnavli').mouseenter(function() {
				if ($(this).index() !== 2) {
					$(this).css({
						"background-color" : "#fd9742c9",
						"border-left" : "1px solid white"
					});
					$(this).next().css({
						"border-left" : "1px solid white"
					});
					$(this).find("a").attr("style", "color: white !important");
				} else {
					$(this).css({
						"background-color" : "#fd9742c9",
						"border-left" : "1px solid white",
						"border-right" : "1px solid white"
					});
					$(this).find("a").attr("style", "color: white !important");
				}

			}).mouseleave(function() {
				if ($(this).index() !== 2) {
					$(this).css({
						"background-color" : "#f1f3f3",
						"border-left" : ""
					});
					$(this).next().css({
						"border-left" : ""
					});
					$(this).find("a").attr("style", "color: #8a8a90 !important");
				} else {
					$(this).css({
						"background-color" : "#f1f3f3",
						"border-left" : "",
						"border-right" : ""
					});
					$(this).find("a").attr("style", "color: #8a8a90 !important");
				}

			});
		});
	</script>
</body>
</html>