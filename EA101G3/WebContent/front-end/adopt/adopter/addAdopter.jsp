<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptedpets.model.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.adopter.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO member = (MemberVO) session.getAttribute("member");
	String memNO = (String) session.getAttribute("memNO");
	String memName = (String) session.getAttribute("memName");

	AdopterService adopterSvc = new AdopterService();
	List<AdopterVO> list = adopterSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/a559a578e4.js"
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
	height: 100%;
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

body {
	font-family: 'Noto Sans TC';
	height: 100%;
	background-image: url("images/addAdopterbg2.jpg");
	/* The image used */
	background-color: #cccccc; /* Used if the image is unavailable */
	background-position: center top; /* Center the image */
	background-repeat: no-repeat; /* Do not repeat the image */
	background-size: cover;
	/* Resize the background image to cover the entire container */
}

hr {
	margin-top: 0px;
}

#mempic {
	border-radius: 50%;
	border: 0px solid rgba(255, 0, 0, 1.00);
}

#loginFonts {
	font-family: 'Noto Sans TC';
}

#mailSpan {
	display: none;
}
</style>

</head>

<body>
	<header class="bg-white">
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
	</header>
	<main role="main">
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
		<div class="container">
			<div class="row errorMsgs">
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
			<div class="row justify-content-center pb-auto">
				<div class="col-5 d-flex justify-content-center mt-5">
					<form method="post" enctype="multipart/form-data"
						action="<%=request.getContextPath()%>/adopter/adopter.do">
						<div class="form-group row">
							<label for="adopterName">姓名</label> <input type="text"
								class="form-control" name="adopterName" id="adopterName"
								value="${adopterVO.adopterName}" required>
						</div>
						<div class="form-group row">
							<div class="col-2 p-0 text-nowrap">性別</div>
							<div class="col">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="adopterGender" id="adopterGender1" value="男"> <label
										class="form-check-label" for="adopterGender1">男</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="adopterGender" id="adopterGender2" value="女"> <label
										class="form-check-label" for="adopterGender2">女</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="adopterOccupation">職業</label> <input type="text"
								class="form-control" name="adopterOccupation"
								id="adopterOccupation" value="${adopterVO.adopterOccupation}"
								required>
						</div>
						<div class="form-group row">
							<label for="adopterMail">信箱</label> <input type="email"
								class="form-control" name="adopterMail" id="adopterMail"
								value="" required><span id="mailSpan">信箱已存在!!!</span>
						</div>
						<input type="hidden" name="action" value="frontendInsert">
						<div class="form-group row">
							<div class="col text-center">
								<button type="button" class="btn btn-outline-success"
									id="btn-text">秒填資料</button>
							</div>
							<div class="col text-center">
								<button type="submit" class="btn btn-primary" id="btn-submit">送出</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<footer class="bg-white footer fixed-bottom">
		<div class="text-center">
			<hr>
			<h5 style="color: lightseagreen;">Cute Family &copy;</h5>
		</div>
	</footer>
	<div class="d-none">
		<c:forEach var="adopterVO" items="${list}" varStatus="loop">
			<div class="mailList" id="${adopterVO.adopterNo}">${adopterVO.adopterMail}</div>
		</c:forEach>
	</div>
	<script>
		$(document).ready(
				function() {
					$('li.subnavli').mouseenter(
							function() {

								if ($(this).index() !== 2) {
									$(this).css({
										"background-color" : "#fd9742c9",
										"border-left" : "1px solid white"
									});
									$(this).next().css({
										"border-left" : "1px solid white",
									});
									$(this).find("a").attr("style",
											"color: white !important");
								} else {
									$(this).css({
										"background-color" : "#fd9742c9",
										"border-left" : "1px solid white",
										"border-right" : "1px solid white"
									});
									$(this).find("a").attr("style",
											"color: white !important");

								}

							}).mouseleave(
							function() {

								if ($(this).index() !== 2) {
									$(this).css({
										"background-color" : "#f1f3f3",
										"border-left" : ""
									});
									$(this).next().css({
										"border-left" : "",
									});
									$(this).find("a").attr("style",
											"color: #8a8a90 !important");
								} else {
									$(this).css({
										"background-color" : "#f1f3f3",
										"border-left" : "",
										"border-right" : ""
									});
									$(this).find("a").attr("style",
											"color: #8a8a90 !important");
								}

							});
					var gender = '${adopterVO.adopterGender}';
					if (gender === "男") {
						$('#adopterGender1').attr("checked", "checked");
					} else {
						$('#adopterGender2').attr("checked", "checked");
					}

					var adopterVOArr = [];
					var mail;

					$('div.mailList').each(function(index, value) {
						adopterVOArr[index] = $(this).text();
					});

					console.log(adopterVOArr);

					$('#adopterMail').change(function() {
						mail = $(this).val();
						console.log(mail);
						$.each(adopterVOArr, function(index, value) {
							console.log(value);
							if (mail.toUpperCase() === value) {
								$('#mailSpan').css('display', 'inline-block');
								$('#mailSpan').css('color', 'red');
								$('#btn-submit').prop("disabled", true);
								return;
							} else {
								$('#mailSpan').css('display', 'none');
								$('#btn-submit').prop("disabled", false);
							}
						});
					});
					
					$('#btn-text').click(function(){
						$('#adopterName').val('小傑');
						$('#adopterOccupation').val('獵人');
						$('#adopterMail').val('xuanjia961121@gmail.com');
					});
				});
	</script>
</body>
</html>