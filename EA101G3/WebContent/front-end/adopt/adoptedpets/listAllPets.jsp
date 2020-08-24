<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptedpets.model.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.mem.model.*"%>

<%	
	MemberVO member = (MemberVO)session.getAttribute("member");
	String memNO = (String) session.getAttribute("memNO");
	String memName = (String) session.getAttribute("memName");
%>

<%	
	AdoptedPetsService adoptedPetsSvc = new AdoptedPetsService();
	List<AdoptedPetsVO> list = adoptedPetsSvc.getAll();
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

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

main {
	font-family: 'Noto Sans TC';
}

#pet-search-title, form.pet-search-form, div.pet-sort-row {
	padding-left: 15px;
}

#mempic {
	border-radius: 50%;
	border: 0px solid rgba(255, 0, 0, 1.00);
}

#loginFonts {
	font-family: 'Noto Sans TC';
}

#login-adopter{
	display: none;
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
		<div class="pet-album py-2 bg-light">
			<div class="container">				
				<div class="row pet-sort-row pb-1">
					<div class="col">
					<a class="btn btn-outline-secondary" data-toggle="collapse"
						href="#collapseExample" role="button" aria-expanded="false"
						aria-controls="collapseExample">快速篩選 </a>
						</div>
						<div class="col-3 text-right" id="login-adopter">
						目前領養人: ${adopterName}
						</div>
				</div>
				<div class="collapse" id="collapseExample">
					<div class="row py-3 pet-sort-row">
						<form id="pet-sort-form"
							class="form-inline pet-search-form bg-dark rounded p-3 text-light">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="petSpecies"
									id="petSpecies1" value="犬"> <label
									class="form-check-label" for="petSpecies1">犬</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="petSpecies"
									id="petSpecies2" value="貓"> <label
									class="form-check-label" for="petSpecies2">貓</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="petSpecies"
									id="petSpecies3" value="其他"> <label
									class="form-check-label" for="petSpecies3">其他</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="petGender"
									id="petGender1" value="公"> <label
									class="form-check-label" for="petGender1">公</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="petGender"
									id="petGender2" value="母"> <label
									class="form-check-label" for="petGender2">母</label>
							</div>
							<div class="form-group">
								<label for="petBreed" class="mx-2">收容寵物品種</label> <input
									type="text" class="form-control" name="petBreed" id="petBreed"
									placeholder="請輸入品種名稱">
							</div>
							<button type="button" class="btn-sm btn-primary mx-3"
								id="doAjaxBtn">查詢</button>
							<input type="hidden" class="form-control" name="action"
								value="listAdoptedPets_ByCompositeQuery">
						</form>
					</div>
				</div>
				<%@ include file="page1.file"%>
				<div class="row pet-list">
					<c:forEach var="adoptedpetsVO" items="${list}" varStatus="loop"
						begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<c:if test="${adoptedpetsVO.adoptStatus == '0'}">
						<div class="col-md-4">
							<div class="card mb-4 shadow-sm pet-card">
								<div
									class="card-img-top pet-card-img-top d-flex justify-content-center bg-dark">
									<img
										src="<%=request.getContextPath()%>/adoptedpetspic.do?petNo=${adoptedpetsVO.petNo}"
										class="pet-img">
								</div>
								<ul class="list-group list-group-flush info-list">
									<li class="list-group-item">品種：${adoptedpetsVO.petBreed}</li>
									<li class="list-group-item">類別：${adoptedpetsVO.petSpecies}</li>
									<li class="list-group-item">性別：${adoptedpetsVO.petGender}</li>
								</ul>
								<div class="card-body pet-card-body">
									<div class="d-flex justify-content-end align-items-center">

										<div class="btn-group">
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/adoptedpets/adoptedpets.do">
												<button type="submit"
													class="btn btn-sm btn-outline-secondary">詳細內容</button>
												<input type="hidden" class="form-control" name="petNo"
													value="${adoptedpetsVO.petNo}"><input type="hidden"
													class="form-control" name="action"
													value="getOnePet_Frontend">
											</FORM>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/adoptedpets/adoptedpets.do">
												<button type="submit"
													class="btn btn-sm btn-outline-secondary">互動預約</button>
												<input type="hidden" class="form-control" name="petNo"
													value="${adoptedpetsVO.petNo}"><input type="hidden"
													class="form-control" name="action"
													value="getOneinteractionforAdd_Frontend">
											</FORM>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:if>
					</c:forEach>
				</div>
				<%@ include file="page2.file"%>
			</div>
		</div>
	</main>
<%@ include file="/front-end/frontEndInclude/footer.jsp"%>
	<script
		src="<%=request.getContextPath()%>/front-end/adopt/base64-js-master/base64js.min.js"></script>
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
					$("#doAjaxBtn").click(function(){
						$.ajax({
							type: "post",
							url: "<%=request.getContextPath()%>/adoptedpets/adoptedpets.do",
							data: $("#pet-sort-form").serialize(),
							dataType: "json",							
							success : function(response){
								$('div.pet-list').html('');
								$('h5.sum-title').css('display', 'none');
								$('div.pageSelect').css('display', 'none');
								$.each(response, function(index, adoptedpetsVO){									
									var byteArray = adoptedpetsVO.petPic;
									var base64Pic = base64js.fromByteArray(byteArray);
									$('div.pet-list').append(
									`<div class="col-md-4">
										<div class="card mb-4 shadow-sm pet-card">
											<div
												class="card-img-top pet-card-img-top d-flex justify-content-center bg-dark">
												<img
													src="data:image/jpeg;base64,`+ base64Pic+`"
													class="pet-img">
											</div>
											<ul class="list-group list-group-flush info-list">
												<li class="list-group-item">品種：`+ adoptedpetsVO.petBreed +`</li>
												<li class="list-group-item">類別：`+ adoptedpetsVO.petSpecies +`</li>
												<li class="list-group-item">性別：`+ adoptedpetsVO.petGender +`</li>
											</ul>
											<div class="card-body pet-card-body">
												<div class="d-flex justify-content-end align-items-center">
			
													<div class="btn-group">
														<FORM METHOD="post"
															ACTION="<%=request.getContextPath()%>/adoptedpets/adoptedpets.do">
															<button type="submit"
																class="btn btn-sm btn-outline-secondary">詳細內容</button>
															<input type="hidden" class="form-control" name="petNo"
																value="`+adoptedpetsVO.petNo+`"><input type="hidden"
																class="form-control" name="action"
																value="getOnePet_Frontend">
														</FORM>
														<FORM METHOD="post"
															ACTION="<%=request.getContextPath()%>/adoptedpets/adoptedpets.do">
															<button type="submit"
																class="btn btn-sm btn-outline-secondary">互動預約</button>
															<input type="hidden" class="form-control" name="petNo"
																value="`+adoptedpetsVO.petNo+`"><input type="hidden"
																class="form-control" name="action"
																value="getOneinteractionforAdd_Frontend">
														</FORM>
													</div>
												</div>
											</div>
										</div>
									</div>`
									);
								});
							},							
							error: function(xhr){
								alert(XMLHttpRequest.status);
							}
							
						});
					});
					
					var name = '${adopterName}'; 
					if( name == ""){
						$('#login-adopter').css("display", "none");
					}else{
						$('#login-adopter').css("display", "block");
					}
				});
	</script>


</body>
</html>