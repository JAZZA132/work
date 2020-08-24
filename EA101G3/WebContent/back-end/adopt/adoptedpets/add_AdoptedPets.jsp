<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adoptedpets.model.*"%>

<jsp:useBean id="petShelterSvc" scope="page"
	class="com.petshelter.model.PetShelterService" />
<jsp:useBean id="adopterSvc" scope="page"
	class="com.adopter.model.AdopterService" />

<!DOCTYPE html>
<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/backEndInclude/style.css">

<title>Update Adopted Pets</title>

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
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<style>
.rounded {
	height: 100px;
}

.col-2, .col-3 {
	padding-left: 0px;
}
</style>
</head>

<body>
	<%@ include file="/back-end/backEndInclude/header.jsp"%>
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
		<div class="row">
			<div class="col">
				<form method="post" enctype="multipart/form-data" id="insert-form"
					action="<%=request.getContextPath()%>/adoptedpets/adoptedpets.do"
					runat="server">
					<fieldset disabled>
						<div class="form-group row">
							<label for="petNo">收容寵物編號</label> <input type="text" name="petNo"
								id="petNo" class="form-control" value="自動生成">
						</div>
					</fieldset>

					<input type="hidden" class="form-control" name="adopterNo"
						id="adopterNo" readonly value="${adoptedpetsVO.adopterNo}">

					<div class="form-group row">
						<div class="col-2">住所編號</div>
						<div class="col">
							<select class="custom-select" name="shelterNo" id="shelterNo">
								<option selected value="${adoptedpetsVO.shelterNo}">${adoptedpetsVO.shelterNo}</option>
								<c:forEach var="petShelterVO" items="${petShelterSvc.all}">
									<c:if test="${petShelterVO.shelterStatus != '2'}">
										<option value="${petShelterVO.shelterNo}"}>${petShelterVO.shelterNo} 有空間</option>
									</c:if>											
								</c:forEach>
								<option value=""></option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label for="petBreed">寵物品種</label> <input type="text"
							class="form-control" name="petBreed" id="petBreed"
							value="${adoptedpetsVO.petBreed}">
					</div>
					<div class="form-group row">
						<label for="adoptedDate">收容日期</label> <input type="text"
							class="form-control" name="adoptedDate" id="adoptedDate"
							value="${adoptedpetsVO.adoptedDate}">
					</div>
					<div class="form-group row">
						<div class="col-3">
							<label for="petPic">收容寵物圖片</label> <input type="file"
								class="form-control-file" name="petPic" id="petPic">
						</div>
						<div class="col uploadimg">
							<img id="picPreview"
								src="<%=request.getContextPath()%>/adoptedpetspic.do?petNo=${adoptedpetsVO.petNo}"
								class="rounded d-block">
						</div>
					</div>
					<input type="hidden" class="form-control" name="adoptDate"
						id="adoptDate" value='${adoptedpetsVO.adoptDate}'> <input
						type="hidden" class="form-control" name="interviewDate"
						id="interviewDate" value='${adoptedpetsVO.interviewDate}'>
					<input type="hidden" class="form-control" name="interviewInfo"
						id="interviewInfo" value='${adoptedpetsVO.interviewInfo}'>

					<div class="form-group row">
						<div class="col-2">寵物類型</div>
						<div class="col-10">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="petSpecies"
									id="petSpecies1" value="犬" checked> <label
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
						</div>
					</div>
					<div class="form-group row">
						<div class="col-2">寵物性別</div>
						<div class="col">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="petGender"
									id="petGender1" value="公" checked> <label
									class="form-check-label" for="petGender1">公</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="petGender"
									id="petGender2" value="母"> <label
									class="form-check-label" for="petGender2">母</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="petStatusText">領養狀態</label> <input type="text"
							class="form-control" name="petStatusText" id="petStatusText"
							readonly value="未領養"> <input type="hidden"
							class="form-control" name="adoptStatus" id="adoptStatus" readonly
							value="0">
					</div>
					<input type="hidden" name="action" value="insert">
					<div class="form-group row justify-content-center">
						<div class="col-3 mx-1 input-group justify-content-center">
							<button type="button" class="btn btn-outline-success" id="text-btn">快速填寫</button>
						</div>
						<div class="col-3 mx-1 input-group justify-content-center">
							<button type="submit" class="btn btn-primary" id="submit-btn">送出</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<%@ include file="/back-end/backEndInclude/footer.jsp"%>
</body>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/back-end/adopt/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/back-end/adopt/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/back-end/adopt/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
	$.datetimepicker.setLocale('zh');

	$('#adoptedDate').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : false, //timepicker:true,
		step : 1, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d', //format:'Y-m-d H:i:s',
		opened : false,
		closeOnWithoutClick : false,
		scrollMonth : false
	});

	$('#adoptDate').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : false, //timepicker:true,
		step : 1, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d', //format:'Y-m-d H:i:s',
		scrollMonth : false
	});

	$('#interviewDate').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : false, //timepicker:true,
		step : 1, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d', //format:'Y-m-d H:i:s',
		scrollMonth : false
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#picPreview').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]); // convert to base64 string
		}
	}

	$("#petPic").change(function() {
		readURL(this);
	});
	
	$(document).ready(function(){
		$('#text-btn').click(function(){
			$('#petBreed').val('忍犬')
		});
	})
</script>