<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptedpets.model.*"%>
<%@ page import="com.interaction.model.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO member = (MemberVO) session.getAttribute("member");
String memNO = (String) session.getAttribute("memNO");
String memName = (String) session.getAttribute("memName");
%>

<%
	InteractionService interactionSvc = new InteractionService();
	String adopterNo = (String) session.getAttribute("adopterNo");
	Set<InteractionVO> set = interactionSvc.getInteractionByAdopterNo(adopterNo);
	pageContext.setAttribute("set", set);
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

<!-- FullCalendar -->
<script
	src="<%=request.getContextPath()%>/front-end/adopt/fullcalendar-scheduler-5.1.0/lib/main.js"></script>

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
	height: 200px;
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
</style>

</head>

<body class="d-flex flex-column vh-100">
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
	<main role="main" class="mt-2">
		<div class="container">
			<div class="row">
				<div class="col">
					<table class="table table-bordered text-center">
						<thead class="thead-dark">
							<tr>
								<th scope="col">互動寵物</th>
								<th scope="col">寵物編號</th>
								<th scope="col">互動時段</th>
								<th scope="col">取消</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="interactionVO" items="${set}" varStatus="loop">
								<tr>
									<td class="align-middle"><img
										src="<%=request.getContextPath()%>/adoptedpetspic.do?petNo=${interactionVO.petNo}"
										class="pet-img rounded"></td>
									<td class="align-middle">${interactionVO.petNo}</td>
									<td class="align-middle"><fmt:formatDate
											value="${interactionVO.interactionDate}"
											pattern="yyyy-MM-dd a HH:mm" /></td>
									<td class="align-middle">
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/interaction/interaction.do">
											<div class="input-group d-flex justify-content-center">
												<div>
													<button class="btn btn-danger" type="submit"
														id="button-addon1">取消</button>
												</div>
												<input type="hidden" class="form-control"
													name="interactionNo" value="${interactionVO.interactionNo}">
												<input type="hidden" class="form-control" name="action"
													value="delete_Frontend">
											</div>
										</FORM>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<footer class="bg-white py-2 mt-auto">
		<div class="section-5 text-center">
			<h4 style="margin-top: 5%;">最完善的寵物平台</h4>
			<h4 class="my-4">如果您有需要 請聯絡我們</h4>
			<div class="form-inline justify-content-center">
				<input type="text" name="Email" id="email" placeholder="Email"
					size="40" class="form-control px-4 py-2"> <input
					type="button" value="Contact US"
					class="btn btn-danger px-4 py-2 ml-1">
			</div>
			<a href="">
				<button class="btn btn-outline-secondary" style="margin-top: 2%;">
					<h5>我要客訴</h5>
				</button>
			</a>
			<div class="social" style="margin: 3%;">
				<div class="d-flex flex-row justify-content-center">
					<i class="fab fa-facebook-f m-2"></i> <i class="fab fa-twitter m-2"></i>
					<i class="fab fa-instagram m-2"></i> <i class="fab fa-youtube m-2"></i>
				</div>
			</div>
			<hr>
			<h5 style="color: lightseagreen;">Cute Family &copy;</h5>
		</div>
	</footer>

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