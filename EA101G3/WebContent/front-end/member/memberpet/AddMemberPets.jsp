<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptedpets.model.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.MemberPet.model.*"%>


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

<!-- bootstrap、FontAwesome、googleFont -->
<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<%@ include file="/front-end/frontEndInclude/header.jsp"%>
<%
	MemberPetVO memberPetVO = (MemberPetVO) request.getAttribute("memberPetVO");
%>


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
	height: 300px;
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

#picPreview {
	height: 100px;
}

div.uploadimg{
	display: none;
}
</style>

</head>

<body>
	<main role="main">
			<div class="container">
			<div class="row justify-content-center">
				<div class="col-3 bg-light text-center">
					<h3>更新寵物資訊</h3>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<form method="post" enctype="multipart/form-data"
						action="<%=request.getContextPath()%>/memberpet/memberpet.do"
						runat="server">

						<fieldset disabled>
							<div class="form-group row">
								<label for="memName">會員名稱</label> <input type="text"
									name="memName" id="memName" class="form-control"
									value="${memName}">
							</div>
						</fieldset>
						
						<div class="form-group row">
							<label for="petName"  >寵物名稱</label> <input type="text"
								class="form-control" name="petName" id="petName"
								value="${memberPetVO.petName}" required>
						</div>

						<div class="form-group row">
							<label for="petVariety">寵物品種</label> <input type="text"
								class="form-control" name="petVariety" id="petVariety"
								value="${memberPetVO.petVariety}" required>
						</div>

						<div class="form-group row">
							<label for="petAge">寵物年齡</label> <input type="text"
								class="form-control" name="petAge" id="petAge"
								value="${memberPetVO.petAge}" required>
						</div>

						<div class="form-group row">
							<div class="col-1 pl-0">寵物性別</div>
							<div class="col">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="petGender"
										id="petGender1" value="男"> <label
										class="form-check-label" for="petGender1">公</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="petGender"
										id="petGender2" value="女"> <label
										class="form-check-label" for="petGender2">母</label>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-3 pl-0">
								<label for="petPic">收容寵物圖片</label> <input type="file"
									class="form-control-file" name="petPic" id="petPic" required>
							</div>
							<div class="col uploadimg">
								<img id="picPreview"
									src="#"
									class="rounded d-block">
							</div>
						</div>

						<input type="hidden" name="petNo" value="${memberPetVO.petNo}">
						<input type="hidden" name="memNo" value="${memNO}"> <input
							type="hidden" name="petStatus" value="0"> <input
							type="hidden" name="action" value="insert">
						<div class="form-group row">
							<div class="col-auto mx-auto input-group justify-content-center">
								<button type="submit" class="btn btn-primary ">送出</button>
							</div>
							
						</div>

					</form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/front-end/frontEndInclude/footer.jsp"%>
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#picPreview').attr('src', e.target.result);
					$('div.uploadimg').css('display','flex');
				}

				reader.readAsDataURL(input.files[0]); // convert to base64 string
			}
		}

		$("#petPic").change(function() {
			readURL(this);
		});

		var gender = '${adoptedpetsVO.petGender}';
		if (gender === "男") {
			$('#petGender1').attr("checked", "checked");
		} else {
			$('#petGender2').attr("checked", "checked");
		}
		
		
	</script>
	
</body>
</html>